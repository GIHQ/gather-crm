#!/usr/bin/env node
/**
 * GATHER v1 → v2 Data Migration
 *
 * Reads all data from the v1 Supabase project and inserts it into v2.
 *
 * Tables migrated:
 *   fellows         → contacts (with legacy_id)
 *   team_members    → contacts + contact_roles
 *   interactions    → interactions (fellow_id text → contact_id uuid)
 *   activities      → activities (fellow_id text → contact_id uuid)
 *   focus_categories, focus_tags → already seeded, just verify
 *   fellow_focus_tags → contact_focus_tags
 *   sites           → cohorts (status='archived' for past years, 'live' for 2026)
 *   events, event_attendance, curricula, curriculum_chapters, curriculum_items,
 *   fellow_curriculum_progress, fellow_platform_activity, adhoc_lists,
 *   adhoc_list_entries
 *
 * Usage:
 *   cd v2 && node ../migrations/v2/migrate-v1-to-v2.mjs
 */

import { createClient } from '@supabase/supabase-js'

// ─── v1 credentials (from index.html, public anon key) ───
const V1_URL = 'https://pwazurumpzydxyppbvee.supabase.co'
const V1_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB3YXp1cnVtcHp5ZHh5cHBidmVlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MjM3MDUsImV4cCI6MjA4NTA5OTcwNX0.iGLmSpTPM84lMGGizSfBnkDCvpMZaJVaFhcRJ9cYDrs'

// ─── v2 credentials (service role to bypass RLS) ───
const V2_URL = 'https://ollexkvipnkkyzejmahh.supabase.co'
const V2_SERVICE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9sbGV4a3ZpcG5ra3l6ZWptYWhoIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3MTE3NDc2MiwiZXhwIjoyMDg2NzUwNzYyfQ.YN9ZdQ9PznzLO8jILpRb7AslvADuYjLIiY2gRk75Afo'

const v1 = createClient(V1_URL, V1_ANON_KEY)
const v2 = createClient(V2_URL, V2_SERVICE_KEY)

// Map from v1 fellow text ID → v2 contact uuid
const fellowIdMap = new Map()
// Map from v1 team_member uuid → v2 contact uuid
const teamIdMap = new Map()
// Map from v1 site uuid → v2 cohort uuid
const siteIdMap = new Map()
// Map from v1 event uuid → v2 event uuid
const eventIdMap = new Map()
// Map from v1 focus_tag uuid → v2 focus_tag uuid
const tagIdMap = new Map()
// Map from v1 curriculum uuid → v2 curriculum uuid
const curriculumIdMap = new Map()
// Map from v1 chapter uuid → v2 chapter uuid
const chapterIdMap = new Map()
// Map from v1 item uuid → v2 item uuid
const itemIdMap = new Map()
// Map from v1 adhoc_list uuid → v2 adhoc_list uuid
const listIdMap = new Map()

let stats = {}

function log(msg) {
  console.log(`  ${msg}`)
}

function logSection(title) {
  console.log(`\n━━━ ${title} ━━━`)
}

async function fetchAll(client, table, options = {}) {
  const query = client.from(table).select(options.select || '*')
  if (options.order) query.order(options.order)
  const { data, error } = await query
  if (error) {
    console.error(`  ERROR fetching ${table}:`, error.message)
    return []
  }
  return data || []
}

