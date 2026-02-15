# GATHER v2

> **Project:** Fellowship management platform for the Goldin Institute
> **v1 (live):** https://gathertracker.netlify.app — single HTML file, keep running untouched
> **v2 (this branch):** Vite + React + Tailwind rebuild in `/v2` directory

## Quick Start

```bash
cd v2
npm install
npm run dev        # http://localhost:5173
npm run build      # production build → v2/dist/
```

## Tech Stack

| Layer | v1 | v2 |
|-------|----|----|
| Frontend | Single HTML + CDN React | Vite + React 19 + Tailwind v4 |
| Routing | Hash-based | React Router v7 (`createBrowserRouter` + `RouterProvider`) |
| Backend | Supabase (pwazurumpzydxyppbvee) | Supabase (ollexkvipnkkyzejmahh) — separate project |
| Auth | Email OTP | Email OTP (same method, new project) |
| Hosting | Netlify (gathertracker) | Netlify (gather-crm) — SPA `_redirects` configured |

## Architecture Decisions

1. **Everyone is a contact.** Fellows, team members, future mentors — all live in the `contacts` table. Differentiation via `contact_roles` (many-to-many). A person can be both a fellow and a team member.

2. **Cohorts are first-class.** The `cohorts` table has a `status` field: `live` (default view for staff) or `archived` (historical, read-mostly). Staff can always drill into archived cohorts to see historical attendance, participation, etc.

3. **Two primary views.** The main nav splits into COHORTS (active program management) and ALUMNI (the 307+ graduate directory). Staff defaults to live cohorts on login.

4. **RLS on every table.** No exceptions. Helper functions (`is_admin()`, `is_team_member()`, `current_contact_id()`) are SECURITY DEFINER to avoid recursion.

5. **No domain-based role elevation.** v1 auto-granted `team` role to @goldininstitute.org emails. v2 requires a `contact_roles` row — no database entry = viewer only.

6. **All edge functions validate auth.** No more JWT verification toggle. Every function checks the Authorization header before proceeding.

7. **UUIDs everywhere.** v1 used text IDs like 'P001'. v2 uses uuid PKs. The `legacy_id` column on contacts preserves v1 IDs for migration.

## Routing

Routes are defined in `v2/src/main.jsx` using `createBrowserRouter` (React Router v7 data API):

```
/                    → DashboardPage
/cohorts             → CohortsPage          (team+)
/cohorts/:id         → CohortDetailPage     (team+)
/alumni              → AlumniPage           (all authenticated)
/contacts/:id        → ContactProfilePage   (all authenticated)
/interactions        → InteractionsPage     (team+)
/activities          → ActivitiesPage       (team+)
/team                → TeamPage             (admin+)
/settings            → SettingsPage         (admin+)
```

`App.jsx` is the root layout route — handles auth gating (loading → login → AppShell + `<Outlet />`).

## Database Schema (v2)

Migration: `migrations/v2/001_foundation.sql` — run in Supabase SQL Editor.

### Core
- **contacts** — unified people table (v1 fellows + team_members merged), 52 columns
- **contact_roles** — permission roles per contact (super_admin, admin, manager, team, fellow, viewer)

### Cohorts
- **cohorts** — program cohorts with live/archived status
- **cohort_members** — which contacts belong to which cohort (with role: fellow, facilitator, mentor)
- **cohort_permissions** — per-team-member per-cohort access (edit/view/none)

### CRM
- **interactions** — staff touchpoints with contacts (type, date, title, notes, private flag)
- **activities** — news/social media mentions (type, title, source_url, snippet)

### Focus Areas
- **focus_categories** — Skills, Populations, Focus Areas, Community Areas
- **focus_tags** — individual tags within categories
- **contact_focus_tags** — junction table

### Cohort Management
- **events** — tied to cohorts, with facilitator/type/required fields
- **event_attendance** — per-contact attendance (P/L/E/A)
- **curricula** → **curriculum_chapters** → **curriculum_items** — hierarchical curriculum
- **contact_curriculum_progress** — per-item completion tracking
- **contact_chapter_notes** — staff notes per contact per chapter
- **contact_platform_activity** — GATHER LMS login tracking

