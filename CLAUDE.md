# GATHER v2

> **Project:** Fellowship management platform for the Goldin Institute
> **v1 (live):** https://gathertracker.netlify.app — single HTML file, keep running untouched
> **v2 (this branch):** Vite + React + Tailwind rebuild in `/v2` directory

## Quick Start

```bash
cd v2
npm install
npm run dev        # http://localhost:5173
```

## Tech Stack

| Layer | v1 | v2 |
|-------|----|----|
| Frontend | Single HTML + CDN React | Vite + React + Tailwind |
| Backend | Supabase (pwazurumpzydxyppbvee) | Supabase (ollexkvipnkkyzejmahh) — separate project |
| Auth | Email OTP | Email OTP (same method, new project) |
| Hosting | Netlify (gathertracker) | Netlify (gather-crm) |

## Architecture Decisions

1. **Everyone is a contact.** Fellows, team members, future mentors — all live in the `contacts` table. Differentiation via `contact_roles` (many-to-many). A person can be both a fellow and a team member.

2. **Cohorts are first-class.** The `cohorts` table has a `status` field: `live` (default view for staff) or `archived` (historical, read-mostly). Staff can always drill into archived cohorts to see historical attendance, participation, etc.

3. **Two primary views.** The main nav splits into COHORTS (active program management) and ALUMNI (the 307+ graduate directory). Staff defaults to live cohorts on login.

4. **RLS on every table.** No exceptions. Helper functions (`is_admin()`, `is_team_member()`, `current_contact_id()`) are SECURITY DEFINER to avoid recursion.

5. **No domain-based role elevation.** v1 auto-granted `team` role to @goldininstitute.org emails. v2 requires a `contact_roles` row — no database entry = viewer only.

6. **All edge functions validate auth.** No more JWT verification toggle. Every function checks the Authorization header before proceeding.

7. **UUIDs everywhere.** v1 used text IDs like 'P001'. v2 uses uuid PKs. The `legacy_id` column on contacts preserves v1 IDs for migration.

## Database Schema (v2)

Migration: `migrations/v2/001_foundation.sql` — run in Supabase SQL Editor.

### Core
- **contacts** — unified people table (v1 fellows + team_members merged)
- **contact_roles** — permission roles per contact (super_admin, admin, manager, team, fellow, viewer)

### Cohorts
- **cohorts** — program cohorts with live/archived status
- **cohort_members** — which contacts belong to which cohort (with role: fellow, facilitator, mentor)
- **cohort_permissions** — per-team-member per-cohort access (edit/view/none)

### CRM
- **interactions** — staff touchpoints with contacts
- **activities** — news/social media mentions

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
- **v2 Service Role Key:** TBD (not yet provided)

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
│   └── src/
│       ├── main.jsx
│       ├── index.css
│       ├── App.jsx
│       ├── lib/
│       │   └── supabase.js
│       ├── contexts/
│       ├── hooks/
│       ├── components/
│       └── pages/
├── migrations/
│   └── v2/
│       └── 001_foundation.sql   # Complete v2 schema
├── index.html                   # v1 (DO NOT MODIFY)
├── docs/                        # v1 docs (reference only)
└── supabase/functions/          # v1 edge functions (reference only)
```

## v1 Data Migration Notes

When v2 is ready, a migration script will:
1. Map v1 `fellows` (307 alumni) → v2 `contacts` with `legacy_id` preserving P001/CF-CHI-001 IDs
2. Map v1 `team_members` (11 staff) → v2 `contacts` + `contact_roles`
3. Staff who are also fellows → one contact record, two roles
4. Carry over ALL fields including birthday, gender, org social links, tiktok, languages, community_area
5. Map v1 `sites` → v2 `cohorts` (with status='archived' for past years)
6. Map all interactions, activities, focus tags, events, attendance, etc.

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
