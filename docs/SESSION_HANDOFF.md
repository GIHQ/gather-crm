# GATHER Session Handoff

**Read this first.** This document gives any Claude session immediate context to continue work on GATHER.

---

## Quick Context

GATHER is an alumni CRM for the Goldin Institute managing 292 fellows across 3 programs (CPF, GGF, ESP). It's a mobile-first PWA built as a single HTML file with React, hosted on Netlify, backed by Supabase.

| Resource | URL |
|----------|-----|
| Live site | https://gathertracker.netlify.app |
| Supabase | https://supabase.com/dashboard/project/pwazurumpzydxyppbvee |
| GitHub | https://github.com/GIHQ/gather-crm |

---

## Current State (Updated Feb 10, 2026 - Evening)

### Recently Completed
- **Community Platform Phase 2a COMPLETE:**
  - Community tables created: `announcements`, `resources`, `newsletter_sends`, `stream_tokens`
  - `stream-token` Edge Function deployed (mints GetStream JWTs, caches 24hr)
  - `working_on` field added to fellows table
  - Community page built with Feed / Resources / Newsletter tabs
  - Staff can post announcements and add resources
  - Newsletter tab logs sends (Buttondown API integration pending)
- Auth session persistence fixed (explicit Supabase auth options with `storageKey: 'gather-auth'`)
- Translation system secured (requires auth token, JWT verification ON for translate Edge Function)
- Notification settings UI fixed: toggle contrast + overflow on mobile
- **News scanner fully working** — scans all 292 fellows in batches of 5
- Custom search terms for news scanner (stored in `app_settings` table)
- `is_admin()` SECURITY DEFINER function created
- **Focus area tags assigned to 274/292 fellows** (94% coverage)
- GetStream account created, API keys stored in Supabase + Netlify
- Buttondown account created, API key stored in Supabase
- All 292 fellow photos uploaded and linked
- Focus Areas system working (Skills, Populations, Focus Areas, Community Areas)
- Team Management page (admin+ can manage staff accounts)
- **11 team members imported** with full bios, photos, fellowship links
- Directory shows Team members with silver "Team" badge
- Profile claiming flow with approval queue
- Self-editing profiles + admin editing with staff notes

### In Progress
- **Community Platform Phase 2b** — Discovery features (activity feed, enhanced search, fellow spotlight)

### Known Issues
- News scanner Edge Function must be deployed via Supabase dashboard (user does not have CLI) — current version is live and working
- Edge Function JWT verification must be OFF (toggle in dashboard) after any redeployment
- News scanner processed ~75-90 of 292 fellows before Edge Function timeout; can be re-run to pick up remaining
- 18 fellows still missing focus area tags (sparse bios, no keyword matches) — can be assigned manually

---

## TODO Tracker

### 🔴 Immediate (This Week)
- [x] Create community tables in Supabase ✅
- [x] Create stream-token Edge Function ✅
- [x] Build Community tab components ✅
- [ ] Import 292 fellow emails to Buttondown
- [ ] Wire newsletter composer to Buttondown API (create Edge Function)
- [ ] Test end-to-end newsletter sending

### 🟡 Short-Term (Next 2 Weeks)
- [ ] GetStream activity feed integration
- [ ] Enhanced directory search & filters
- [ ] Fellow spotlight feature
- [ ] Push notification support (see ROADMAP.md for implementation notes)

### 🟢 Medium-Term (This Month)
- [ ] Weekly digest email (automated)
- [ ] Reactions/comments on announcements
- [ ] Direct messaging (Stream Chat)

### 🔵 Long-Term (See ROADMAP.md)
- [ ] Program-specific channels
- [ ] Mentorship matching
- [ ] Analytics dashboard

---

## Critical Technical Notes

### Edge Function Deployment
- User (Travis) deploys Edge Functions via **Supabase dashboard** (no CLI installed)
- JWT Verification settings per function:
  - `search-news`: OFF (uses anon key)
  - `stream-token`: OFF (uses anon key, validates auth internally)
  - `translate`: **ON** (requires user auth token for security)
- News scanner processes fellows in **batches of 5** from the frontend to avoid compute/timeout limits

### RLS Patterns
- Use `auth.uid() IS NOT NULL` for authenticated checks (NOT `auth.role() = 'authenticated'`)
- Use `is_admin()` SECURITY DEFINER function when checking team_members roles (avoids infinite recursion)
- The `is_admin()` function is used by both `app_settings` and `team_members` policies

