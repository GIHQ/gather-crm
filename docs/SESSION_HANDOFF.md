# GATHER Session Handoff

**Read this first.** This document gives any Claude session immediate context to continue work on GATHER.

---

## Quick Context

GATHER is a fellowship management platform for the Goldin Institute managing **307 alumni** across 3 programs (CPF, GGF, ESP) and **current fellows** at 3 sites (Chicago/CPF, Dar es Salaam/DAR, Mosquera/MOS). It's a mobile-first PWA built as a single HTML file with React, hosted on Netlify, backed by Supabase (Pro plan). Auth is email OTP code only (Google OAuth removed Feb 13, magic links replaced with 6-digit OTP codes Feb 14).

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
├── index.html              # Main mobile PWA (~8700 lines) - PRIMARY FILE
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

## Current State (Updated Feb 15, 2026)

### Recently Completed
- **Historical Data Import (Feb 15):**
  - Ran `scripts/import-historical-data.py --apply` — enriched **195 fellows** from 3 Excel files (Global Alumni Directory, CPF Tracker, GGF Tracker)
  - Fields populated: 195 birthdays, 110 org Facebook, 63 org Instagram, 42 org Twitter/X, 41 personal Facebook, 27 LinkedIn, 26 websites, 23 personal Instagram, 19 gender, 15 personal Twitter/X, 9 org websites, 3 org LinkedIn
  - Migration `019_personal_org_social_links.sql` deployed: adds `linkedin_org`, `twitter_org`, `instagram_org`, `facebook_org`, `website_org`, `tiktok` columns to fellows table
  - Migration `017_birthday_gender.sql` deployed: adds `birthday`, `gender`, `hide_birthday_year` columns
  - Script only fills blanks — never overwrites existing data
  - 3 Excel emails not matched in DB (expected — slight name/email mismatches)
- **Birthday & Gender Fields (Feb 14):**
  - Migration `017_birthday_gender.sql`: adds `gender` (text), `birthday` (date), `hide_birthday_year` (boolean) to fellows table
  - Profile edit form: gender dropdown (Female/Male/Non-binary/Other), date picker, "Hide my birth year" checkbox
  - Profile overview: displays gender and birthday (respects year-hiding preference)
  - AI search: gender included in pipe-delimited fellow data for GATHER.ai queries
  - **To activate**: Run `migrations/017_birthday_gender.sql` in Supabase SQL Editor
- **Daily Automated News Scan (Feb 14):**
  - Migration `018_news_scan_cron.sql`: pg_cron job runs daily at 6 AM UTC (midnight CST)
  - Scans 25 fellows/day across all 5 platforms (Google News, LinkedIn, Twitter, Facebook, Instagram)
  - Cycles through all 307 fellows every ~12 days
  - Uses SerpAPI Developer plan (~3,900 searches/month of 5,000 limit)
  - Custom search terms from `app_settings` table included automatically
  - **Email alerts**: search-news Edge Function now emails `travis@goldininstitute.org` (stored in `app_settings` as `news_alert_email`) via Buttondown when new mentions are found — includes summary of which fellows were mentioned on which platforms
  - **To activate**: Run `migrations/018_news_scan_cron.sql` in SQL Editor ✅ DONE, redeploy `search-news` Edge Function ✅ DONE
- **AI Search Rate Limit Handling (Feb 14):**
  - Edge function returns 429 status with friendly message instead of generic 500
  - Both dashboard and GatherAI page show "please wait 60 seconds" on rate limit
  - Anthropic API tier upgrade pending (applied for organization status + higher tier)
- **Current Cohort Management System (Feb 13):**
  - New feature: manage current fellows across three program sites (Chicago, Dar es Salaam, Mosquera)
  - **Database migration** (`016_current_cohort_tables.sql`): 11 new tables — sites, events, event_attendance, curricula, curriculum_chapters, curriculum_items, fellow_curriculum_progress, fellow_platform_activity, adhoc_lists, adhoc_list_entries + `site_id` column on fellows
  - **Cohort Dashboard page** — overview of all three sites with fellow counts, event counts, attendance rates
  - **Site Detail page** with three tabs:
    - *Directory* — fellow cards with attendance rate and health status indicator
    - *Events* — create events, view upcoming/past events, take attendance with P/L/E/A buttons + bulk actions
    - *Health* — per-fellow health score (0-100) combining attendance rate + staff interaction recency
  - **Attendance Modal** — full-screen attendance sheet with per-fellow status buttons
  - **Create Event Modal** — title, description, location, meeting link, start/end time, notes
  - Navigation: "Cohorts" menu item (team+ access) between Dashboard and Directory
  - Spec document: `docs/CURRENT_COHORT_SPEC.md`
  - **Not yet implemented** (Phase 2): Curriculum tracking UI, Ad hoc lists UI, GATHER platform login tracking
  - **To activate**: Run `migrations/016_current_cohort_tables.sql` in Supabase SQL Editor, then add fellows with `status = 'Current'` and appropriate `site_id`