// ─────────────────────────────────────────────────
// 1. FELLOWS → CONTACTS
// ─────────────────────────────────────────────────
async function migrateFellows() {
  logSection('Fellows → Contacts')
  const fellows = await fetchAll(v1, 'fellows')
  log(`Found ${fellows.length} fellows in v1`)

  if (fellows.length === 0) return

  const contacts = fellows.map(f => ({
    legacy_id: f.id,
    first_name: f.first_name,
    last_name: f.last_name,
    email: f.email,
    work_email: f.work_email || null,
    alternate_emails: f.alternate_emails || [],
    phone: f.phone || null,
    birthday: f.birthday || null,
    gender: f.gender || null,
    hide_birthday_year: f.hide_birthday_year || false,
    photo_url: f.photo_url || null,
    biography: f.biography || null,
    languages: f.languages || null,
    city: f.city || null,
    country: f.country || null,
    region: f.region || null,
    sub_region: f.sub_region || null,
    community_area: f.community_area || null,
    organization: f.organization || null,
    job_title: f.job_title || null,
    program: f.program || null,
    cohort: f.cohort || null,
    status: f.status || 'Alumni',
    linkedin: f.linkedin || null,
    twitter: f.twitter || null,
    instagram: f.instagram || null,
    facebook: f.facebook || null,
    website: f.website || null,
    tiktok: f.tiktok || null,
    linkedin_org: f.linkedin_org || null,
    twitter_org: f.twitter_org || null,
    instagram_org: f.instagram_org || null,
    facebook_org: f.facebook_org || null,
    website_org: f.website_org || null,
    working_on: f.working_on || null,
    working_on_updated_at: f.working_on_updated_at || null,
    last_contact: f.last_contact || null,
    last_news_search: f.last_news_search || null,
    staff_notes: f.staff_notes || null,
    focus_area_1: f.focus_area_1 || null,
    focus_area_2: f.focus_area_2 || null,
    focus_area_3: f.focus_area_3 || null,
    is_active: true,
  }))

  // Insert in batches of 100
  let inserted = 0
  for (let i = 0; i < contacts.length; i += 100) {
    const batch = contacts.slice(i, i + 100)
    const { data, error } = await v2
      .from('contacts')
      .upsert(batch, { onConflict: 'legacy_id', ignoreDuplicates: false })
      .select('id, legacy_id')

    if (error) {
      console.error(`  ERROR inserting fellows batch ${i}:`, error.message)
      // Try one-by-one for the failed batch
      for (const c of batch) {
        const { data: single, error: singleErr } = await v2
          .from('contacts')
          .upsert(c, { onConflict: 'legacy_id', ignoreDuplicates: false })
          .select('id, legacy_id')
        if (singleErr) {
          console.error(`    SKIP ${c.first_name} ${c.last_name}: ${singleErr.message}`)
        } else if (single?.[0]) {
          fellowIdMap.set(single[0].legacy_id, single[0].id)
          inserted++
        }
      }
    } else if (data) {
      for (const row of data) {
        fellowIdMap.set(row.legacy_id, row.id)
      }
      inserted += data.length
    }
  }

  // Also fetch any already-existing contacts with legacy_ids to fill the map
  const { data: existing } = await v2
    .from('contacts')
    .select('id, legacy_id')
    .not('legacy_id', 'is', null)
  if (existing) {
    for (const row of existing) {
      fellowIdMap.set(row.legacy_id, row.id)
    }
  }

  stats.fellows = inserted
  log(`Migrated ${inserted} fellows → contacts (${fellowIdMap.size} in ID map)`)
}

// ─────────────────────────────────────────────────
// 2. TEAM MEMBERS → CONTACTS + CONTACT_ROLES
// ─────────────────────────────────────────────────
async function migrateTeamMembers() {
  logSection('Team Members → Contacts + Contact Roles')
  const team = await fetchAll(v1, 'team_members')
  log(`Found ${team.length} team members in v1`)

  if (team.length === 0) return

  let inserted = 0
  let rolesInserted = 0

  for (const t of team) {
    // Check if this team member already exists as a fellow (by email)
    const { data: existing } = await v2
      .from('contacts')
      .select('id')
      .ilike('email', t.email)
      .limit(1)
      .single()

    let contactId
    if (existing) {
      // Update existing fellow record with team member data
      contactId = existing.id
      const updates = {}
      if (t.photo_url) updates.photo_url = t.photo_url
      if (t.bio) updates.biography = t.bio
      if (t.phone) updates.phone = t.phone
      if (t.linkedin_url) updates.linkedin = t.linkedin_url
      if (t.title) updates.job_title = t.title
      if (t.fellowships) updates.fellowships = t.fellowships
      if (t.staff_notes) updates.staff_notes = t.staff_notes

      if (Object.keys(updates).length > 0) {
        await v2.from('contacts').update(updates).eq('id', contactId)
      }

      teamIdMap.set(t.id, contactId)
      log(`  Merged team member ${t.first_name} ${t.last_name} with existing contact`)
    } else {
      // Create new contact for this team member
      const contact = {
        first_name: t.first_name,
        last_name: t.last_name,
        email: t.email,
        alternate_emails: t.alternate_emails || [],
        phone: t.phone || null,
        photo_url: t.photo_url || null,
        biography: t.bio || null,
        job_title: t.title || null,
        linkedin: t.linkedin_url || null,
        fellowships: t.fellowships || null,
        staff_notes: t.staff_notes || null,
        status: 'Staff',
        is_active: t.is_active !== false,
      }

      const { data, error } = await v2
        .from('contacts')
        .insert(contact)
        .select('id')
        .single()

      if (error) {
        console.error(`  ERROR inserting team member ${t.first_name}: ${error.message}`)
        continue
      }

      contactId = data.id
      teamIdMap.set(t.id, contactId)
      inserted++
    }

    // Add role
    if (contactId && t.role) {
      const { error: roleErr } = await v2
        .from('contact_roles')
        .upsert(
          { contact_id: contactId, role: t.role },
          { onConflict: 'contact_id,role' }
        )

      if (roleErr) {
        console.error(`  ERROR adding role for ${t.first_name}: ${roleErr.message}`)
      } else {
        rolesInserted++
      }
    }
  }

  stats.teamMembers = inserted
  stats.roles = rolesInserted
  log(`Inserted ${inserted} new team contacts, assigned ${rolesInserted} roles`)
}

