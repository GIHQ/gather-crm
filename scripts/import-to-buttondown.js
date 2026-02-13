#!/usr/bin/env node

/**
 * GATHER CRM - Buttondown Subscriber Import
 *
 * Exports all 292 fellows from Supabase and either:
 *   1. Generates a CSV file for bulk import via Buttondown dashboard (default)
 *   2. Uses the Buttondown API to create subscribers directly (--api flag)
 *
 * Each subscriber gets tagged by program (CPF, GGF, ESP) and cohort,
 * with metadata including first_name, last_name, and organization.
 *
 * Environment variables required:
 *   SUPABASE_URL             - Supabase project URL
 *   SUPABASE_SERVICE_ROLE_KEY - Service role key (bypasses RLS)
 *   BUTTONDOWN_API_KEY        - Buttondown API key (only needed with --api flag)
 *
 * Usage:
 *   node scripts/import-to-buttondown.js              # Export CSV (recommended for initial import)
 *   node scripts/import-to-buttondown.js --api        # Use Buttondown API directly
 *   node scripts/import-to-buttondown.js --dry-run    # Preview without writing CSV or calling API
 */

const fs = require('fs');
const path = require('path');

const API_DELAY_MS = 37000; // 37s between requests (~97/hour, under 100/hour limit)
const MAX_RETRIES = 2;

async function main() {
  const dryRun = process.argv.includes('--dry-run');
  const useApi = process.argv.includes('--api');

  const SUPABASE_URL = process.env.SUPABASE_URL;
  const SUPABASE_SERVICE_ROLE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;
  const BUTTONDOWN_API_KEY = process.env.BUTTONDOWN_API_KEY;

  if (!SUPABASE_URL || !SUPABASE_SERVICE_ROLE_KEY) {
    console.error('Missing SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY environment variables');
    process.exit(1);
  }
  if (useApi && !BUTTONDOWN_API_KEY) {
    console.error('Missing BUTTONDOWN_API_KEY environment variable (required with --api flag)');
    process.exit(1);
  }

  if (dryRun) console.log('=== DRY RUN MODE ===\n');

  // Supabase REST helper
  async function supabaseGet(path) {
    const url = `${SUPABASE_URL}/rest/v1/${path}`;
    const res = await fetch(url, {
      headers: {
        apikey: SUPABASE_SERVICE_ROLE_KEY,
        Authorization: `Bearer ${SUPABASE_SERVICE_ROLE_KEY}`,
      },
    });
    if (!res.ok) {
      const errBody = await res.text();
      throw new Error(`Supabase GET error (${res.status}): ${errBody}`);
    }
    return res.json();
  }

  // Step 1: Fetch all fellows with emails
  console.log('Fetching fellows from Supabase...');
  const fellows = await supabaseGet(
    'fellows?select=id,first_name,last_name,email,program,cohort,organization,city,country&status=eq.Alumni&order=program,last_name'
  );

  const withEmail = fellows.filter(f => f.email);
  const withoutEmail = fellows.filter(f => !f.email);

  console.log(`Total fellows: ${fellows.length}`);
  console.log(`With email: ${withEmail.length}`);
  if (withoutEmail.length > 0) {
    console.log(`Without email (skipped): ${withoutEmail.length}`);
    withoutEmail.forEach(f => console.log(`  - ${f.first_name} ${f.last_name} (${f.program})`));
  }
  console.log('');

  // Step 2: Build tags per fellow
  const programCounts = {};
  const cohortCounts = {};

  const subscribers = withEmail.map(f => {
    const tags = [];
    if (f.program) {
      tags.push(f.program);
      programCounts[f.program] = (programCounts[f.program] || 0) + 1;
    }
    if (f.cohort) {
      tags.push(`cohort-${f.cohort}`);
      cohortCounts[f.cohort] = (cohortCounts[f.cohort] || 0) + 1;
    }

    return {
      email: f.email,
      first_name: f.first_name || '',
      last_name: f.last_name || '',
      organization: f.organization || '',
      tags,
      metadata: {
        first_name: f.first_name || '',
        last_name: f.last_name || '',
        organization: f.organization || '',
        program: f.program || '',
        cohort: f.cohort || '',
        city: f.city || '',
        country: f.country || '',
        gather_id: f.id,
      },
    };
  });

  console.log('Program distribution:');
  Object.entries(programCounts).sort().forEach(([p, c]) => console.log(`  ${p}: ${c}`));
  console.log('\nCohort distribution:');
  Object.entries(cohortCounts).sort().forEach(([c, n]) => console.log(`  ${c}: ${n}`));
  console.log('');

  if (dryRun) {
    console.log('=== DRY RUN COMPLETE ===');
    console.log(`Would ${useApi ? 'create via API' : 'export CSV for'} ${subscribers.length} subscribers`);
    return;
  }

  if (useApi) {
    await importViaApi(subscribers, BUTTONDOWN_API_KEY);
  } else {
    exportCsv(subscribers);
  }
}

