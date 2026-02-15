# GATHER Architecture

> **Last Updated:** February 13, 2026
> **Maintainer:** Goldin Institute
> **Live Site:** https://gathertracker.netlify.app

## Overview

GATHER is a fellowship management platform for the Goldin Institute, serving both **alumni** (292 graduates) and **current fellows** (active cohorts at three sites). It manages fellows across five programs:

**Alumni Programs:**
- **CPF** - Chicago Peace Fellows (Chicago-based)
- **GGF** - Goldin Global Fellows English (International)
- **ESP** - Goldin Global Fellows Español (Spanish-speaking International)

**Current Cohort Programs (2026):**
- **CPF** - Chicago (USA) — 10-20 fellows
- **DAR** - Dar es Salaam (Tanzania) — 10-20 fellows
- **MOS** - Mosquera (Colombia) — 10-20 fellows

The system serves three purposes:
1. **Internal Staff Tool** - CRM for tracking interactions, managing relationships, sending communications
2. **Public Alumni Directory** - Fellows can find and connect with each other
3. **Current Cohort Management** - Track attendance, curriculum progress, health scores, and ad hoc data for active fellows

---

## Technology Stack

### Core Infrastructure

| Service | Purpose | Dashboard |
|---------|---------|-----------|
| **Supabase (Pro)** | Database, Auth, Storage, Edge Functions | https://supabase.com/dashboard/project/pwazurumpzydxyppbvee |
| **Netlify** | Hosting, Auto-deploy from GitHub | https://app.netlify.com (gathertracker.netlify.app) |
| **GitHub** | Source code repository | https://github.com/GIHQ/gather-crm |

### Frontend

- Single HTML file with embedded React components (`index.html`)
- Tailwind CSS via CDN
- No build step required - runs directly in browser

### Authentication

- **Staff & Fellows:** Email OTP verification codes (6-digit code sent to email, entered in-app)
- **Guests:** "Skip for now" — read-only directory access, no login required
- Google OAuth removed — OTP code is the sole auth method (magic links replaced Feb 14)

---

## Database Schema

### Core Tables

```
fellows
├── id (text, PK) — e.g., 'P001', 'CF-CHI-001'
├── first_name, last_name
├── email, phone, alternate_emails[]
├── program (CPF/GGF/ESP/DAR/MOS)
├── cohort (text)
├── city, country
├── organization, job_title
├── biography
├── photo_url
├── status ('Alumni' or 'Current')
├── site_id (FK → sites, nullable — set for current fellows)
├── user_id (FK → auth.users, nullable)
├── working_on (text)
└── created_at, updated_at

interactions
├── id (UUID, PK)
├── fellow_id (FK → fellows)
├── interaction_type (Call, Email, Meeting, etc.)
├── interaction_date
├── title, notes
├── logged_by
└── created_at

focus_categories
├── id (UUID, PK)
├── name (Skills, Populations, Focus Areas, Community Areas)
├── slug
└── display_order

focus_tags
├── id (UUID, PK)
├── category_id (FK → focus_categories)
├── name
├── slug
└── emoji

fellow_focus_tags
├── id (UUID, PK)
├── fellow_id (FK → fellows)
├── tag_id (FK → focus_tags)
├── is_primary (boolean, for Community Areas)
└── created_at

team_members
├── id (UUID, PK)
├── user_id (FK → auth.users)
├── email, alternate_emails[]
├── first_name, last_name
├── title, phone, bio
├── photo_url, linkedin_url
├── role (super_admin, admin, manager, team)
├── fellowships (JSONB: [{program, year}])
├── is_active
├── staff_notes
└── created_at, updated_at

profile_claim_requests
├── id (UUID, PK)
├── requesting_email
├── requesting_user_id (FK → auth.users)
├── target_type (fellow/team_member)
├── target_id
├── status (pending/approved/rejected)
├── reviewed_by, reviewed_at, notes
└── created_at

announcements (Community Platform)
├── id (UUID, PK)
├── title, content
├── author_id (FK → auth.users)
├── target_programs[] (empty = all)
├── is_pinned
├── published_at
└── created_at

resources (Community Platform)
├── id (UUID, PK)
├── title, description, url
├── category (document/link/video/template)
├── target_programs[]
├── uploaded_by (FK → auth.users)
└── created_at

newsletter_sends (Community Platform)
├── id (UUID, PK)
├── buttondown_id, subject, body_preview
├── recipient_count, target_programs[]
├── sent_by (FK → auth.users)
└── sent_at

stream_tokens (Community Platform)
├── user_id (UUID, PK, FK → auth.users)
├── token, expires_at
└── created_at

sites (Current Cohort)
├── id (UUID, PK)
├── name, city, country
├── program (CPF/DAR/MOS)
├── cohort_year (integer)
└── created_at

events (Current Cohort)
├── id (UUID, PK)
├── site_id (FK → sites)
├── title, description, location, meeting_link
├── start_time, end_time, notes
├── created_by (FK → auth.users)
└── created_at

event_attendance (Current Cohort)
├── id (UUID, PK)
├── event_id (FK → events)
├── fellow_id (text, FK → fellows)
├── status (present/absent/excused/late)
├── notes, recorded_by
└── created_at — UNIQUE(event_id, fellow_id)

curricula / curriculum_chapters / curriculum_items (Current Cohort)
├── Hierarchical: curricula → chapters → items
├── Items have type (page/assignment/discussion) and due_date
└── Per-site curriculum definitions

fellow_curriculum_progress (Current Cohort)
├── fellow_id (text, FK → fellows)
├── item_id (FK → curriculum_items)
├── completed, completed_at
└── UNIQUE(fellow_id, item_id)

fellow_platform_activity (Current Cohort)
├── fellow_id (text, FK → fellows)
├── activity_date, login_count
└── UNIQUE(fellow_id, activity_date)

adhoc_lists / adhoc_list_entries (Current Cohort)
├── Custom data collection per site
├── Fields defined as JSONB schema
└── Per-fellow entries with JSONB data
```