- **Auth Switched to OTP Verification Codes (Feb 14):**
  - Replaced magic link (implicit flow) with 6-digit OTP code verification
  - `signInWithOtp` now sends code-only email (no `emailRedirectTo`)
  - User enters 6-digit code on login screen, verified via `supabase.auth.verifyOtp()`
  - Removed all auth callback hash detection and URL cleanup code
  - Removed `flowType: 'implicit'`, set `detectSessionInUrl: false`
  - Eliminates iPhone Safari/PWA magic link failures entirely — no redirect needed
  - Updated Supabase Dashboard Magic Link email template to show `{{ .Token }}` instead of `{{ .ConfirmationURL }}`
- **iPhone Safari Magic Link Auth Fix (Feb 13) — SUPERSEDED by OTP switch:**
  - PKCE code exchange was silently failing on mobile Safari, leaving users stuck as guest
  - Multiple fallback layers were added but ultimately replaced by OTP flow
- **Auth Error Context Fix (Feb 13):**
  - `authError` state was missing from AppContext, so LoginScreen always received `undefined`
  - Added `authError` to context provider — error banner now displays correctly
- **AI Search Column Fix (Feb 13):**
  - AI search queries referencing `cohort_year` failed — column is actually `cohort` in fellows table
  - Fixed column name in the search-news Edge Function system prompt
- **Deep Translation System (Feb 13):**
  - All dynamic content (bios, announcements, job titles, orgs, etc.) now translatable via language selector
  - `<T>` component wraps any dynamic text — fetches translations via Google Translate Edge Function
  - `t()` helper function for translating strings in JS (e.g., menu items, status labels)
  - `useTranslation` hook provides `language`, `setLanguage`, `t()` with `TranslationProvider` context
  - Defensive null handling in `<T>` — safely handles null/undefined children
  - Translation works for both logged-in and guest users (anon key fallback for auth)
  - **`content_translations` table** (migration 015) — persistent DB cache for translated content
    - Shared across all users — once translated, never re-translates
    - Keyed by MD5 hash of source text + target language
    - Run in Supabase SQL Editor: `migrations/015_content_translations.sql` ✅ DONE
- **Auth Simplified to Email OTP Only (Feb 13–14):**
  - Removed Google OAuth entirely (Feb 13)
  - Switched from magic links to 6-digit OTP verification codes (Feb 14)
  - Fixed login button visibility (was hidden behind loading state)
  - Added rate limit UX — shows clear error messaging when rate limited
  - Fixed sign out from slide menu (function reference mismatch)
- **Login Activity Tracking (Feb 13):**
  - `login_events` table tracks all sign-ins (user, timestamp, method)
  - Interactions tab visibility fixed for staff users
- **Buttondown Newsletter Integration (Feb 13):**
  - Created `scripts/import-to-buttondown.js` — exports fellows to CSV for Buttondown bulk import (also supports `--api` flag for direct API import)
  - Created `supabase/functions/send-newsletter/index.ts` — Edge Function that sends newsletters via Buttondown API with staff auth checks
  - Updated `handleSendNewsletter` in index.html to call send-newsletter Edge Function (removed DEMO MODE)
  - Subscribers tagged by program (CPF/GGF/ESP) and cohort for segmentation
  - Requires: Set `BUTTONDOWN_API_KEY` in Supabase Edge Function secrets, run import script, deploy Edge Function
- **Legacy Cleanup (Feb 13):**
  - Removed Google OAuth code paths
  - Removed legacy `user_roles` table fallback from `determineUserRole()` — all role checks now use `team_members`
  - Fixed translation 401 errors with proper HTTP error handling and user feedback (reverts to English with alert)
- **Auth Session Persistence Fix (Feb 12):**
  - Fixed credentials being lost on page reload (reset to guest)
  - Changed from `getSession()` to `onAuthStateChange` as primary auth mechanism
  - Now handles `INITIAL_SESSION`, `SIGNED_IN`, and `TOKEN_REFRESHED` events
  - Fixed race condition where `getSession()` returned null before session loaded from storage
  - Guest users properly preserved from localStorage when no Supabase session
