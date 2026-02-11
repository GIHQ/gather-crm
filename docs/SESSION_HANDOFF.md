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

## Supabase Configuration

```javascript
const SUPABASE_URL = 'https://pwazurumpzydxyppbvee.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB3YXp1cnVtcHp5ZHh5cHBidmVlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MjM3MDUsImV4cCI6MjA4NTA5OTcwNX0.iGLmSpTPM84lMGGizSfBnkDCvpMZaJVaFhcRJ9cYDrs';
```

**Storage Buckets:**
- `Photos` — Fellow photos and logos
- Square logo: `https://pwazurumpzydxyppbvee.supabase.co/storage/v1/object/public/Photos/Gather%20logomark%20square.png`
- Full logo: `https://pwazurumpzydxyppbvee.supabase.co/storage/v1/object/public/Photos/Gather%20-%20Logo.png`

---

## File Structure

```
/
├── index.html              # Main mobile PWA (~7500 lines) - PRIMARY FILE
├── directory.html          # Desktop public directory (legacy)
├── dashboard.html          # Desktop staff CRM (legacy)
├── manifest.json           # PWA manifest
├── sw.js                   # Service worker
├── docs/                   # Documentation
│   ├── SESSION_HANDOFF.md  # THIS FILE - start here
│   ├── ARCHITECTURE.md     # System overview
│   ├── DATABASE_SCHEMA.md  # Tables and relationships
│   ├── ROADMAP.md          # Long-term roadmap
│   └── ...
├── migrations/             # SQL migrations (run in Supabase SQL Editor)
├── scripts/                # Utility scripts
└── supabase/functions/     # Edge Functions
```

---

## Current State (Updated Feb 11, 2026)

### Recently Completed
- **GetStream Activity Feed Integration:**
  - Added GetStream SDK via CDN
  - Community page now has two tabs: "Announcements" (Supabase) and "Activity" (GetStream feed)
  - `useStreamFeed` hook handles token fetching, feed connection, and activity loading
  - Guests see announcements only; logged-in users see both tabs
  - Creating announcements in Broadcast page also publishes to GetStream feed (best-effort)
- **Menu & Navigation Restructure:**
  - Removed desktop directory/dashboard links from menu
  - Renamed "Cohort Communication" → "Broadcast"
  - Added "Library" as separate menu item
- **Community page now has tabs** — Announcements tab (official) + Activity tab (network activity, requires login)
- **Library page (new)** — standalone page for resources (docs, links, videos, templates)
- **Broadcast page (redesigned)** — two tabs:
  - "Announcement" (default) — posts to in-app Community feed
  - "Newsletter" — sends email to selected cohorts
- **Auth flow fixes:**
  - Fixed RLS policy issue: `team_members.user_id` must be linked to `auth.users.id`
  - Created auto-link trigger (`migrations/014_auto_link_team_members.sql`) — automatically links team_members and fellows to auth.users on signup/login
  - Fixed stale session handling — clears localStorage when Supabase session expires, forces re-login
  - Added route protection — guests redirected from team-only pages (dashboard, activity, broadcast) to directory
  - Onboarding step resets when session expires
- **Community Platform Phase 2a COMPLETE:**
  - Community tables created: `announcements`, `resources`, `newsletter_sends`, `stream_tokens`
  - `stream-token` Edge Function deployed (mints GetStream JWTs, caches 24hr)
  - `working_on` field added to fellows table
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
- **Community Platform Phase 2b** — Discovery features (enhanced search, fellow spotlight, push notifications)

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
- [x] Restructure menu: Community (feed), Library (resources), Broadcast (messaging) ✅
- [x] Fix auth flow: auto-link team_members, route protection, stale session handling ✅
- [ ] Import 292 fellow emails to Buttondown
- [ ] Wire newsletter composer to Buttondown API (create Edge Function)
- [ ] Test end-to-end newsletter sending

