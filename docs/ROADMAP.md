# GATHER Roadmap

**Last updated:** Feb 15, 2026

This document tracks the big-picture vision for GATHER. For immediate tasks, see the TODO Tracker in SESSION_HANDOFF.md.

---

## Phase 1: Foundation ✅
*Core CRM + Directory — complete*

| Feature | Status |
|---------|--------|
| Fellow database (307 fellows, 3 programs) | ✅ Done |
| Photo management (all 307 uploaded) | ✅ Done |
| Focus areas system (Skills, Populations, Focus, Community) | ✅ Done |
| Magic link auth (Google OAuth removed Feb 13) | ✅ Done |
| 6-tier permission system | ✅ Done |
| Staff directory (team_members table, 11 staff imported) | ✅ Done |
| Profile claiming flow | ✅ Done |
| Self-editing profiles | ✅ Done |
| Admin editing + staff notes | ✅ Done |
| Interaction logging | ✅ Done |
| News scanner (SerpAPI) | ✅ Done — daily cron scans 25 fellows/day across 5 platforms, email alerts on hits |
| Focus areas tab fix (timeout + team member handling) | ✅ Done (Feb 11) |
| Login activity tracking (login_events table) | ✅ Done (Feb 13) |
| iPhone Safari auth hardening (getSession fallbacks, session recovery UX) | ✅ Done (Feb 13) |

---

## Phase 2: Community Platform
*GetStream + Buttondown integration — in progress*

### Phase 2a: Broadcast ✅
| Feature | Status |
|---------|--------|
| Community tables (announcements, resources, newsletter_sends, stream_tokens) | ✅ Done |
| Stream token-minting Edge Function | ✅ Done |
| Announcements feed component | ✅ Done |
| Resource library component | ✅ Done |
| Newsletter composer UI | ✅ Done |
| "Community" tab in navigation | ✅ Done |
| "Library" tab in navigation | ✅ Done |
| "Broadcast" tab for staff | ✅ Done |
| Menu restructure (removed desktop links) | ✅ Done |
| Auth flow fixes (auto-link, route protection, stale sessions) | ✅ Done |
| Import 307 fellow emails to Buttondown | ✅ Done — import script + CSV export ready |
| Wire newsletter to Buttondown API (Edge Function) | ✅ Done — send-newsletter Edge Function |

### Phase 2b: Discovery (In Progress)
| Feature | Status |
|---------|--------|
| Activity feed (GetStream) | ✅ Done — Community page has Activity tab |
| Enhanced directory search & filters | 🔲 Not started |
| "Currently working on" field for fellows | 🔲 Not started |
| Fellow spotlight / featured profiles | 🔲 Not started |
| Push notification support | 🔲 Not started — See implementation notes below |

### Phase 2c: Engagement (Weeks 5-6)
| Feature | Status |
|---------|--------|
| Reactions on announcements | 🔲 |
| Comments / discussion threads | 🔲 |
| Direct messaging (Stream Chat) | 🔲 |
| Program channels (CPF, GGF, ESP) | 🔲 |
| Weekly digest email (automated) | 🔲 |

### Phase 2d: Collaboration (Month 2+)
| Feature | Status |
|---------|--------|
| Interest-based channels | 🔲 |
| Project board | 🔲 |
| Mentorship matching | 🔲 |
| Event calendar with RSVP | 🔲 |
| Job/opportunity board | 🔲 |

---

## Phase 3: Current Cohort Management
*Active fellow tracking across three sites — in progress*

### Phase 3a: Foundation ✅
| Feature | Status |
|---------|--------|
| Spec document (CURRENT_COHORT_SPEC.md) | ✅ Done |
| Database migration — 11 new tables (016_current_cohort_tables.sql) | ✅ Done |
| Sites seed data (Chicago/CPF, Dar es Salaam/DAR, Mosquera/MOS) | ✅ Done |
| Navigation: "Cohorts" menu item (team+ access) | ✅ Done |
| Cohort Dashboard page (3 site cards with metrics) | ✅ Done |
| Site Detail page with Directory tab | ✅ Done |
| Events tab with event creation + attendance taking | ✅ Done |
| Attendance modal (P/L/E/A per fellow, bulk actions) | ✅ Done |
| Health tab with per-fellow health scores (0-100) | ✅ Done |
| DAR + MOS program badge colors (emerald + violet) | ✅ Done |

### Phase 3b: Curriculum & Engagement (Next)
| Feature | Status |
|---------|--------|
| Curriculum management UI (chapters + items) | 🔲 Not started |
| Fellow curriculum progress tracking | 🔲 Not started |
| Health score: add curriculum completion factor | 🔲 Not started |
| GATHER platform login tracking integration | 🔲 Not started |
| Health dashboard trend sparklines | 🔲 Not started |