### Storage Buckets

- **Photos** - Fellow profile photos (public bucket)

---

## Permission System

Six-tier role hierarchy:

| Role | Level | Capabilities |
|------|-------|--------------|
| super_admin | 6 | Full system access, manage other admins |
| admin | 5 | All staff functions + user management |
| manager | 4 | Full CRM access, can't manage users |
| team | 3.5 | Staff member with basic access |
| fellow | 3 | View directory, own profile, limited interactions |
| viewer | 2 | Read-only directory access |
| guest | 1 | Minimal access, public directory only |

**Role lookup flow (determineUserRole):**
1. Check `team_members` table (email OR alternate_emails) → returns staff role
2. Check `fellows` table (email OR alternate_emails) → returns `fellow` role
3. Fall back to `viewer` for unrecognized emails
4. Guest users (skip login) get `viewer` role with no auth session

---

## File Structure

```
gather-crm/
├── index.html          # Main PWA app (mobile + desktop)
├── directory.html      # Public directory (legacy)
├── dashboard.html      # Staff dashboard (legacy)
├── manifest.json       # PWA manifest
├── sw.js              # Service worker
├── docs/
│   ├── ARCHITECTURE.md         # System overview (this file)
│   ├── DATABASE_SCHEMA.md      # Full schema with all columns
│   ├── STYLE_GUIDE.md          # Colors, fonts, component patterns
│   ├── SESSION_HANDOFF.md      # Current state for new sessions
│   ├── CURRENT_COHORT_SPEC.md  # Current cohort management spec
│   ├── GATHER_COMMUNITY_PLAN.md # Community platform roadmap
│   ├── TEAM_MANAGEMENT_SPEC.md # Team members + directory spec
│   ├── PROFILE_CLAIMING_SPEC.md # Identity matching + claiming
│   └── SETUP_GUIDE.md          # Development setup
├── supabase/
│   └── functions/
│       ├── search-news/     # News scanner Edge Function
│       ├── send-newsletter/ # Buttondown newsletter sending
│       ├── stream-token/    # GetStream token minting
│       └── translate/       # Translation proxy (Google Translate API)
└── migrations/
    ├── 008_team_members.sql              # Team members + alternate_emails
    ├── 009_profile_claims.sql            # Profile claim requests table
    ├── 010_community_tables.sql          # Announcements, resources, newsletters
    ├── 012_app_settings.sql              # App settings key-value table
    ├── 014_auto_link_team_members.sql    # Auto-link users on signup
    ├── 015_content_translations.sql      # Translation cache table
    └── 016_current_cohort_tables.sql     # Current cohort: sites, events, attendance, curricula, etc.
```