/**
 * Export subscribers to a CSV file for bulk import via Buttondown dashboard.
 * Buttondown CSV import accepts: email, metadata (JSON), tags, notes.
 * See: https://docs.buttondown.com/importing-your-data
 */
function exportCsv(subscribers) {
  // Buttondown's CSV import supports: email, notes, metadata, tags
  // Tags should be semicolon-separated
  const header = 'email,tags,notes,metadata';
  const rows = subscribers.map(s => {
    const tags = s.tags.join(';');
    const notes = `${s.first_name} ${s.last_name} — ${s.organization}`.replace(/"/g, '""');
    const metadata = JSON.stringify(s.metadata).replace(/"/g, '""');
    return `${s.email},"${tags}","${notes}","${metadata}"`;
  });

  const csv = [header, ...rows].join('\n');
  const outPath = path.join(__dirname, '..', 'buttondown-import.csv');
  fs.writeFileSync(outPath, csv, 'utf8');

  console.log(`CSV exported to: ${outPath}`);
  console.log(`${subscribers.length} subscribers ready for import.`);
  console.log('\nNext steps:');
  console.log('  1. Log in to Buttondown (https://buttondown.com/settings)');
  console.log('  2. Go to Subscribers → Import');
  console.log('  3. Upload buttondown-import.csv');
  console.log('  4. Set BUTTONDOWN_API_KEY in Supabase Edge Function secrets');
}

/**
 * Import subscribers via the Buttondown API.
 * Rate limited to 100/hour — this will take ~3 hours for 292 fellows.
 */
async function importViaApi(subscribers, apiKey) {
  console.log(`Importing ${subscribers.length} subscribers via API...`);
  console.log(`Rate limit: 100/hour. Estimated time: ~${Math.ceil(subscribers.length * API_DELAY_MS / 60000)} minutes.\n`);

  const summary = { created: 0, skipped: 0, errors: 0 };

  for (let i = 0; i < subscribers.length; i++) {
    const s = subscribers[i];
    const label = `[${i + 1}/${subscribers.length}] ${s.email}`;

    try {
      const res = await fetch('https://api.buttondown.com/v1/subscribers', {
        method: 'POST',
        headers: {
          Authorization: `Token ${apiKey}`,
          'Content-Type': 'application/json',
          'X-Buttondown-Collision-Behavior': 'add',
        },
        body: JSON.stringify({
          email_address: s.email,
          type: 'regular', // Skip double opt-in for existing org members
          tags: s.tags,
          metadata: s.metadata,
          notes: `${s.first_name} ${s.last_name} — ${s.organization}`,
        }),
      });

      if (res.status === 201 || res.status === 200) {
        console.log(`  ${label} — created`);
        summary.created++;
      } else if (res.status === 409) {
        console.log(`  ${label} — already exists (skipped)`);
        summary.skipped++;
      } else if (res.status === 429) {
        console.log(`  ${label} — rate limited, waiting 65s...`);
        await new Promise(r => setTimeout(r, 65000));
        i--; // Retry this subscriber
        continue;
      } else {
        const errBody = await res.text();
        console.error(`  ${label} — error ${res.status}: ${errBody}`);
        summary.errors++;
      }

      // Rate limit delay
      if (i < subscribers.length - 1) {
        await new Promise(r => setTimeout(r, API_DELAY_MS));
      }
    } catch (err) {
      console.error(`  ${label} — ${err.message}`);
      summary.errors++;
    }
  }

  console.log('\n========== SUMMARY ==========');
  console.log(`Created:  ${summary.created}`);
  console.log(`Skipped:  ${summary.skipped}`);
  console.log(`Errors:   ${summary.errors}`);
}

main().catch(err => {
  console.error('Fatal error:', err);
  process.exit(1);
});