// ─────────────────────────────────────────────────
// 3. SITES → COHORTS (match or create)
// ─────────────────────────────────────────────────
async function migrateSites() {
  logSection('Sites → Cohorts')
  const sites = await fetchAll(v1, 'sites')
  log(`Found ${sites.length} sites in v1`)

  if (sites.length === 0) return

  // Get existing v2 cohorts (we already seeded 2026 ones)
  const { data: existingCohorts } = await v2.from('cohorts').select('id, name, program, cohort_year')
  const existing = existingCohorts || []

  let matched = 0
  let created = 0

  for (const s of sites) {
    // Try to match by program + year
    const match = existing.find(
      c => c.program === s.program && c.cohort_year === s.cohort_year
    )

    if (match) {
      siteIdMap.set(s.id, match.id)
      matched++
      log(`  Matched site "${s.name}" → cohort "${match.name}"`)
    } else {
      // Create new cohort (archived for past years)
      const cohort = {
        name: s.name,
        program: s.program,
        city: s.city || null,
        country: s.country || null,
        cohort_year: s.cohort_year || 2026,
        status: (s.cohort_year || 2026) < 2026 ? 'archived' : 'live',
      }

      const { data, error } = await v2
        .from('cohorts')
        .insert(cohort)
        .select('id')
        .single()

      if (error) {
        console.error(`  ERROR creating cohort for site ${s.name}: ${error.message}`)
      } else {
        siteIdMap.set(s.id, data.id)
        created++
        log(`  Created cohort "${s.name}" (${cohort.status})`)
      }
    }
  }

  // Also create cohort_members for fellows that have a site_id
  logSection('Fellow → Cohort Memberships')
  const fellowsWithSite = await fetchAll(v1, 'fellows', { select: 'id, site_id' })
  let memberships = 0

  for (const f of fellowsWithSite) {
    if (!f.site_id) continue
    const contactId = fellowIdMap.get(f.id)
    const cohortId = siteIdMap.get(f.site_id)
    if (!contactId || !cohortId) continue

    const { error } = await v2
      .from('cohort_members')
      .upsert(
        { contact_id: contactId, cohort_id: cohortId, role: 'fellow' },
        { onConflict: 'contact_id,cohort_id' }
      )
    if (!error) memberships++
  }

  stats.cohortsMatched = matched
  stats.cohortsCreated = created
  stats.cohortMemberships = memberships
  log(`Matched ${matched}, created ${created} cohorts, ${memberships} memberships`)
}

// ─────────────────────────────────────────────────
// 4. INTERACTIONS
// ─────────────────────────────────────────────────
async function migrateInteractions() {
  logSection('Interactions')
  const interactions = await fetchAll(v1, 'interactions')
  log(`Found ${interactions.length} interactions in v1`)

  if (interactions.length === 0) return

  const rows = interactions
    .filter(i => fellowIdMap.has(i.fellow_id))
    .map(i => ({
      contact_id: fellowIdMap.get(i.fellow_id),
      interaction_type: i.interaction_type,
      interaction_date: i.interaction_date,
      title: i.title || null,
      notes: i.notes || null,
    }))

  let inserted = 0
  for (let i = 0; i < rows.length; i += 100) {
    const batch = rows.slice(i, i + 100)
    const { data, error } = await v2.from('interactions').insert(batch).select('id')
    if (error) {
      console.error(`  ERROR inserting interactions batch: ${error.message}`)
    } else {
      inserted += (data?.length || 0)
    }
  }

  stats.interactions = inserted
  log(`Migrated ${inserted} interactions`)
}

