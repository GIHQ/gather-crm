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

## Current State (Updated Feb 7, 2026)

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
- Auth flow updated to check alternate_emails for both team_members and fellows
- My Profile page supports both fellows and team members
- Self-editing profile (phone, bio, LinkedIn, etc.) - name/email read-only
- Admin edit button on FellowProfileModal with full field access + staff notes
- Multiple badges for staff with fellowships (Team badge + program badges)
- Profile claiming flow - "Is This You?" screen for unrecognized emails
- Claim approval queue in Team Management page for admins
- RLS fixes - Directory now visible to all users (guests see fellows)
- Focus areas RLS fix - All focus tables publicly readable
- **Staff import complete** — 11 team members with full bios, photos, phone, fellowship links
- **ROADMAP.md created** — long-term feature roadmap with phased plan

### In Progress
- **Community Platform Phase 2a: Broadcast** — Stream token minting, announcements, newsletter composer

### Known Issues
- News scanner returns 0 results (SerpAPI key may need verification — medium-term fix)

---

## TODO Tracker

### 🔴 Immediate (This Session / Next Session)
- [ ] **Community Platform Phase 2a: Broadcast**
  - [ ] Stream token-minting Edge Function
  - [ ] Create announcements table + RLS policies
  - [ ] Create resources table + RLS policies
  - [ ] Build announcements feed component
  - [ ] Build newsletter composer (Buttondown API)
  - [ ] Add "Community" tab to navigation

### 🟡 Short-Term (This Week)
- [ ] Verify notification preferences fix deployed and working on mobile
- [ ] Test profile claiming flow end-to-end with a test account
- [ ] Push any pending code changes to GitHub

### 🟢 Medium-Term (This Month)
- [ ] Diagnose news scanner (SerpAPI returning 0 results — check API key and query format)
- [ ] Community Platform Phase 2b: Discovery (search, recommendations, spotlights)
- [ ] Community Platform Phase 2c: Engagement (reactions, comments, messaging)
- [ ] Engagement dashboard for staff
- [ ] Social media scanning expansion (FB, IG, Twitter, LinkedIn)

### 🔵 Long-Term (Quarter)
- [ ] Community Platform Phase 2d: Collaboration (projects, mentorship, resources)
- [ ] Analytics & insights dashboard
- [ ] Multi-language support for ESP fellows
- [ ] Code splitting when index.html exceeds 10K lines
- [ ] Automated testing

*For full feature roadmap, see docs/ROADMAP.md*

---

## Environment Variables (All Configured)

**Supabase Edge Function Secrets:**
SUPABASE_URL, SUPABASE_ANON_KEY, SUPABASE_SERVICE_ROLE_KEY, SUPABASE_DB_URL, SERPAPI_KEY, GOOGLE_TRANSLATE_API_KEY, BUTTONDOWN_API_KEY, GETSTREAM_API_KEY, GETSTREAM_SECRET

**Netlify:** GETSTREAM_API_KEY

---

## Key Files

| File | Purpose |
|------|---------|
| index.html | Main app - all React components embedded |
| docs/ARCHITECTURE.md | System overview |
| docs/DATABASE_SCHEMA.md | All tables and relationships |
| docs/STYLE_GUIDE.md | Colors, fonts, component patterns |
| docs/GATHER_COMMUNITY_PLAN.md | Community platform product plan |
| docs/TEAM_MANAGEMENT_SPEC.md | Team members in directory + admin page |
| docs/PROFILE_CLAIMING_SPEC.md | Identity matching + profile claiming |
| docs/ROADMAP.md | Long-term feature roadmap |
| migrations/008_team_members.sql | Team members table + alternate_emails |
| migrations/009_profile_claims.sql | Profile claim requests table |

---

## Team Management

Team members (Goldin Institute staff) are stored in the team_members table:
- 11 staff members imported with full profiles
- Displayed in Directory with silver "Team" badge
- Managed via Settings > Team Management (admin+ only)
- Roles: super_admin (Travis), team (all others)
- Links to auth.users via user_id after first login
- Staff who are also fellows have fellowships JSONB for dual badges

### Current Staff
| Name | Role | Title | Fellowship |
|------|------|-------|------------|
| Travis Rejman | super_admin | Executive Director | — |
| Tyler Stober | team | GATHER UX Designer | — |
| John Zeigler | team | Senior Director of Programs | — |
| Oz Ozburn | team | Senior Director of Design | — |
| Michael Henderson | team | Director, Chicago Peace Fellows | — |
| Jassi Sandhar | team | Director, Storytelling & Community Engagement | — |
| Yusuph Masanja | team | Director, Dar es Salaam Peace Fellows | GGF 2018 |
| Lissette Mateus Roa | team | Director, Bogota Peace Fellows | GGF 2018 |
| Grese Sermaxhaj | team | Communications Associate | GGF 2023 |
| Zeki Salah | team | Communications Associate | — |
| Dorcas Kiplagat | team | — | GGF 2011 |

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
- Auth flow checks both primary email and alternate_emails array
- See PROFILE_CLAIMING_SPEC.md for claim flow details

---

## Multiple Badges

Team members who are also fellows display multiple badges:
- Primary "Team" badge (gray-400)
- Additional program badges for each fellowship in their fellowships JSONB

The getBadges() function handles badge generation for both fellows and team members.

---

## Profile Claiming

When a user logs in with an unrecognized email:
1. **IsThisYouScreen** displays potential profile matches (parsed from email name)
2. User can claim a profile or request a new profile creation
3. Claims go into **profile_claim_requests** table with status 'pending'
4. Admins review in Team Management > Pending Claims section
5. Approved claims add the email to alternate_emails on the target profile

---

## Community Platform - Phase 2a Scope

From GATHER_COMMUNITY_PLAN.md, Phase 2a (Broadcast) includes:
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
| Primary button | bg-orange-500 text-white py-4 rounded-xl font-semibold |
| Team badge | bg-gray-400 text-white px-2 py-1 rounded-full text-xs |
| CPF badge | bg-blue-700 text-white px-2 py-1 rounded-full text-xs |
| GGF badge | bg-orange-500 text-white px-2 py-1 rounded-full text-xs |
| ESP badge | bg-orange-700 text-white px-2 py-1 rounded-full text-xs |

**Brand orange:** #E87722
