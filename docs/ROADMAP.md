# GATHER Roadmap

**Last updated:** Feb 7, 2026

---

## Phase 1: Foundation (Core CRM + Directory) — ✅ Complete

- Fellow database with 292 records across CPF, GGF, ESP
- Google OAuth login with identity matching
- Directory with search, filters, and focus area tags
- Fellow profile pages with photo, bio, and contact info
- Interaction logging (calls, emails, meetings, events)
- Team management (11 staff with roles and permissions)
- Profile claiming flow for unrecognized emails
- Focus areas system (20 focus areas, 77 Chicago community areas)
- News scanner (SerpAPI integration)
- Mobile-first PWA with service worker

---

## Phase 2: Community Platform — 🟡 In Progress

### Phase 2a: Broadcast (Weeks 1-2) — backend done, frontend next

**Goal:** Staff can broadcast. Fellows can receive.

- [x] GetStream account created, API keys configured
- [x] Buttondown account created, API key configured
- [x] Community tables: announcements, resources, newsletter_sends, stream_tokens
- [x] stream-token Edge Function (JWT minting + user sync)
- [x] Fellows table extended with `working_on` field
- [ ] Announcements feed component (read for fellows, write for staff)
- [ ] Resource library component (browse by category)
- [ ] Newsletter composer in admin settings (Buttondown API)
- [ ] "Community" tab in main navigation
- [ ] Import 292 fellow emails to Buttondown as subscribers

### Phase 2b: Discovery (Weeks 3-4)

**Goal:** Fellows can see what each other are doing.

- [ ] "Currently working on" field in fellow profiles
- [ ] Enhanced directory filters (focus area, skills, location, program)
- [ ] Activity feed component using GetStream
- [ ] Fellow Spotlight automation (weekly rotation)
- [ ] Push notification support via service worker update

### Phase 2c: Engagement (Weeks 5-6)

**Goal:** Fellows can interact with each other.

- [ ] Reactions on announcements and feed posts
- [ ] Comments on announcements
- [ ] Direct messaging UI (1:1 conversations)
- [ ] Program channels (CPF, GGF, ESP group chats)
- [ ] General cross-program channel
- [ ] Unread indicators and notification badges
- [ ] Weekly digest email via Buttondown

### Phase 2d: Collaboration (Month 2+)

**Goal:** Deepen connections beyond chat.

- [ ] Interest-based channels (auto-created from popular focus areas)
- [ ] Project board (post, browse, connect)
- [ ] Event calendar with RSVP
- [ ] Mentorship opt-in and matching
- [ ] Job/opportunity board

---

## Phase 3: Analytics & Insights

- [ ] Engagement dashboard for staff (MAU, message volume, feed activity)
- [ ] Newsletter analytics (open rates, click rates via Buttondown)
- [ ] Fellow activity reports (who's active, who's gone quiet)
- [ ] Annual engagement report for Goldin Institute
- [ ] Directory search analytics

---

## Phase 4: Scale & Polish

- [ ] Code splitting when index.html exceeds 10K lines
- [ ] Multi-language support for ESP fellows
- [ ] Social media scanning expansion (FB, IG, Twitter, LinkedIn)
- [ ] Performance optimization and caching
- [ ] Accessibility audit and improvements
- [ ] Automated testing suite
