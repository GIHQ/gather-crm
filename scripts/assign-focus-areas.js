#!/usr/bin/env node

/**
 * GATHER CRM - AI-Powered Focus Area Assignment
 *
 * Finds fellows with no focus area tags and uses Claude API to analyze their
 * bio, title, organization, and program to suggest 1-4 focus areas.
 * Tag names are loaded dynamically from the database (not hardcoded).
 *
 * Environment variables required:
 *   SUPABASE_URL - Supabase project URL
 *   SUPABASE_SERVICE_ROLE_KEY - Service role key (bypasses RLS)
 *   ANTHROPIC_API_KEY - Anthropic API key for Claude
 *
 * Usage:
 *   node scripts/assign-focus-areas.js
 *   node scripts/assign-focus-areas.js --dry-run   # Preview without writing
 */

const REQUEST_DELAY_MS = 13000; // 13s between requests = ~4.6/min (under 5/min limit)
const RATE_LIMIT_RETRY_MS = 65000; // Wait 65s on rate limit before retrying
const MAX_RETRIES = 2;

async function main() {
  const dryRun = process.argv.includes('--dry-run');

  const SUPABASE_URL = process.env.SUPABASE_URL;
  const SUPABASE_SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const ANTHROPIC_API_KEY = process.env.ANTHROPIC_API_KEY;

  if (!SUPABASE_URL || !SUPABASE_SERVICE_ROLE_KEY) {
    console.error('Missing SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY environment variables');
    process.exit(1);
  }
  if (!ANTHROPIC_API_KEY) {
    console.error('Missing ANTHROPIC_API_KEY environment variable');
    process.exit(1);
  }

  if (dryRun) {
    console.log('=== DRY RUN MODE - No database writes ===\n');
  }

  // Helper to call Supabase REST API
  async function supabaseRequest(path, options = {}) {
    const url = `${SUPABASE_URL}/rest/v1/${path}`;
    const headers = {
      apikey: SUPABASE_SERVICE_ROLE_KEY,
      Authorization: `Bearer ${SUPABASE_SERVICE_ROLE_KEY}`,
      'Content-Type': 'application/json',
      Prefer: options.prefer || 'return=representation',
      ...options.headers,
    };
    const res = await fetch(url, { ...options, headers });
    if (!res.ok) {
      const text = await res.text();
      throw new Error(`Supabase error (${res.status}): ${text}`);
    }
    const text = await res.text();
    if (!text) return null;
    return JSON.parse(text);
  }

  // Step 1: Get the focus_areas category ID
  console.log('Fetching focus area category...');
  const categories = await supabaseRequest('focus_categories?slug=eq.focus-areas&select=id,name');
  if (!categories || categories.length === 0) {
    console.error('Could not find focus-areas category');
    process.exit(1);
  }
  const focusCategoryId = categories[0].id;
  console.log(`Focus Areas category ID: ${focusCategoryId}`);

  // Step 2: Get all focus area tags from the database (dynamic, not hardcoded)
  console.log('Fetching focus area tags from database...');
  const focusTags = await supabaseRequest(
    `focus_tags?category_id=eq.${focusCategoryId}&select=id,name&order=name`
  );
  const tagNameToId = {};
  const tagIdToName = {};
  for (const tag of focusTags) {
    tagNameToId[tag.name] = tag.id;
    tagIdToName[tag.id] = tag.name;
  }

  const tagNames = Object.keys(tagNameToId);
  console.log(`Found ${tagNames.length} focus area tags in database:`);
  tagNames.forEach((name, i) => console.log(`  ${i + 1}. ${name}`));
  console.log('');

  // Build numbered list for the AI prompt
  const numberedTagList = tagNames.map((name, i) => `${i + 1}. ${name}`).join('\n');

  // Step 3: Find fellows missing focus area tags
  console.log('Finding fellows without focus area tags...');

  // Get all fellow IDs that already have focus area tags
  const existingAssignments = await supabaseRequest(
    `fellow_focus_tags?select=fellow_id,tag_id&tag_id=in.(${focusTags.map(t => `"${t.id}"`).join(',')})`
  );
  const fellowsWithTags = new Set(existingAssignments.map(a => a.fellow_id));

  // Get all fellows
  const allFellows = await supabaseRequest(
    'fellows?select=id,first_name,last_name,biography,job_title,organization,program,city,country&status=eq.Alumni&order=program'
  );

  const fellowsMissingTags = allFellows.filter(f => !fellowsWithTags.has(f.id));
  console.log(`Total fellows: ${allFellows.length}`);
  console.log(`Fellows with focus areas: ${fellowsWithTags.size}`);
  console.log(`Fellows missing focus areas: ${fellowsMissingTags.length}\n`);

  if (fellowsMissingTags.length === 0) {
    console.log('All fellows already have focus area tags assigned. Nothing to do.');
    return;
  }

  // Step 4: Process fellows one at a time with rate limit delays
  const summary = {
    processed: 0,
    assigned: 0,
    skipped: 0,
    tagCounts: {},
    errors: 0,
  };

  for (let i = 0; i < fellowsMissingTags.length; i++) {
    const fellow = fellowsMissingTags[i];
    summary.processed++;
    const label = `[${i + 1}/${fellowsMissingTags.length}] ${fellow.first_name} ${fellow.last_name} (${fellow.program})`;

    // Build the prompt
    const bioInfo = fellow.biography || 'No bio available';
    const titleInfo = fellow.job_title || 'Unknown';
    const orgInfo = fellow.organization || 'Unknown';
    const locationInfo = [fellow.city, fellow.country].filter(Boolean).join(', ') || 'Unknown';

    const prompt = `You are helping categorize alumni fellows for the Goldin Institute alumni network.

Based on the following fellow's information, select the 1-4 most relevant Focus Areas from the numbered list below. Only select areas that clearly match their work or background. If you're unsure, select fewer rather than more.

Fellow Information:
- Name: ${fellow.first_name} ${fellow.last_name}
- Job Title: ${titleInfo}
- Organization: ${orgInfo}
- Program: ${fellow.program}
- Location: ${locationInfo}
- Bio: ${bioInfo}

Available Focus Areas (select 1-4 by number):
${numberedTagList}

Respond with ONLY a JSON array of the selected numbers, e.g.: [1, 4, 18]
If there is insufficient information to make any selection, respond with: []`;

    try {
      // Call Claude API with retry on rate limit
      let data = null;
      for (let attempt = 0; attempt <= MAX_RETRIES; attempt++) {
        const response = await fetch('https://api.anthropic.com/v1/messages', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'x-api-key': ANTHROPIC_API_KEY,
            'anthropic-version': '2023-06-01',
          },
          body: JSON.stringify({
            model: 'claude-sonnet-4-5-20250929',
            max_tokens: 100,
            messages: [{ role: 'user', content: prompt }],
          }),
        });

        if (response.status === 429) {
          if (attempt < MAX_RETRIES) {
            console.log(`  Rate limited for ${label}, waiting 65s before retry (attempt ${attempt + 1}/${MAX_RETRIES})...`);
            await new Promise(resolve => setTimeout(resolve, RATE_LIMIT_RETRY_MS));
            continue;
          }
          console.error(`  Rate limited for ${label} after ${MAX_RETRIES} retries, skipping`);
          summary.errors++;
          data = null;
          break;
        }

        if (!response.ok) {
          const errText = await response.text();
          console.error(`  API error for ${label}: ${response.status} ${errText}`);
          summary.errors++;
          data = null;
          break;
        }

        data = await response.json();
        break;
      }

      if (!data) continue;
      const text = data.content?.[0]?.text?.trim() || '[]';

      // Parse the response - extract JSON array of numbers
      let numbers = [];
      try {
        const match = text.match(/\[.*\]/s);
        if (match) {
          numbers = JSON.parse(match[0]);
        }
      } catch (parseErr) {
        console.error(`  Parse error for ${label}: ${text}`);
        summary.errors++;
        continue;
      }

      // Convert numbers to tag names (1-indexed)
      const selectedTags = numbers
        .filter(n => typeof n === 'number' && n >= 1 && n <= tagNames.length)
        .map(n => tagNames[n - 1]);

      if (selectedTags.length === 0) {
        console.log(`  ${label}: SKIPPED (insufficient info or no valid selections)`);
        summary.skipped++;
        continue;
      }

      console.log(`  ${label}: ${selectedTags.join(', ')}`);

      // Insert tags
      if (!dryRun) {
        for (const tagName of selectedTags) {
          const tagId = tagNameToId[tagName];
          if (!tagId) {
            console.error(`    Tag not found in DB: "${tagName}"`);
            continue;
          }

          await supabaseRequest('fellow_focus_tags', {
            method: 'POST',
            body: JSON.stringify({
              fellow_id: fellow.id,
              tag_id: tagId,
              is_primary: false,
            }),
            prefer: 'return=minimal',
            headers: { Prefer: 'resolution=ignore-duplicates,return=minimal' },
          });
        }
      }

      summary.assigned++;
      for (const tagName of selectedTags) {
        summary.tagCounts[tagName] = (summary.tagCounts[tagName] || 0) + 1;
      }

      // Delay between requests to respect rate limit (5/min)
      if (i < fellowsMissingTags.length - 1) {
        console.log(`  Waiting ${REQUEST_DELAY_MS / 1000}s before next request...`);
        await new Promise(resolve => setTimeout(resolve, REQUEST_DELAY_MS));
      }
    } catch (err) {
      console.error(`  Error processing ${label}: ${err.message}`);
      summary.errors++;
    }
  }

  // Step 5: Print summary
  console.log('\n========== SUMMARY ==========');
  console.log(`Total fellows processed: ${summary.processed}`);
  console.log(`Fellows assigned tags:   ${summary.assigned}`);
  console.log(`Fellows skipped:         ${summary.skipped}`);
  console.log(`Errors:                  ${summary.errors}`);
  console.log('');
  console.log('Tag distribution:');

  const sortedTags = Object.entries(summary.tagCounts)
    .sort((a, b) => b[1] - a[1]);

  for (const [name, count] of sortedTags) {
    console.log(`  ${name}: ${count}`);
  }

  if (dryRun) {
    console.log('\n=== DRY RUN COMPLETE - No changes were written ===');
  } else {
    console.log('\nDone! Focus area tags have been assigned.');
  }
}

main().catch(err => {
  console.error('Fatal error:', err);
  process.exit(1);
});