// ─────────────────────────────────────────────────
// 5. ACTIVITIES
// ─────────────────────────────────────────────────
async function migrateActivities() {
  logSection('Activities')
  const activities = await fetchAll(v1, 'activities')
  log(`Found ${activities.length} activities in v1`)

  if (activities.length === 0) return

  const rows = activities
    .filter(a => fellowIdMap.has(a.fellow_id))
    .map(a => ({
      contact_id: fellowIdMap.get(a.fellow_id),
      activity_type: a.activity_type,
      source_name: a.source_name || null,
      source_url: a.source_url || null,
      source_domain: a.source_domain || null,
      title: a.title || null,
      snippet: a.snippet || null,
      image_url: a.image_url || null,
      published_at: a.published_at || null,
      discovered_at: a.discovered_at || null,
      search_query: a.search_query || null,
      relevance_score: a.relevance_score || null,
      verified: a.verified || false,
      dismissed: a.dismissed || false,
      notified: a.notified || false,
    }))

  let inserted = 0
  for (let i = 0; i < rows.length; i += 100) {
    const batch = rows.slice(i, i + 100)
    const { data, error } = await v2.from('activities').insert(batch).select('id')
    if (error) {
      console.error(`  ERROR inserting activities batch: ${error.message}`)
    } else {
      inserted += (data?.length || 0)
    }
  }

  stats.activities = inserted
  log(`Migrated ${inserted} activities`)
}

// ─────────────────────────────────────────────────
// 6. FOCUS TAGS (map IDs)
// ─────────────────────────────────────────────────
async function migrateFocusTags() {
  logSection('Focus Tags')

  const v1Tags = await fetchAll(v1, 'focus_tags')
  const v2Tags = await fetchAll(v2, 'focus_tags')
  const v1Cats = await fetchAll(v1, 'focus_categories')
  const v2Cats = await fetchAll(v2, 'focus_categories')

  log(`v1: ${v1Cats.length} categories, ${v1Tags.length} tags`)
  log(`v2: ${v2Cats.length} categories, ${v2Tags.length} tags`)

  // Map v1 category id → v2 category id by slug
  const catIdMap = new Map()
  for (const v1c of v1Cats) {
    const v2c = v2Cats.find(c => c.slug === v1c.slug)
    if (v2c) catIdMap.set(v1c.id, v2c.id)
  }

  // For each v1 tag, find or create in v2
  let mapped = 0
  let created = 0

  for (const t of v1Tags) {
    const v2CatId = catIdMap.get(t.category_id)
    if (!v2CatId) continue

    // Try match by slug + category
    const match = v2Tags.find(
      v2t => v2t.slug === t.slug && v2t.category_id === v2CatId
    )

    if (match) {
      tagIdMap.set(t.id, match.id)
      mapped++
    } else {
      const { data, error } = await v2
        .from('focus_tags')
        .insert({
          category_id: v2CatId,
          name: t.name,
          slug: t.slug,
          emoji: t.emoji || null,
          approved: true,
        })
        .select('id')
        .single()

      if (!error && data) {
        tagIdMap.set(t.id, data.id)
        created++
      }
    }
  }

  // Now migrate fellow_focus_tags → contact_focus_tags
  const fft = await fetchAll(v1, 'fellow_focus_tags')
  log(`Found ${fft.length} fellow-tag assignments`)

  const rows = fft
    .filter(r => fellowIdMap.has(r.fellow_id) && tagIdMap.has(r.tag_id))
    .map(r => ({
      contact_id: fellowIdMap.get(r.fellow_id),
      tag_id: tagIdMap.get(r.tag_id),
      is_primary: r.is_primary || false,
    }))

  let tagAssigned = 0
  for (let i = 0; i < rows.length; i += 100) {
    const batch = rows.slice(i, i + 100)
    const { data, error } = await v2
      .from('contact_focus_tags')
      .upsert(batch, { onConflict: 'contact_id,tag_id' })
      .select('id')
    if (!error) tagAssigned += (data?.length || 0)
  }

  stats.tagsMapped = mapped
  stats.tagsCreated = created
  stats.tagAssignments = tagAssigned
  log(`Mapped ${mapped}, created ${created} tags, ${tagAssigned} assignments`)
}