- **Interaction Save Freeze Fix (Feb 12):**
  - Added try/catch error handling to `handleSubmit` in LogInteractionModal
  - Added try/catch to `saveQuickLog` in FellowProfileModal
  - UI no longer freezes on "Saving..." if Supabase call fails
  - Errors now logged to console and shown to user
- **Community Page Error Handling (Feb 12):**
  - Added try/catch to announcements fetch
  - Added error state UI for failed announcements load
  - Shows error message instead of stuck "Loading..." state
- **Focus Areas Tab Fix (Feb 11):**
  - Fixed infinite spinning issue when clicking Focus Areas tab
  - Added 10-second timeout to prevent stuck loading state
  - Added proper cleanup for unmounted components
  - Team members now show clear message (focus areas are for fellows only)
  - Added error state with retry button for failed fetches
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
- **Translation system fully working** — Edge Function proxies Google Translate API (JWT verification OFF), `<T>` component + `t()` function for all dynamic content, `content_translations` DB cache table, language selector in header
- Notification settings UI fixed: toggle contrast + overflow on mobile
- **News scanner fully working** — scans all 307 fellows in batches of 5, daily cron job active (25/day, all 5 platforms)
- News alert emails sent to travis@goldininstitute.org when mentions found (via Buttondown)
- Custom search terms for news scanner (stored in `app_settings` table)
- `news_alert_email` setting in `app_settings` controls who receives scan alerts
- `is_admin()` SECURITY DEFINER function created
- **Focus area tags assigned to 274/307 fellows** (94% coverage)
- GetStream account created, API keys stored in Supabase + Netlify
- Buttondown account created, API key stored in Supabase
- All 307 fellow photos uploaded and linked
- Focus Areas system working (Skills, Populations, Focus Areas, Community Areas)
- Team Management page (admin+ can manage staff accounts)
- **11 team members imported** with full bios, photos, fellowship links
- Directory shows Team members with silver "Team" badge
- Profile claiming flow with approval queue
- Self-editing profiles + admin editing with staff notes

### In Progress
- **Community Platform Phase 2b** — Discovery features (enhanced search, fellow spotlight, push notifications)

### RESOLVED — iPhone Safari Auth (Feb 14)
**Status:** RESOLVED. Switched from magic links (implicit flow) to **OTP verification codes**. No redirects needed — user enters a 6-digit code directly in the app. This eliminates all iPhone Safari/PWA redirect issues.

**Supabase rate limit:** If users hit the OTP rate limit during testing, increase it in Supabase Dashboard → Authentication → Rate Limits → "Email" limit (e.g., 5 per 60s).

### Pending / Next Session
- **Anthropic API tier upgrade** — applied for organization status + higher tier; currently hitting 10k tokens/min rate limit on Haiku after one query
- **Verify news scan cron** — first run at 6 AM UTC Feb 15; check with `SELECT * FROM cron.job;` and `SELECT * FROM cron.job_run_details ORDER BY start_time DESC LIMIT 5;`
- ~~**Populate birthday & gender data**~~ — ✅ DONE (Feb 15) via historical data import script; 195 fellows enriched

### Known Issues
- Edge Function JWT verification must be OFF (toggle in dashboard) after any redeployment for `translate`, `search-news`, and `stream-token`
- 18 fellows still missing focus area tags (sparse bios) — run `node scripts/assign-focus-areas.js` to assign via Claude AI
- `user_roles` table is legacy/dead — code fallback removed Feb 13, table can be dropped from Supabase when convenient
- Supabase OTP rate limit can block re-login after repeated attempts — consider increasing rate limit in Supabase Dashboard > Authentication > Rate Limits
- Anthropic API rate limit (10k input tokens/min on Haiku) — AI search shows friendly "wait 60 seconds" message; upgrade pending