### 🟡 Short-Term (Next 2 Weeks)
- [x] GetStream activity feed integration ✅
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
- **team_members.user_id MUST be linked to auth.users.id** for RLS policies to work (announcements, resources, etc.)
- Auto-link trigger (`014_auto_link_team_members.sql`) handles this automatically on signup/login

### Auth & Session Handling
- Guest users use fake email `guest@gathertracker.app` — preserved across sessions
- When Supabase session expires and user isn't a guest, localStorage is cleared and user sees login screen
- Route protection redirects guests from team-only pages: dashboard, activity, broadcast, team-management
- Team members must run this SQL if their account isn't linked:
  ```sql
  UPDATE team_members SET user_id = (SELECT id FROM auth.users WHERE email = 'YOUR_EMAIL')
  WHERE email = 'YOUR_EMAIL';
  ```

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
| `migrations/014_auto_link_team_members.sql` | Auto-link team_members/fellows to auth.users on signup |
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

## Community Platform — Current Structure

**Pages:**
- **Community** — Two tabs: Announcements (Supabase, public) + Activity (GetStream feed, login required)
- **Library** — Shared resources: documents, links, videos, templates (public)
- **Broadcast** (staff only) — Two tabs:
  - *Announcement* — Post to Community feed (in-app, default)
  - *Newsletter* — Email to selected cohorts (external)

**Phase 2a (Broadcast) — COMPLETE:**
- ✅ Community tables created with RLS
- ✅ stream-token Edge Function deployed
- ✅ Menu restructured: Community (feed), Library (resources), Broadcast (staff messaging)
- ✅ Auto-link trigger for team_members/fellows
- ⏳ Buttondown API integration for newsletter sending (Edge Function needed)

**Phase 2b (Discovery) — IN PROGRESS:**
1. ✅ GetStream activity feed integration (Community page tabs + useStreamFeed hook)
2. Enhanced directory search & filters
3. Fellow spotlight / featured profiles
4. Push notification support

See GATHER_COMMUNITY_PLAN.md and ROADMAP.md for full specs.

---

## Design System

**Brand Colors:**
| Color | Hex | Usage |
|-------|-----|-------|
| Goldin Orange | `#E87722` | Primary buttons, accents |
| Goldin Orange Dark | `#D56A1C` | Hover states |
| Gray | `#6B7280` | Secondary text |
| Gray Dark | `#374151` | Primary text |

**Program Colors:**
| Program | Color | Tailwind |
|---------|-------|----------|
| CPF (Chicago) | Blue | `bg-blue-500` / `bg-blue-700` |
| GGF (Global) | Orange | `bg-orange-500` |
| ESP (Spanish) | Purple | `bg-purple-500` / `bg-orange-700` |

**Status Colors:**
| Status | Hex | Condition |
|--------|-----|-----------|
| Green | `#10B981` | ≤30 days since contact |
| Yellow | `#F59E0B` | 31-90 days |
| Red | `#EF4444` | >90 days |

**Typography:** DM Sans (loaded via Google Fonts)

**Border Radius:** `rounded-xl` to `rounded-2xl`

**Component Patterns:**
| Element | Tailwind Classes |
|---------|-----------------|
| Primary button | `bg-orange-500 text-white py-4 rounded-xl font-semibold` |
| Team badge | `bg-gray-400 text-white px-2 py-1 rounded-full text-xs` |
| CPF badge | `bg-blue-700 text-white px-2 py-1 rounded-full text-xs` |
| GGF badge | `bg-orange-500 text-white px-2 py-1 rounded-full text-xs` |
| ESP badge | `bg-orange-700 text-white px-2 py-1 rounded-full text-xs` |

---

## Deployment

**Netlify:** Auto-deploys from `main` branch on GitHub
- Site: gathertracker.netlify.app
- Repo: github.com/GIHQ/gather-crm

**To deploy:** `git push origin main` — Netlify builds automatically
