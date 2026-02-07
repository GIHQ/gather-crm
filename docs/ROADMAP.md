# GATHER Roadmap

**Last updated:** Feb 7, 2026

This document tracks the big-picture vision for GATHER. For immediate tasks, see the TODO section in SESSION_HANDOFF.md.

---

## Phase 1: Foundation (Current)
*Core CRM + Directory — mostly complete*

| Feature | Status |
|---------|--------|
| Fellow database (292 fellows, 3 programs) | ✅ Done |
| Photo management | ✅ Done |
| Focus areas system (Skills, Populations, Focus, Community) | ✅ Done |
| Google OAuth + magic link auth | ✅ Done |
| 6-tier permission system | ✅ Done |
| Staff directory (team_members table, 11 staff imported) | ✅ Done |
| Profile claiming flow | ✅ Done |
| Self-editing profiles | ✅ Done |
| Admin editing + staff notes | ✅ Done |
| Interaction logging | ✅ Done |
| News scanner (SerpAPI) | ⚠️ Returns 0 results — deferred 1 week |

---

## Phase 2: Community Platform
*GetStream + Buttondown integration — next up*

### Phase 2a: Broadcast (Weeks 1-2)
| Feature | Status |
|---------|--------|
| Community tables (announcements, resources, newsletter_sends, stream_tokens) | 🔲 In progress |
| Stream token-minting Edge Function | 🔲 In progress |
| Announcements feed component | 🔲 Not started |
| Resource library component | 🔲 Not started |
| Newsletter composer (Buttondown) | 🔲 Not started |
| "Community" tab in navigation | 🔲 Not started |
| Import 292 fellow emails to Buttondown | 🔲 Not started |

### Phase 2b: Discovery (Weeks 3-4)
| Feature | Status |
|---------|--------|
| Enhanced directory search & filters | 🔲 |
| "Currently working on" field for fellows | 🔲 |
| Fellow spotlight / featured profiles | 🔲 |
| Activity feed (GetStream) | 🔲 |
| Push notification support | 🔲 |

### Phase 2c: Engagement (Weeks 5-6)
| Feature | Status |
|---------|--------|
| Reactions on announcements | 🔲 |
| Comments / discussion threads | 🔲 |
| Direct messaging (Stream Chat) | 🔲 |
| Program channels (CPF, GGF, ESP) | 🔲 |
| Unread indicators & notification badges | 🔲 |
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
*Data-driven engagement tracking*

| Feature | Status |
|---------|--------|
| Engagement dashboard (staff view) | 🔲 |
| Fellow activity scoring | 🔲 |
| Outreach priority suggestions | 🔲 |
| Program health metrics | 🔲 |
| Export / reporting tools | 🔲 |

---

## Phase 4: Scale & Polish
*Production hardening*

| Feature | Status |
|---------|--------|
| Social media scanning (FB, IG, Twitter, LinkedIn) | 🔲 |
| Multi-language support (Spanish for ESP fellows) | 🔲 |
| Offline/PWA caching improvements | 🔲 |
| Performance optimization | 🔲 |
| Split index.html into modules (at 10K+ lines) | 🔲 |
| Automated testing | 🔲 |

---

## Architecture Decisions Log

| Date | Decision | Rationale |
|------|----------|-----------|
| Jan 2026 | Single HTML file | Simplicity for small team, appropriate at current scale |
| Jan 2026 | Supabase over Firebase | Better Postgres features, RLS, Edge Functions |
| Feb 2026 | GetStream for community | Real-time feeds without building from scratch |
| Feb 2026 | Buttondown for email | Simple API, good for newsletters at this volume |
| Feb 2026 | Lurker-first architecture | 30-50% active engagement realistic; design for passive consumption |

---

## Cost Projection

| Service | Tier | Monthly Cost | Notes |
|---------|------|-------------|-------|
| GetStream | Maker (free) | $0 | <5 team members, <$10K revenue |
| Buttondown | Basic | $9/mo | 292 subscribers (free tier is 100) |
| Supabase | Free | $0 | Already using |
| Netlify | Free | $0 | Already using |
| **Total** | | **$9/mo** | Check if nonprofit discount applies |