### Recently Fixed Bugs
- **iPhone Safari magic link → guest mode (Feb 13)** — PKCE exchange silently failing on mobile Safari. Ultimately resolved by switching to OTP verification codes (Feb 14), eliminating all redirect-based auth.
- **authError not reaching LoginScreen (Feb 13)** — `authError` was omitted from AppContext value, so the "Login link didn't work" error banner never showed. Added to context provider.
- **AI search `cohort_year` column error (Feb 13)** — Edge Function system prompt referenced non-existent `cohort_year` column. Fixed to `cohort`.
- **`<T>` component null crash (Feb 13)** — Dynamic content with null/undefined values passed to `<T>` caused React render errors. Added defensive null checks and safer context access.
- **Missing `t()` in MainApp/SlideMenu (Feb 13)** — Some UI strings weren't wrapped in translation function, showing English regardless of language setting. Fixed.
- **Language selector 401 error (Feb 13)** — Translate Edge Function had JWT verification ON, blocking all requests at the Supabase gateway. Fixed by disabling JWT verification and adding proper HTTP error handling with user feedback (reverts to English with alert on failure).
- **Sign out button not working (Feb 13)** — Menu sign out called `handleLogout` but the function was named `handleSignOut`. Fixed function reference.
- **Translation broken for guest users (Feb 13)** — Guest users had no auth token, causing 401. Fixed by ensuring anon key is used as Authorization fallback.
- **Login button hidden (Feb 13)** — Login button was invisible due to loading state overlap. Fixed visibility.
- **Magic link callback broken (Feb 13)** — After removing Google OAuth, magic link callback URL wasn't handled correctly. Fixed, then superseded by OTP switch (Feb 14).
- **Legacy user_roles fallback removed (Feb 13)** — Dead code was querying non-existent `user_roles` table on every login. Removed; all role checks now use `team_members` table.
- **Auth session lost on reload (Feb 12)** — `getSession()` was called before Supabase loaded session from storage, causing false "stale session" detection. Fixed by using `onAuthStateChange` with `INITIAL_SESSION` event.
- **Interaction save freeze (Feb 12)** — Missing try/catch in `handleSubmit` and `saveQuickLog` caused UI to freeze on errors. Added proper error handling.
- **Community page stuck loading (Feb 12)** — Missing error handling in announcements fetch. Added try/catch and error state UI.
- **Focus Areas tab spinning (Feb 11)** — Was caused by missing timeout/error handling in FocusAreasEditor. Fixed with 10s timeout, proper cleanup, and team member detection.

---

## TODO Tracker

### 🔴 Immediate (This Week)
- [x] Create community tables in Supabase ✅
- [x] Create stream-token Edge Function ✅
- [x] Build Community tab components ✅
- [x] Restructure menu: Community (feed), Library (resources), Broadcast (messaging) ✅
- [x] Fix auth flow: auto-link team_members, route protection, stale session handling ✅
- [x] Import 307 fellow emails to Buttondown ✅ (script + CSV export ready)
- [x] Wire newsletter composer to Buttondown API (create Edge Function) ✅
- [ ] Test end-to-end newsletter sending (requires: deploy Edge Function, set API key, run import)

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
  - `search-news`: OFF (uses anon key, called by pg_cron daily)
  - `ai-search`: OFF (uses anon key)
  - `stream-token`: OFF (uses anon key, validates auth internally)
  - `translate`: OFF (proxies Google Translate API, no user data)
  - `send-newsletter`: needs deploying (Buttondown API proxy, checks staff auth internally)
- News scanner processes fellows in **batches of 5** from the frontend (manual scan) or **25/day** via pg_cron (automated)
- **pg_cron daily job** (`daily-news-scan`): runs at 6 AM UTC, scans 25 fellows across all 5 platforms, sends email alert on hits

### RLS Patterns
- Use `auth.uid() IS NOT NULL` for authenticated checks (NOT `auth.role() = 'authenticated'`)
- Use `is_admin()` SECURITY DEFINER function when checking team_members roles (avoids infinite recursion)
- The `is_admin()` function is used by both `app_settings` and `team_members` policies
- **team_members.user_id MUST be linked to auth.users.id** for RLS policies to work (announcements, resources, etc.)
- Auto-link trigger (`014_auto_link_team_members.sql`) handles this automatically on signup/login

### Auth & Session Handling
- **Auth method:** Email OTP verification codes (6-digit code sent to email, entered in-app)
  - `signInWithOtp({ email })` sends the code (no `emailRedirectTo`)
  - `verifyOtp({ email, token, type: 'email' })` verifies the code
  - On success, `onAuthStateChange` fires `SIGNED_IN` event automatically
- **Primary session mechanism:** `onAuthStateChange` listener with `getSession()` fallback
  - Handles `INITIAL_SESSION` (page load), `SIGNED_IN`, `TOKEN_REFRESHED`, and `SIGNED_OUT` events
  - Avoids race condition where `getSession()` returns null before session loads from storage
  - **Fallback:** When `INITIAL_SESSION` fires with null, explicitly calls `getSession()` to catch missed sessions (Safari/PWA edge case)