### Database Schema vs Docs
The `DATABASE_SCHEMA.md` has inaccurate column names. Actual fellows columns:
- `status` (not `is_active`) — all 292 have status = 'Alumni'
- `biography` (not `bio`), `job_title` (not `title`), `cohort` (not `cohort_year`)
- No `fellow_id` column exists

---

## Environment Variables (All Configured)

**Supabase Edge Function Secrets:**
SUPABASE_URL, SUPABASE_ANON_KEY, SUPABASE_SERVICE_ROLE_KEY, SUPABASE_DB_URL, SERPAPI_KEY, GOOGLE_TRANSLATE_API_KEY, BUTTONDOWN_API_KEY, GETSTREAM_API_KEY, GETSTREAM_SECRET

**Netlify:** GETSTREAM_API_KEY

---

## Key Files

| File | Purpose |
|------|---------|
| `index.html` | Main app — all React components embedded |
| `docs/ARCHITECTURE.md` | System overview |
| `docs/DATABASE_SCHEMA.md` | All tables and relationships |
| `docs/STYLE_GUIDE.md` | Colors, fonts, component patterns |
| `docs/ROADMAP.md` | Long-term project roadmap and phase tracking |
| `docs/GATHER_COMMUNITY_PLAN.md` | Community platform product plan |
| `docs/TEAM_MANAGEMENT_SPEC.md` | Team members in directory + admin page |
| `docs/PROFILE_CLAIMING_SPEC.md` | Identity matching + profile claiming |
| `migrations/008_team_members.sql` | Team members table + alternate_emails |
| `migrations/009_profile_claims.sql` | Profile claim requests table |
| `migrations/011_team_import.sql` | 11 staff members imported |
| `migrations/012_app_settings.sql` | App settings key-value table |
| `scripts/assign-focus-areas.js` | AI-powered focus area assignment (Node.js, needs API keys) |
| `scripts/assign-focus-areas.sql` | SQL keyword-based focus area assignment (paste into Supabase SQL editor) |

---

## Team Management

Team members (Goldin Institute staff) are stored in the `team_members` table:
- Displayed in Directory with silver "Team" badge (`bg-gray-400 text-white`)
- Staff who are also fellows show dual badges (e.g., Team + GGF '18)
- Managed via Settings > Team Management (admin+ only)
- Roles: super_admin, admin, manager, team
- Links to auth.users via user_id after first login
- 11 staff imported: Travis, Tyler, Yusuph, Lissette, Jassi, Gresë, John, Oz, Michael, Zeki, Dorcas
- Fellowship links: Yusuph (GGF '18), Lissette (GGF '18), Gresë (GGF '23), Dorcas (GGF '11)

---

## Profile Editing

**Self-editing (My Profile in Settings):**
- Fellows and team members can edit their own profile
- Editable: phone, bio, LinkedIn, job title, organization, city, country
- Read-only: name, email (contact admin to change)

**Admin editing:**
- Admins see "Edit" button on any FellowProfileModal
- Full access to all fields including name, email, program/cohort
- Admin-only fields in violet section: program, cohort_year, alternate_emails, staff_notes
- Staff notes visible only to admins (not to the person themselves)

**Identity matching:**
- Auth flow checks both primary email and `alternate_emails` array
- See PROFILE_CLAIMING_SPEC.md for claim flow details

---

## Community Platform — Next Steps

**Phase 2a (Broadcast) — COMPLETE:**
- ✅ Community tables created with RLS
- ✅ stream-token Edge Function deployed
- ✅ Community page with Feed / Resources / Newsletter tabs
- ⏳ Buttondown API integration for newsletter sending (Edge Function needed)

**Phase 2b (Discovery) — UP NEXT:**
1. GetStream activity feed integration
2. Enhanced directory search & filters
3. Fellow spotlight / featured profiles
4. Push notification support

See GATHER_COMMUNITY_PLAN.md and ROADMAP.md for full specs.

---

## Style Quick Reference

| Element | Tailwind Classes |
|---------|-----------------|
| Primary button | `bg-orange-500 text-white py-4 rounded-xl font-semibold` |
| Team badge | `bg-gray-400 text-white px-2 py-1 rounded-full text-xs` |
| CPF badge | `bg-blue-700 text-white px-2 py-1 rounded-full text-xs` |
| GGF badge | `bg-orange-500 text-white px-2 py-1 rounded-full text-xs` |
| ESP badge | `bg-orange-700 text-white px-2 py-1 rounded-full text-xs` |

**Brand orange:** `#E87722`