// ─────────────────────────────────────────────────
// 7. EVENTS + ATTENDANCE
// ─────────────────────────────────────────────────
async function migrateEvents() {
  logSection('Events + Attendance')
  const events = await fetchAll(v1, 'events')
  log(`Found ${events.length} events in v1`)

  if (events.length === 0) return

  let evInserted = 0
  for (const e of events) {
    const cohortId = siteIdMap.get(e.site_id)
    if (!cohortId) continue

    const { data, error } = await v2
      .from('events')
      .insert({
        cohort_id: cohortId,
        title: e.title,
        description: e.description || null,
        location: e.location || null,
        meeting_link: e.meeting_link || null,
        start_time: e.start_time || null,
        end_time: e.end_time || null,
        notes: e.notes || null,
        facilitator: e.facilitator || null,
        event_type: e.event_type || 'workshop',
        is_required: e.is_required !== false,
      })
      .select('id')
      .single()

    if (!error && data) {
      eventIdMap.set(e.id, data.id)
      evInserted++
    }
  }

  // Attendance
  const attendance = await fetchAll(v1, 'event_attendance')
  log(`Found ${attendance.length} attendance records`)

  const attRows = attendance
    .filter(a => eventIdMap.has(a.event_id) && fellowIdMap.has(a.fellow_id))
    .map(a => ({
      event_id: eventIdMap.get(a.event_id),
      contact_id: fellowIdMap.get(a.fellow_id),
      status: a.status,
      notes: a.notes || null,
    }))

  let attInserted = 0
  for (let i = 0; i < attRows.length; i += 100) {
    const batch = attRows.slice(i, i + 100)
    const { data, error } = await v2
      .from('event_attendance')
      .upsert(batch, { onConflict: 'event_id,contact_id' })
      .select('id')
    if (!error) attInserted += (data?.length || 0)
  }

  stats.events = evInserted
  stats.attendance = attInserted
  log(`Migrated ${evInserted} events, ${attInserted} attendance records`)
}

// ─────────────────────────────────────────────────
// 8. CURRICULUM
// ─────────────────────────────────────────────────
async function migrateCurricula() {
  logSection('Curricula')
  const curricula = await fetchAll(v1, 'curricula')
  log(`Found ${curricula.length} curricula in v1`)

  if (curricula.length === 0) return

  for (const c of curricula) {
    const cohortId = siteIdMap.get(c.site_id)
    if (!cohortId) continue

    const { data, error } = await v2
      .from('curricula')
      .insert({ cohort_id: cohortId, name: c.name, year: c.year })
      .select('id')
      .single()
    if (!error && data) curriculumIdMap.set(c.id, data.id)
  }

  // Chapters
  const chapters = await fetchAll(v1, 'curriculum_chapters')
  for (const ch of chapters) {
    const currId = curriculumIdMap.get(ch.curriculum_id)
    if (!currId) continue

    const { data, error } = await v2
      .from('curriculum_chapters')
      .insert({
        curriculum_id: currId,
        title: ch.title,
        description: ch.description || null,
        order_num: ch.order_num || 0,
      })
      .select('id')
      .single()
    if (!error && data) chapterIdMap.set(ch.id, data.id)
  }

  // Items
  const items = await fetchAll(v1, 'curriculum_items')
  for (const it of items) {
    const chapId = chapterIdMap.get(it.chapter_id)
    if (!chapId) continue

    const { data, error } = await v2
      .from('curriculum_items')
      .insert({
        chapter_id: chapId,
        item_type: it.item_type,
        title: it.title,
        description: it.description || null,
        due_date: it.due_date || null,
        order_num: it.order_num || 0,
      })
      .select('id')
      .single()
    if (!error && data) itemIdMap.set(it.id, data.id)
  }

  // Progress
  const progress = await fetchAll(v1, 'fellow_curriculum_progress')
  const progRows = progress
    .filter(p => fellowIdMap.has(p.fellow_id) && itemIdMap.has(p.item_id))
    .map(p => ({
      contact_id: fellowIdMap.get(p.fellow_id),
      item_id: itemIdMap.get(p.item_id),
      completed: p.completed || false,
      completed_at: p.completed_at || null,
    }))

  let progInserted = 0
  for (let i = 0; i < progRows.length; i += 100) {
    const batch = progRows.slice(i, i + 100)
    const { data, error } = await v2
      .from('contact_curriculum_progress')
      .upsert(batch, { onConflict: 'contact_id,item_id' })
      .select('id')
    if (!error) progInserted += (data?.length || 0)
  }

  // Platform activity
  const activity = await fetchAll(v1, 'fellow_platform_activity')
  const actRows = activity
    .filter(a => fellowIdMap.has(a.fellow_id))
    .map(a => ({
      contact_id: fellowIdMap.get(a.fellow_id),
      activity_date: a.activity_date,
      login_count: a.login_count || 1,
    }))

  let actInserted = 0
  for (let i = 0; i < actRows.length; i += 100) {
    const batch = actRows.slice(i, i + 100)
    const { data, error } = await v2
      .from('contact_platform_activity')
      .upsert(batch, { onConflict: 'contact_id,activity_date' })
      .select('id')
    if (!error) actInserted += (data?.length || 0)
  }

  stats.curricula = curriculumIdMap.size
  stats.chapters = chapterIdMap.size
  stats.items = itemIdMap.size
  stats.progress = progInserted
  stats.platformActivity = actInserted
  log(`Curricula: ${curriculumIdMap.size}, Chapters: ${chapterIdMap.size}, Items: ${itemIdMap.size}`)
  log(`Progress: ${progInserted}, Platform activity: ${actInserted}`)
}