### Phase 3c: Ad Hoc Lists & Polish
| Feature | Status |
|---------|--------|
| Ad hoc list creation UI (custom field definitions) | 🔲 Not started |
| Data entry grid for ad hoc lists | 🔲 Not started |
| Combined alumni + current cohort dashboard | 🔲 Not started |
| Year-end transition workflow (Current → Alumni) | 🔲 Not started |

---

## Phase 4: Analytics & Insights

| Feature | Status |
|---------|--------|
| Engagement dashboard (staff view) | 🔲 |
| Fellow activity scoring | 🔲 |
| Outreach priority suggestions | 🔲 |
| Program health metrics | 🔲 |
| Export / reporting tools | 🔲 |

---

## Phase 5: Scale & Polish

| Feature | Status |
|---------|--------|
| Historical data import (birthdays, social links, gender) | ✅ Done (Feb 15) — 195 fellows enriched from Excel trackers via `scripts/import-historical-data.py` |
| Org social link columns (linkedin_org, twitter_org, etc.) | ✅ Done (Feb 15) — migration 019; personal vs org social links separated |
| Social media scanning (FB, IG, Twitter, LinkedIn) | ✅ Done (Feb 14) — included in daily news scan across all 5 platforms |
| Multi-language support (translation system) | ✅ Done (Feb 13) — `<T>` component, `t()` function, Google Translate API, DB cache |
| Offline/PWA caching improvements | 🔲 |
| Performance optimization | 🔲 |
| Split index.html into modules (at 10K+ lines) | 🔲 |
| Automated testing | 🔲 |

---

## Implementation Notes

### Push Notifications
Service worker (sw.js) already has push/notification handlers. To complete:

1. **Generate VAPID keys** — `npx web-push generate-vapid-keys`
2. **Frontend subscription** — Call `pushManager.subscribe()` with VAPID public key when user enables push
3. **Store subscriptions** — Create `push_subscriptions` table in Supabase:
   ```sql
   create table push_subscriptions (
     id uuid primary key default gen_random_uuid(),
     user_id uuid references auth.users(id),
     endpoint text not null,
     p256dh text not null,
     auth text not null,
     created_at timestamptz default now(),
     unique(user_id, endpoint)
   );
   ```
4. **Edge Function** — Create `send-push` function using web-push library
5. **Trigger notifications** — Call Edge Function when:
   - Overdue alerts (daily check)
   - News mentions found
   - New announcements posted
   - Weekly/daily summaries

---

## Architecture Decisions Log

| Date | Decision | Rationale |
|------|----------|-----------|
| Jan 2026 | Single HTML file | Simplicity for small team, appropriate at current scale |
| Jan 2026 | Supabase over Firebase | Better Postgres features, RLS, Edge Functions |
| Feb 2026 | GetStream for community | Real-time feeds without building from scratch; free Maker tier covers 307 MAU |
| Feb 2026 | Buttondown for email | Simple API, good for newsletters at this volume |
| Feb 2026 | Lurker-first architecture | 30-50% active engagement realistic; design for passive consumption first |
| Feb 2026 | Google Translate for i18n | Real-time translation of all dynamic content; DB cache avoids repeated API calls; supports 100+ languages for global fellows |
| Feb 2026 | Email OTP codes (drop OAuth + magic links) | Simpler auth flow; fellows have diverse email providers; avoids Google consent screen issues; OTP codes eliminate iPhone Safari redirect failures that plagued magic links |
| Feb 2026 | OTP over magic links | PKCE exchange unreliable on mobile Safari; implicit flow had redirect issues on PWA; OTP codes are entirely in-app — no redirects needed |
| Feb 2026 | Supabase Pro upgrade | Higher rate limits, custom domain support, better for production |
| Feb 2026 | Unified fellows table for current + alumni | Current fellows use same `fellows` table with `status = 'Current'` and `site_id` FK; simplifies transition to alumni at year-end |
| Feb 2026 | Client-side health scores | Computed from attendance + curriculum + activity + interactions; no stored column avoids stale data |
| Feb 2026 | DAR/MOS program codes | Current cohort sites use CPF (Chicago), DAR (Dar es Salaam), MOS (Mosquera) as program identifiers |

---

## Cost Projection

| Service | Tier | Monthly Cost | Notes |
|---------|------|-------------|-------|
| GetStream | Maker (free) | $0 | <5 team members, <$10K revenue |
| Buttondown | Basic | $9/mo | 307 subscribers (free tier caps at 100) |
| Supabase | Pro | $25/mo | Upgraded for custom domain + higher limits |
| SerpAPI | Developer | $50/mo | 5,000 searches/month; daily news scan uses ~3,900/month |
| Anthropic | Tier 1 | ~$5/mo | AI search (Haiku); upgrade pending for higher rate limits |
| Netlify | Free | $0 | Already using |
| **Total** | | **~$89/mo** | Check if nonprofit discount applies for Supabase |