---

## Deployment Pipeline

```
GitHub (main branch)
    ↓ push
Netlify (auto-build)
    ↓ deploy
gathertracker.netlify.app
```

No build step - Netlify serves files directly.

---

## Environment Variables

### Netlify (Frontend)
- `VITE_SUPABASE_URL` - Supabase project URL
- `VITE_SUPABASE_ANON_KEY` - Supabase anonymous key (safe to expose)

### Supabase Edge Functions (Backend)
- `SERPAPI_KEY` - For news scanner
- `SUPABASE_URL` - Project URL
- `SUPABASE_SERVICE_ROLE_KEY` - Admin access (never expose)
- `GETSTREAM_API_KEY` - GetStream public key
- `GETSTREAM_SECRET` - GetStream secret (for token minting)
- `BUTTONDOWN_API_KEY` - Newsletter service
- `GOOGLE_TRANSLATE_API_KEY` - Translation service

**Important:** All Edge Functions must have **JWT Verification OFF** in the Supabase dashboard. Functions that need auth validate tokens internally. Supabase re-enables JWT verification on every redeployment — always toggle it off after deploying.

---

## Key Design Decisions

1. **Single HTML file** - Simplicity over complexity. No build tools, no framework overhead.

2. **Supabase for everything** - Database, auth, storage, and serverless functions in one place.

3. **Mobile-first PWA** - Most fellows access on phones. Installable as app.

4. **RLS for security** - Row Level Security policies enforce permissions at database level.

5. **Composable services** - GetStream for social, Buttondown for email. Easy to swap if needed.

6. **Unified fellows table** - Current fellows and alumni share the same `fellows` table, distinguished by `status` ('Current' vs 'Alumni'). Current fellows have a `site_id` linking to their program site. At year-end, fellows transition to alumni by setting `status = 'Alumni'` and `site_id = NULL`.

7. **Client-side health scores** - Fellow health scores (0-100) are computed in the browser from attendance, curriculum progress, platform activity, and interaction data. No stored score column — always fresh.

8. **Progressive data loading** - Data fetches are split into 3 priority phases to prevent mobile timeout:
   - Phase 1 (critical, 8s timeout): Fellows, team members, interactions — directory renders immediately
   - Phase 2 (background): Focus categories/tags, activities, login events, fellow tags
   - Phase 3 (lowest priority): Cohort data (sites, current fellows, events, attendance)
   - All phases use `Promise.allSettled()` so partial failures don't block the UI
   - `determineUserRole()` has a 5-second timeout with domain-based fallback

9. **Service Worker stale-while-revalidate** - HTML is served from cache immediately (< 3s), then updated in background. Prevents slow mobile networks from blocking app load. Cache-first for static assets.

---

## Common Operations

### Adding a new fellow
1. Insert into `fellows` table
2. Upload photo to Storage bucket
3. Update `photo_url` field

### Checking network health
- Query `interactions` table grouped by fellow
- Calculate days since last contact
- Flag fellows with no recent interactions

### Sending cohort newsletter
1. Query `fellows` filtered by program/cohort
2. Send to Buttondown API with recipient list
3. Log as interaction in database

---

## Related Documentation

- [SESSION_HANDOFF.md](./SESSION_HANDOFF.md) - **Start here** - Current state and what's next
- [DATABASE_SCHEMA.md](./DATABASE_SCHEMA.md) - Full schema with all columns
- [STYLE_GUIDE.md](./STYLE_GUIDE.md) - Colors, fonts, component patterns
- [TEAM_MANAGEMENT_SPEC.md](./TEAM_MANAGEMENT_SPEC.md) - Team members + directory integration
- [PROFILE_CLAIMING_SPEC.md](./PROFILE_CLAIMING_SPEC.md) - Identity matching + claim flow
- [GATHER_COMMUNITY_PLAN.md](./GATHER_COMMUNITY_PLAN.md) - Community platform roadmap
- [SETUP_GUIDE.md](./SETUP_GUIDE.md) - Development environment setup