### Ad Hoc
- **adhoc_lists** — custom per-cohort data collection (JSONB field definitions)
- **adhoc_list_entries** — per-contact data entries

### Community
- **announcements** — staff broadcasts
- **resources** — shared documents/links

### System
- **app_settings** — key-value config (thresholds, weights, etc.)
- **login_events** — auth audit trail
- **content_translations** — translation cache
- **app_errors** — client-side error reporting
- **profile_claim_requests** — identity verification flow

## Security Model

```
Role Hierarchy:
  super_admin (6)  → Full system access
  admin (5)        → All staff functions + user management
  manager (4)      → Full CRM, no user management
  team (3.5)       → Staff with basic access
  fellow (3)       → Own profile, directory, limited interactions
  viewer (2)       → Read-only directory (default for unrecognized users)
  guest (1)        → Public directory only (no auth)

Role Resolution (v2):
  1. Look up contacts by email or alternate_emails
  2. Check contact_roles for that contact
  3. Return highest role found
  4. No match → viewer
  5. No auth session → guest

  NO domain-based shortcuts. NO timeout fallbacks.
```

## Credentials

All stored in `.env.local` (root) and `v2/.env.local` — both gitignored.

- **v2 Supabase URL:** https://ollexkvipnkkyzejmahh.supabase.co
- **v2 Anon Key:** in .env.local
- **v2 DB Password:** in .env.local
- **v2 Service Role Key:** in .env.local

## File Structure

```
gather-crm/
├── CLAUDE.md                    # THIS FILE — v2 project guide
├── .env.local                   # Credentials (gitignored)
├── v2/                          # v2 application
│   ├── index.html
│   ├── package.json
│   ├── vite.config.js
│   ├── tailwind.config.js
│   ├── postcss.config.js
│   ├── .env.local               # v2 Supabase credentials (gitignored)
│   ├── migrate-v1-to-v2.mjs    # Data migration script (run locally)
│   ├── public/
│   │   └── _redirects           # Netlify SPA routing
│   └── src/
│       ├── main.jsx             # Router + route definitions
│       ├── index.css            # Tailwind base + custom tokens
│       ├── App.jsx              # Root layout (auth gate + AppShell + Outlet)
│       ├── lib/
│       │   └── supabase.js      # Supabase client init
│       ├── contexts/
│       │   └── AuthContext.jsx   # Auth state, role resolution, hasRole()
│       ├── hooks/               # (empty — available for custom hooks)
│       ├── components/
│       │   └── layout/
│       │       ├── AppShell.jsx  # Sidebar + header + main content area
│       │       └── Sidebar.jsx   # NavLink sidebar with role-based sections
│       └── pages/
│           ├── LoginPage.jsx         # Email OTP login
│           ├── DashboardPage.jsx     # Stats + recent activity feeds
│           ├── CohortsPage.jsx       # Live/archived cohort grid
│           ├── CohortDetailPage.jsx  # Tabs: Roster, Attendance, Curriculum, Events
│           ├── AlumniPage.jsx        # Directory with search + program/country filters
│           ├── ContactProfilePage.jsx # Full profile with focus tags, CRM, interactions
│           ├── InteractionsPage.jsx  # Interaction list with search + type filter
│           ├── ActivitiesPage.jsx    # Activity list with search + type filter
│           ├── TeamPage.jsx          # Team member cards (admin+)
│           └── SettingsPage.jsx      # Placeholder (admin+)
├── migrations/
│   └── v2/
│       └── 001_foundation.sql   # Complete v2 schema
├── index.html                   # v1 (DO NOT MODIFY)
├── docs/                        # v1 docs (reference only)
└── supabase/functions/          # v1 edge functions (reference only)
```

## v1 Data Migration

**Status: COMPLETE.** Script at `v2/migrate-v1-to-v2.mjs`. Run locally with `node migrate-v1-to-v2.mjs`.

Results:
- 307 fellows migrated (292 updated existing, 15 inserted new) with all fields: photos, bios, social links, focus areas, etc.
- 12 team member roles assigned
- 3 cohorts matched, 5 cohort memberships created
- 19 interactions migrated
- 164 focus tags mapped, 720 contact-tag assignments
- Legacy IDs preserved in `legacy_id` column

## Current State (what's built)

