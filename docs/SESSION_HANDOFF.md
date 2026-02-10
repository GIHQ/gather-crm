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

## Current State (Updated Feb 10, 2026)

### Recently Completed
- **News scanner fully working** — scans all 292 fellows in batches of 5, across Google News, LinkedIn, Twitter, Facebook, Instagram
- Custom search terms for news scanner (stored in `app_settings` table, admin-editable orange chips)
- Removed quick scan option — single "Scan All Fellows" button (non-Travis still 3/day limit)
- Edge Function auth fixed: uses anon key (HS256) instead of session JWT (ES256 was rejected)
- `is_admin()` SECURITY DEFINER function created to prevent RLS infinite recursion on team_members
- `app_settings` table created with proper RLS (`auth.uid() IS NOT NULL` for SELECT)
- **Focus area tags assigned to 274/292 fellows** (94% coverage) via SQL keyword matching
- AI focus area assignment script (`scripts/assign-focus-areas.js`) and SQL alternative (`scripts/assign-focus-areas.sql`)
- Google OAuth login redirect fixed
- GetStream account created, API keys stored in Supabase + Netlify
- Buttondown account created, API key stored in Supabase
- Full Community Platform plan created (see GATHER_COMMUNITY_PLAN.md)
- All 292 fellow photos uploaded and linked
- Focus Areas system working (Skills, Populations, Focus Areas, Community Areas)
- Notification settings mobile overflow fix applied
- Component index comment block in index.html
- Team Management page added (admin+ can manage staff accounts)
- team_members table created with RLS policies
- **11 team members imported** with full bios, photos, fellowship links
- Directory updated to show Team members with silver "Team" badge
- Auth flow checks alternate_emails for both team_members and fellows
- My Profile page supports both fellows and team members
- Self-editing profile (phone, bio, LinkedIn, etc.) - name/email read-only
- Admin edit button on FellowProfileModal with full field access + staff notes
- Multiple badges for staff with fellowships (Team badge + program badges)
- Profile claiming flow with "Is This You?" screen
- Claim approval queue in Team Management page for admins
- RLS fixes: Directory visible to all, focus tables publicly readable
- Community tab wireframe designed (Feed, Resources, Newsletter, Directory with Team filter)

### In Progress
- **Community Platform Phase 2a** — Backend tables and Edge Functions not yet created
- Community tab wireframe ready; frontend build waiting on backend

### Known Issues
- News scanner Edge Function must be deployed via Supabase dashboard (user does not have CLI) — current version is live and working
- Edge Function JWT verification must be OFF (toggle in dashboard) after any redeployment
- News scanner processed ~75-90 of 292 fellows before Edge Function timeout; can be re-run to pick up remaining
- 18 fellows still missing focus area tags (sparse bios, no keyword matches) — can be assigned manually

---

## TODO Tracker

### 🔴 Immediate (This Week)
- [ ] Create community tables in Supabase (announcements, resources, newsletter_sends, stream_tokens)
- [ ] Create stream-token Edge Function
- [ ] Build Community tab components in index.html (based on wireframe)
- [ ] Import 292 fellow emails to Buttondown

### 🟡 Short-Term (Next 2 Weeks)
- [ ] Wire announcements feed to Supabase
- [ ] Wire newsletter composer to Buttondown API
- [ ] Add "working_on" field to fellows table
- [ ] Test end-to-end announcement posting
- [ ] Test end-to-end newsletter sending

### 🟢 Medium-Term (This Month)
- [ ] GetStream activity feed integration
- [ ] Enhanced directory search & filters (live in app)
- [ ] Push notification support
- [ ] Fellow spotlight feature
- [ ] Weekly digest email (automated)

### 🔵 Long-Term (See ROADMAP.md)
- [ ] Direct messaging (Stream Chat)
- [ ] Program-specific channels
- [ ] Mentorship matching
- [ ] Analytics dashboard
- [ ] Multi-language support

---

## Critical Technical Notes

### Edge Function Deployment
- User (Travis) deploys Edge Functions via **Supabase dashboard** (no CLI installed)
- After deploying, must toggle **JWT Verification OFF** in Edge Function settings
- Edge Function uses `SUPABASE_ANON_KEY` (HS256) for auth — ES256 session JWTs are rejected by gateway
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

Phase 2a (Broadcast) is next. Backend needs:
1. Four new tables: announcements, resources, newsletter_sends, stream_tokens
2. Stream token-minting Edge Function (GetStream JWT, 24hr cache)
3. RLS policies for all new tables

Frontend needs (wireframe complete):
1. Community tab with Feed / Resources / Newsletter sub-tabs
2. Announcements feed with reactions, pinned posts, program targeting
3. Resource library with category filters
4. Newsletter composer (staff only) with Buttondown API integration
5. Directory Team filter pill (silver, matching Team badge)

See GATHER_COMMUNITY_PLAN.md for full spec.

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
