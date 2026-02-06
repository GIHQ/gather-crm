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

## Current State (Updated Feb 6, 2026)

### Recently Completed
- Google OAuth login redirect fixed
- GetStream account created, API keys stored in Supabase + Netlify
- Buttondown account created, API key stored in Supabase
- Full Community Platform plan created
- All 292 fellow photos uploaded and linked
- Focus Areas system working
- Notification settings mobile overflow fix applied
- Component index comment block in index.html
- Team Management page added (admin+ can manage staff accounts)
- team_members table created with RLS policies
- Directory updated to show Team members with silver badge
- **Auth flow updated to check alternate_emails** for both team_members and fellows
- **My Profile page supports both fellows and team members**
- **Self-editing profile** (phone, bio, LinkedIn, etc.) - name/email read-only
- Migration file added: `migrations/008_team_members.sql`
- Documentation: PROFILE_CLAIMING_SPEC.md, NotificationSettings-fix.jsx, COMPONENT_INDEX.js

### In Progress
- **Community Platform Phase 1** - Stream token minting, announcements, newsletter composer
- Profile claiming flow for unrecognized emails (Phase 2)

### TODO (Next Session)
1. Run migration 008_team_members.sql in Supabase (adds alternate_emails columns)
2. Add admin edit button on FellowProfileModal for full field access
3. Implement "Is This You?" claim flow for unrecognized emails

### Known Issues
- Guest users see "0 alumni" in directory (RLS or permission issue)
- News scanner returns 0 results (SerpAPI key may need verification)

---

## Environment Variables (All Configured)

**Supabase Edge Function Secrets:**
SUPABASE_URL, SUPABASE_ANON_KEY, SUPABASE_SERVICE_ROLE_KEY, SUPABASE_DB_URL, SERPAPI_KEY, GOOGLE_TRANSLATE_API_KEY, BUTTONDOWN_API_KEY, GETSTREAM_API_KEY, GETSTREAM_SECRET

**Netlify:** GETSTREAM_API_KEY

---

## Key Files

| File | Purpose |
|------|---------|
| `index.html` | Main app - all React components embedded |
| `docs/ARCHITECTURE.md` | System overview |
| `docs/DATABASE_SCHEMA.md` | All tables and relationships |
| `docs/STYLE_GUIDE.md` | Colors, fonts, component patterns |
| `docs/GATHER_COMMUNITY_PLAN.md` | Community platform product plan |
| `docs/TEAM_MANAGEMENT_SPEC.md` | Team members in directory + admin page |
| `docs/PROFILE_CLAIMING_SPEC.md` | Identity matching + profile claiming |
| `migrations/008_team_members.sql` | Team members table + alternate_emails |

---

## Team Management

Team members (Goldin Institute staff) are stored in the `team_members` table:
- Displayed in Directory with silver "Team" badge
- Managed via Settings > Team Management (admin+ only)
- Roles: super_admin, admin, manager, team
- Links to auth.users via user_id after first login

---

## Profile Editing

**Self-editing (My Profile in Settings):**
- Fellows and team members can edit their own profile
- Editable: phone, bio, LinkedIn, job title, organization, city, country
- Read-only: name, email (contact admin to change)

**Admin editing:**
- Admins can edit any profile via FellowProfileModal
- Full access to all fields including name, email, program/cohort
- Staff notes field (not visible to the person)

**Identity matching:**
- Auth flow checks both primary email and `alternate_emails` array
- See PROFILE_CLAIMING_SPEC.md for claim flow details

---

## Community Platform - Phase 1 Scope

From GATHER_COMMUNITY_PLAN.md, Phase 1 (Foundation) includes:
- Stream token-minting Edge Function
- Announcements table + RLS policies
- Resources table + RLS policies
- Announcements feed component
- Newsletter composer (Buttondown API)
- "Community" tab in navigation

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
