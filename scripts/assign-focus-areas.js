#!/usr/bin/env node

/**
 * GATHER CRM - AI-Powered Focus Area Assignment
 *
 * Finds fellows with no focus area tags and uses Claude API to analyze their
 * bio, title, organization, and program to suggest 1-4 focus areas.
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

const BATCH_SIZE = 4;
const REQUEST_DELAY_MS = 13000; // 13s between requests = ~4.6/min (under 5/min limit)
const RATE_LIMIT_RETRY_MS = 65000; // Wait 65s on rate limit before retrying
const MAX_RETRIES = 2;

const FOCUS_AREA_MAP = {
  FA001: 'Peacebuilding & Conflict Resolution',
  FA002: 'Youth Development & Mentorship',
  FA003: 'Violence Prevention & Intervention',
  FA004: 'Community Organizing & Civic Engagement',
  FA005: 'Education & Academic Support',
  FA006: 'Arts, Culture & Creative Expression',
  FA007: 'Economic Empowerment & Workforce Dev',
  FA008: 'Mental Health & Wellness',
  FA009: 'Trauma-Informed Care & Healing',
  FA010: 'Restorative Justice & Reentry',
  FA011: 'Public Health & Health Equity',
  FA012: 'Environmental Justice & Sustainability',
  FA013: 'Housing & Urban Development',
  FA014: 'Food Security & Nutrition',
  FA015: 'Immigration & Refugee Services',
  FA016: "Gender Equity & Women's Empowerment",
  FA017: 'LGBTQ+ Advocacy & Support',
  FA018: 'Policy & Advocacy',
  FA019: 'Media, Communications & Storytelling',
  FA020: 'Interfaith Dialogue & Spiritual Wellness',
};

const FOCUS_AREA_LIST = Object.entries(FOCUS_AREA_MAP)
  .map(([code, name]) => `${code}: ${name}`)
  .join('\n');

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
    return res.json();
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

  // Step 2: Get all focus area tags (to map names to IDs)
  console.log('Fetching focus area tags...');
  const focusTags = await supabaseRequest(
    `focus_tags?category_id=eq.${focusCategoryId}&select=id,name`
  );
  const tagNameToId = {};
  for (const tag of focusTags) {
    tagNameToId[tag.name] = tag.id;
  }
  console.log(`Found ${Object.keys(tagNameToId).length} focus area tags\n`);

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

  // Step 4: Process fellows in batches
  const summary = {
    processed: 0,
    assigned: 0,
    skipped: 0,
    tagCounts: {},
    errors: 0,
  };

  for (let i = 0; i < fellowsMissingTags.length; i += BATCH_SIZE) {
    const batch = fellowsMissingTags.slice(i, i + BATCH_SIZE);
    console.log(`--- Batch ${Math.floor(i / BATCH_SIZE) + 1}/${Math.ceil(fellowsMissingTags.length / BATCH_SIZE)} ---`);

    for (const fellow of batch) {
      summary.processed++;
      const label = `${fellow.first_name} ${fellow.last_name} (${fellow.program})`;

      // Build the prompt
      const bioInfo = fellow.biography || 'No bio available';
      const titleInfo = fellow.job_title || 'Unknown';
      const orgInfo = fellow.organization || 'Unknown';
      const locationInfo = [fellow.city, fellow.country].filter(Boolean).join(', ') || 'Unknown';

      const prompt = `You are helping categorize alumni fellows for the Goldin Institute alumni network.

Based on the following fellow's information, select the 1-4 most relevant Focus Areas from the list below. Only select areas that clearly match their work or background. If you're unsure, select fewer rather than more.

Fellow Information:
- Name: ${fellow.first_name} ${fellow.last_name}
- Job Title: ${titleInfo}
- Organization: ${orgInfo}
- Program: ${fellow.program}
- Location: ${locationInfo}
- Bio: ${bioInfo}

Available Focus Areas (select 1-4 by code):
${FOCUS_AREA_LIST}

Respond with ONLY a JSON array of selected codes, e.g.: ["FA001", "FA004", "FA018"]
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

        // Parse the response - extract JSON array
        let codes = [];
        try {
          const match = text.match(/\[.*\]/s);
          if (match) {
            codes = JSON.parse(match[0]);
          }
        } catch (parseErr) {
          console.error(`  Parse error for ${label}: ${text}`);
          summary.errors++;
          continue;
        }

        // Validate codes
        const validCodes = codes.filter(c => FOCUS_AREA_MAP[c]);

        if (validCodes.length === 0) {
          console.log(`  ${label}: SKIPPED (insufficient info or no valid codes)`);
          summary.skipped++;
          continue;
        }

        const tagNames = validCodes.map(c => FOCUS_AREA_MAP[c]);
        console.log(`  ${label}: ${tagNames.join(', ')}`);

        // Insert tags
        if (!dryRun) {
          for (const code of validCodes) {
            const tagName = FOCUS_AREA_MAP[code];
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
        for (const code of validCodes) {
          summary.tagCounts[code] = (summary.tagCounts[code] || 0) + 1;
        }
        // Delay between requests to respect rate limit (5/min)
        console.log(`  Waiting ${REQUEST_DELAY_MS / 1000}s before next request...`);
        await new Promise(resolve => setTimeout(resolve, REQUEST_DELAY_MS));
      } catch (err) {
        console.error(`  Error processing ${label}: ${err.message}`);
        summary.errors++;
      }
    }

    console.log('');
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

  for (const [code, count] of sortedTags) {
    console.log(`  ${code} ${FOCUS_AREA_MAP[code]}: ${count}`);
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