### Working
- Auth (email OTP login, role resolution, role-based UI gating)
- Client-side routing (createBrowserRouter, no reload needed)
- Dashboard with stat cards + recent interaction/activity feeds
- Alumni directory with search, program filter, country filter
- Contact profiles showing: photo, bio, org, location, focus tags by category, social links, birthday, gender, languages, cohort history, CRM notes, recent interactions
- Cohorts page with live/archived toggle
- Cohort detail with 4 tabs: Roster, Attendance (color-coded grid), Curriculum (progress bars), Events
- Interactions page with full list, search, type filter, contact links
- Activities page with full list, search, type filter, source links, DOMPurify sanitization
- Team management page with photo cards, roles, contact links
- Mobile-responsive sidebar with hamburger menu

### Not yet built
- **CRUD operations** — all pages are read-only. No create/edit/delete for contacts, interactions, activities, cohorts, events, etc.
- **Settings page** — still placeholder
- **Error boundaries** — convention says every page should have them, none added yet
- **Cohort permissions** — `cohort_permissions` table exists but no UI
- **Announcements & resources** — tables exist, no UI
- **Ad hoc lists** — tables exist, no UI
- **Profile claim flow** — `profile_claim_requests` table exists, no UI
- **Login event tracking** — `login_events` table exists, not wired up
- **App error reporting** — `app_errors` table exists, not wired up
- **Fellow self-service** — fellows can log in but can't edit their own profile
- **Engagement scoring** — no computed engagement metrics yet
- **Data export** — no CSV/PDF export capability
- **Pagination** — pages load all records (fine for 307 contacts, won't scale)

## Roadmap (suggested priority order)

### Phase 1 — Core CRUD (make it usable for daily staff work)
1. **Edit contact profiles** — inline editing or edit modal for staff to update contact fields
2. **Log interactions** — "Add interaction" form on contact profile and interactions page
3. **Log activities** — "Add activity" form on activities page
4. **Edit cohort settings** — update cohort name, status, dates
5. **Manage cohort roster** — add/remove members from cohorts

### Phase 2 — Staff workflows
6. **Manage events** — create/edit events within a cohort
7. **Record attendance** — click-to-toggle attendance grid
8. **Manage focus tags** — assign/remove tags on contact profiles
9. **Settings page** — app_settings CRUD for admins (thresholds, weights)
10. **Team role management** — add/remove/change roles on the Team page

### Phase 3 — Fellow experience
11. **Fellow self-service profile** — fellows edit their own profile (bio, photo, social, org)
12. **Profile claim flow** — new users claim an existing contact record
13. **Announcements** — display announcements to fellows after login
14. **Resources** — shared documents/links page

### Phase 4 — Analytics & polish
15. **Engagement scoring** — computed metrics from attendance + interactions + platform activity
16. **Dashboard analytics** — charts, trends, at-risk alerts
17. **Data export** — CSV/PDF for contacts, attendance, interactions
18. **Error boundaries** — wrap every page in an error boundary component
19. **Pagination / virtual scroll** — for future-proofing beyond 500 contacts
20. **Ad hoc lists** — custom data collection UI

## Design System

| Token | Value |
|-------|-------|
| Goldin Orange | `#E87722` |
| Goldin Orange Dark | `#D56A1C` |
| Font | DM Sans |
| Radius | rounded-xl to rounded-2xl |
| CPF (Chicago) | Blue `bg-blue-500` |
| GGF (Global) | Orange `bg-orange-500` |
| ESP (Spanish) | Purple `bg-purple-500` |
| DAR (Tanzania) | Emerald `bg-emerald-600` |
| MOS (Colombia) | Violet `bg-violet-600` |
| Status Green | `#10B981` (on track) |
| Status Yellow | `#F59E0B` (needs attention) |
| Status Red | `#EF4444` (at risk) |

## Conventions

- Use functional React components with hooks
- Prefer named exports
- Use Tailwind utility classes (no CSS modules)
- Supabase queries via SDK (never raw SQL from frontend)
- All user input validated at system boundaries
- Sanitize external content (news snippets) with DOMPurify before rendering
- Error boundaries on every page
- Loading/error/empty states for every data-fetching component
- Routes defined in `main.jsx`, not in `App.jsx`
- Auth gating in page components via `hasRole()`, not route-level guards
