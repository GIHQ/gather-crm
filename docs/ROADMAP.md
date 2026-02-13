# GATHER Roadmap

**Last updated:** Feb 13, 2026 (end of day)

This document tracks the big-picture vision for GATHER. For immediate tasks, see the TODO Tracker in SESSION_HANDOFF.md.

---

## Phase 1: Foundation ✅
*Core CRM + Directory — complete*

| Feature | Status |
|---------|--------|
| Fellow database (292 fellows, 3 programs) | ✅ Done |
| Photo management (all 292 uploaded) | ✅ Done |
| Focus areas system (Skills, Populations, Focus, Community) | ✅ Done |
| Magic link auth (Google OAuth removed Feb 13) | ✅ Done |
| 6-tier permission system | ✅ Done |
| Staff directory (team_members table, 11 staff imported) | ✅ Done |
| Profile claiming flow | ✅ Done |
| Self-editing profiles | ✅ Done |
| Admin editing + staff notes | ✅ Done |
| Interaction logging | ✅ Done |
| News scanner (SerpAPI) | ✅ Done — scans all 292 fellows in batches |
| Focus areas tab fix (timeout + team member handling) | ✅ Done (Feb 11) |
| Login activity tracking (login_events table) | ✅ Done (Feb 13) |

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
| Import 292 fellow emails to Buttondown | ✅ Done — import script + CSV export ready |
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

## Phase 3: Analytics & Insights

| Feature | Status |
|---------|--------|
| Engagement dashboard (staff view) | 🔲 |
| Fellow activity scoring | 🔲 |
| Outreach priority suggestions | 🔲 |
| Program health metrics | 🔲 |
| Export / reporting tools | 🔲 |

---

## Phase 4: Scale & Polish

| Feature | Status |
|---------|--------|
| Social media scanning (FB, IG, Twitter, LinkedIn) | 🔲 |
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
| Feb 2026 | GetStream for community | Real-time feeds without building from scratch; free Maker tier covers 292 MAU |
| Feb 2026 | Buttondown for email | Simple API, good for newsletters at this volume |
| Feb 2026 | Lurker-first architecture | 30-50% active engagement realistic; design for passive consumption first |
| Feb 2026 | Google Translate for i18n | Real-time translation of all dynamic content; DB cache avoids repeated API calls; supports 100+ languages for global fellows |
| Feb 2026 | Magic link only (drop OAuth) | Simpler auth flow; fellows have diverse email providers; avoids Google consent screen issues |
| Feb 2026 | Supabase Pro upgrade | Higher rate limits, custom domain support, better for production |

---

## Cost Projection

| Service | Tier | Monthly Cost | Notes |
|---------|------|-------------|-------|
| GetStream | Maker (free) | $0 | <5 team members, <$10K revenue |
| Buttondown | Basic | $9/mo | 292 subscribers (free tier caps at 100) |
| Supabase | Pro | $25/mo | Upgraded for custom domain + higher limits |
| Netlify | Free | $0 | Already using |
| **Total** | | **$34/mo** | Check if nonprofit discount applies for Supabase |