// ─────────────────────────────────────────────────
// 9. AD HOC LISTS
// ─────────────────────────────────────────────────
async function migrateAdhocLists() {
  logSection('Ad Hoc Lists')
  const lists = await fetchAll(v1, 'adhoc_lists')
  log(`Found ${lists.length} ad hoc lists in v1`)

  if (lists.length === 0) return

  for (const l of lists) {
    const cohortId = siteIdMap.get(l.site_id)
    if (!cohortId) continue

    const { data, error } = await v2
      .from('adhoc_lists')
      .insert({
        cohort_id: cohortId,
        name: l.name,
        description: l.description || null,
        fields: l.fields || [],
      })
      .select('id')
      .single()
    if (!error && data) listIdMap.set(l.id, data.id)
  }

  const entries = await fetchAll(v1, 'adhoc_list_entries')
  const entryRows = entries
    .filter(e => listIdMap.has(e.list_id) && fellowIdMap.has(e.fellow_id))
    .map(e => ({
      list_id: listIdMap.get(e.list_id),
      contact_id: fellowIdMap.get(e.fellow_id),
      data: e.data || {},
    }))

  let inserted = 0
  for (let i = 0; i < entryRows.length; i += 100) {
    const batch = entryRows.slice(i, i + 100)
    const { data, error } = await v2
      .from('adhoc_list_entries')
      .upsert(batch, { onConflict: 'list_id,contact_id' })
      .select('id')
    if (!error) inserted += (data?.length || 0)
  }

  stats.adhocLists = listIdMap.size
  stats.adhocEntries = inserted
  log(`Migrated ${listIdMap.size} lists, ${inserted} entries`)
}

// ─────────────────────────────────────────────────
// MAIN
// ─────────────────────────────────────────────────
async function main() {
  console.log('╔══════════════════════════════════════════╗')
  console.log('║   GATHER v1 → v2 Data Migration         ║')
  console.log('╚══════════════════════════════════════════╝')

  const start = Date.now()

  // Test connections
  const { count: v1Count } = await v1.from('fellows').select('id', { count: 'exact', head: true })
  const { count: v2Count } = await v2.from('contacts').select('id', { count: 'exact', head: true })
  console.log(`\nv1 fellows: ${v1Count}, v2 contacts (before): ${v2Count}`)

  await migrateFellows()
  await migrateTeamMembers()
  await migrateSites()
  await migrateInteractions()
  await migrateActivities()
  await migrateFocusTags()
  await migrateEvents()
  await migrateCurricula()
  await migrateAdhocLists()

  // Final count
  const { count: v2After } = await v2.from('contacts').select('id', { count: 'exact', head: true })

  logSection('SUMMARY')
  console.log(`  v2 contacts (after): ${v2After}`)
  console.log(`  Duration: ${((Date.now() - start) / 1000).toFixed(1)}s`)
  console.log('  Stats:', JSON.stringify(stats, null, 2))
  console.log('\n✓ Migration complete.')
}

main().catch(err => {
  console.error('\nFATAL:', err)
  process.exit(1)
})