- Supabase client configured with `storageKey: 'gather-auth'`, `detectSessionInUrl: false`
- No URL hash/callback handling needed — OTP flow is entirely in-app
- Supabase Dashboard Magic Link email template updated to show `{{ .Token }}` (the 6-digit code) instead of `{{ .ConfirmationURL }}`
- Guest users use fake email `guest@gathertracker.app` — preserved in localStorage across sessions
- Guest state is cleared from localStorage when user initiates a new login (prevents stuck-as-guest)
- When `SIGNED_OUT` event fires, localStorage is cleared and user sees login screen
- Route protection redirects guests from team-only pages: dashboard, activity, broadcast, team-management
- Team members must run this SQL if their account isn't linked:
  ```sql
  UPDATE team_members SET user_id = (SELECT id FROM auth.users WHERE email = 'YOUR_EMAIL')
  WHERE email = 'YOUR_EMAIL';
  ```

### GetStream Activity Feed
- App ID `1497007` is hardcoded in `index.html` (in `useStreamFeed` hook and `BroadcastPage`)
- `stream-token` Edge Function returns `api_key` and `token` — used with `stream.connect(apiKey, token, appId)`
- Feed structure: `flat:community` — flat feed group with "community" instance
- Tokens cached 24hrs in `stream_tokens` table
- Announcements publish to both Supabase (primary) and GetStream (best-effort)
- Activity tab only visible to logged-in users; guests see only Announcements tab

### Translation System
- **Language selector** in header — dropdown with 10+ languages (Spanish, French, Arabic, Chinese, etc.)
- **`<T>` component** — wraps dynamic text (bios, announcements, job titles). Fetches translation via Edge Function on language change.
- **`t()` function** — for translating strings in JS code (menu items, labels, buttons). Available via `useTranslation()` hook.
- **`TranslationProvider`** — React context providing `language`, `setLanguage`, `t()` to all components
- **Edge Function:** `translate` — proxies Google Translate API, JWT verification OFF, uses `GOOGLE_TRANSLATE_API_KEY` secret
- **DB cache:** `content_translations` table — stores translations keyed by `(source_hash, target_lang)`. Shared across all users.
- **In-memory cache:** `translationCache` Map in frontend — avoids redundant API calls within a session
- **Error handling:** On translation failure, reverts to English with user alert. Guest users use anon key for auth.
- Auth: email OTP codes only (Google OAuth removed Feb 13, magic links replaced with OTP Feb 14). Rate limit can be adjusted in Supabase Dashboard > Authentication > Rate Limits.

### Database Schema vs Docs
`DATABASE_SCHEMA.md` is now accurate as of Feb 13, 2026. Key fellows columns:
- `id` is **text** type (not uuid) — e.g., 'P001', 'CF-CHI-001'
- `status` uses `'Alumni'` or `'Current'` — CHECK constraint enforces this
- `site_id` (uuid, nullable) — FK to `sites` table, set for current fellows only
- `biography` (not `bio`), `job_title` (not `title`), `cohort` (not `cohort_year`)
- All `fellow_id` foreign keys in cohort tables are `text` type to match `fellows.id`
- `user_roles` table is marked LEGACY — superseded by `team_members` for all role checks

---

## Environment Variables (All Configured)

**Supabase Edge Function Secrets:**
SUPABASE_URL, SUPABASE_ANON_KEY, SUPABASE_SERVICE_ROLE_KEY, SUPABASE_DB_URL, SERPAPI_KEY, GOOGLE_TRANSLATE_API_KEY, BUTTONDOWN_API_KEY, GETSTREAM_API_KEY, GETSTREAM_SECRET

**Netlify:** GETSTREAM_API_KEY

**GetStream Configuration:**
- App ID: `1497007`
- Feed Group: `flat` (type: Flat) — created in GetStream dashboard
- Feed Instance: `community` — auto-created on first use
- Dashboard: https://dashboard.getstream.io/

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
| `migrations/015_content_translations.sql` | Translation cache table (run in SQL Editor ✅) |
| `migrations/015_login_events.sql` | Login activity tracking table |
| `migrations/016_current_cohort_tables.sql` | Current cohort: sites, events, attendance, curricula, ad hoc lists |
| `migrations/017_birthday_gender.sql` | Birthday, gender, hide_birthday_year columns on fellows |
| `migrations/018_news_scan_cron.sql` | Daily pg_cron job for automated news scanning + alert email setting |
| `migrations/019_personal_org_social_links.sql` | Org social link columns (linkedin_org, twitter_org, etc.) + tiktok |
| `scripts/import-historical-data.py` | Historical data import from Excel → Supabase (birthdays, social links, gender) |
| `docs/CURRENT_COHORT_SPEC.md` | Current cohort management specification |
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
| DAR (Dar es Salaam) | Emerald | `bg-emerald-600` |
| MOS (Mosquera) | Violet | `bg-violet-600` |

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
