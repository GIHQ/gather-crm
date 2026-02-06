# GATHER Community Platform - Product Plan

> **Last Updated:** February 5, 2026
> **Version:** 2.0 (replaces original COMMUNITY_BUILD_PLAN.md)

---

## Vision

Transform GATHER from a staff-only CRM into a **living alumni network** where 292 Goldin Institute fellows can discover each other, stay informed, collaborate across programs, and deepen their connection to the Institute - all within the same platform staff already uses to manage relationships.

---

## Design Principles

1. **Design for lurkers first.** With 30-50% active engagement expected, the majority will consume passively. Every feature should deliver value to someone who never posts.

2. **One platform, two experiences.** Staff see CRM tools. Fellows see a community. Same app, same data, different views based on role.

3. **Supabase is the source of truth.** GetStream and Buttondown are service layers. Fellow data, permissions, and relationships always live in Supabase.

4. **Progressive engagement.** Don't force participation. Start with read-only value (directory, announcements, newsletters), then surface opportunities to engage (reactions, comments, messages).

5. **Cross-program by default.** CPF, GGF, and ESP fellows rarely interact today. The platform should surface connections across programs, not silo them.

---

## Tools & Responsibilities

| Tool | Role | What It Does |
|------|------|-------------|
| **Supabase** | Source of truth | Fellow data, auth, announcements, resources, permissions, realtime subscriptions |
| **GetStream** | Social layer | Activity feeds, direct messaging, reactions, follow relationships, typing indicators |
| **Buttondown** | Email layer | Newsletters, digest emails, cohort updates, automated sends |

---

## User Personas

### Maria - Staff Member
- Needs to broadcast announcements to all fellows or specific cohorts
- Wants to see who's engaging and who's gone quiet
- Sends monthly newsletters, currently via manual email
- Tracks interactions in the CRM

### David - Active Fellow (the 30-50%)
- Wants to know what other fellows are working on
- Interested in finding collaborators with complementary skills
- Would message another fellow if it were easy
- Checks in weekly, responds to things that interest him

### Amina - Passive Fellow (the 50-70%)
- Reads newsletters when they arrive
- Might browse the directory occasionally
- Won't post or message unless directly relevant
- Values knowing the network exists even if she doesn't use it actively

---

## Feature Map

### Tier 1: Broadcast (Staff -> Fellows)
*Delivers value even if zero fellows actively engage.*

| Feature | Tool | Description |
|---------|------|-------------|
| **Announcements Feed** | Supabase | Staff posts updates visible on fellow dashboard. Pinnable, program-targetable. |
| **Newsletter Composer** | Buttondown | Staff writes and sends newsletters to all fellows or filtered by program/cohort. |
| **Resource Library** | Supabase | Shared documents, links, videos organized by category. Staff curates, fellows browse. |
| **Automated Digests** | Buttondown | Weekly/monthly email summarizing new announcements, resources, and network activity. |

### Tier 2: Discovery (Fellow <-> Fellow, passive)
*Delivers value by making the network visible.*

| Feature | Tool | Description |
|---------|------|-------------|
| **Enhanced Directory** | Supabase | Search/filter by focus area, skills, location, program. Already partially built. |
| **Fellow Spotlights** | GetStream Feed | Auto-generated cards: "Meet [name] - working on [project] in [city]" rotating weekly. |
| **Activity Feed** | GetStream | See what's happening across the network: new fellows, project updates, milestones. |
| **"Working On" Profiles** | Supabase | Each fellow can add a short "currently working on" blurb visible in directory. |

### Tier 3: Engagement (Fellow <-> Fellow, active)
*For the 30-50% who want to participate.*

| Feature | Tool | Description |
|---------|------|-------------|
| **Reactions & Comments** | GetStream | React to announcements and feed posts. Low-friction engagement. |
| **Direct Messaging** | GetStream | 1:1 messaging between fellows. Private, in-app. |
| **Program Channels** | GetStream | Dedicated conversation spaces for CPF, GGF, ESP + a cross-program "General" channel. |
| **Interest Groups** | GetStream | Optional channels around shared focus areas (e.g., "Youth Development," "Arts & Culture"). |

### Tier 4: Collaboration (Fellow <-> Fellow, deep)
*Future - only if engagement warrants it.*

| Feature | Tool | Description |
|---------|------|-------------|
| **Project Board** | Supabase | Fellows post projects seeking collaborators. Others can express interest. |
| **Mentorship Matching** | Supabase | Senior fellows mentor newer cohorts. Opt-in matching based on focus areas. |
| **Event Calendar** | Supabase | Community events, reunions, webinars. RSVP tracking. |
| **Job Board** | Supabase | Fellows share opportunities within their organizations. |

---

## Implementation Phases

### Phase 1: Foundation (Week 1-2)
*Goal: Staff can broadcast. Fellows can receive.*

**Build:**
- [ ] Stream token-minting Edge Function (auth'd users get Stream tokens)
- [ ] Announcements table + RLS policies in Supabase
- [ ] Resources table + RLS policies in Supabase
- [ ] Announcements feed component (read-only for fellows, write for staff)
- [ ] Resource library component (browse by category)
- [ ] Newsletter composer in admin settings (Buttondown API integration)
- [ ] "Community" tab in the main app navigation

**Buttondown Setup:**
- [ ] Import all 292 fellow emails as subscribers (with program/cohort tags)
- [ ] Configure sender domain (@goldininstitute.org DKIM records)
- [ ] Create newsletter templates (full network, CPF-only, GGF-only, ESP-only)

**GetStream Setup:**
- [ ] Create channel types: `announcements`, `general`, `cpf`, `ggf`, `esp`
- [ ] Sync all 292 fellows as Stream users (batch via Edge Function)
- [ ] Configure moderation settings (profanity filter, image moderation)

**Result:** Staff can post announcements and send newsletters. Fellows see a Community tab with announcements and resources.

---

### Phase 2: Discovery (Week 3-4)
*Goal: Fellows can see what each other are doing.*

**Build:**
- [ ] "Currently working on" field added to fellow profiles
- [ ] Enhanced directory filters (focus area, skills, location, program)
- [ ] Activity feed component using GetStream (read-only initially)
- [ ] Fellow Spotlight automation (weekly rotation, pulls from bio data)
- [ ] Push notification support via service worker update

**GetStream Feed Setup:**
- [ ] Configure activity feed for network-wide updates
- [ ] Auto-generate activities when: staff posts announcement, fellow updates profile, new fellow joins
- [ ] Fellow Spotlight feed items (curated by staff or automated)

**Result:** Fellows can browse an active feed showing network activity. Directory is meaningfully searchable. Passive fellows get value just by scrolling.

---

### Phase 3: Engagement (Week 5-6)
*Goal: Fellows can interact with each other.*

**Build:**
- [ ] Reactions on announcements and feed posts
- [ ] Comments on announcements
- [ ] Direct messaging UI (1:1 conversations)
- [ ] Program channels (CPF, GGF, ESP group chats)
- [ ] General cross-program channel
- [ ] Unread indicators and notification badges
- [ ] Weekly digest email via Buttondown (automated: top announcements, active discussions, new fellows)

**GetStream Messaging Setup:**
- [ ] Enable message search
- [ ] Configure read receipts and typing indicators
- [ ] Set up push notifications for new messages
- [ ] Moderation: staff can moderate all channels, fellows can report messages

**Result:** Active fellows can message each other, participate in program discussions, and react to content. The community feels alive.

---

### Phase 4: Collaboration (Month 2+)
*Goal: Deepen connections beyond chat.*

**Build (prioritize based on engagement data):**
- [ ] Interest-based channels (auto-created from popular focus areas)
- [ ] Project board (post -> browse -> connect flow)
- [ ] Event calendar with RSVP
- [ ] Mentorship opt-in and matching
- [ ] Job/opportunity board
- [ ] Annual engagement report for Goldin Institute

**Result:** The network becomes self-sustaining, with fellows initiating connections independently of staff.

---

## Technical Architecture

```
+-------------------------------------------------------------+
|                        GATHER App                           |
|                                                             |
|  +----------+  +--------------+  +-----------------------+  |
|  |   CRM    |  |  Community   |  |     Newsletters       |  |
|  |  (staff) |  |  (fellows)   |  |  (Buttondown email)   |  |
|  |          |  |              |  |                       |  |
|  | Fellows  |  | Feed    Chat |  | Compose    Templates  |  |
|  | Interact |  | Announce DM  |  | Schedule   Analytics  |  |
|  | Reports  |  | Resources    |  | Cohort targeting      |  |
|  +----+-----+  +------+-------+  +-----------+-----------+  |
|       |               |                      |              |
|       +---------------+----------------------+              |
|                       |                                     |
|              +--------+--------+                            |
|              |    Supabase     |                            |
|              |  (source of     |                            |
|              |   truth)        |                            |
|              +---+---------+---+                            |
|                  |         |                                |
|           +------+--+  +---+----------+                     |
|           |GetStream|  | Buttondown   |                     |
|           |  (sync) |  |   (sync)     |                     |
|           +---------+  +--------------+                     |
+-------------------------------------------------------------+

Data Flow:
1. Fellow signs in -> Supabase Auth -> Stream token minted -> Stream connected
2. Staff posts announcement -> Supabase INSERT -> Stream activity created -> Push notification
3. Staff sends newsletter -> Buttondown API -> Emails delivered -> Logged in Supabase
4. Fellow messages fellow -> Stream handles realtime -> Message stored in Stream
5. Fellow updates profile -> Supabase UPDATE -> Stream user synced -> Feed activity generated
```

---

## New Database Tables

```sql
-- Announcements (staff -> fellows)
CREATE TABLE announcements (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    author_id UUID REFERENCES auth.users(id),
    target_programs TEXT[] DEFAULT '{}',  -- empty = all programs
    is_pinned BOOLEAN DEFAULT false,
    published_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Resources (shared docs/links)
CREATE TABLE resources (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title TEXT NOT NULL,
    description TEXT,
    url TEXT NOT NULL,
    category TEXT,  -- 'document', 'link', 'video', 'template'
    target_programs TEXT[] DEFAULT '{}',
    uploaded_by UUID REFERENCES auth.users(id),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Newsletter tracking
CREATE TABLE newsletter_sends (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    buttondown_id TEXT,
    subject TEXT NOT NULL,
    body_preview TEXT,
    recipient_count INTEGER,
    target_programs TEXT[],
    sent_by UUID REFERENCES auth.users(id),
    sent_at TIMESTAMPTZ DEFAULT NOW()
);

-- Stream token cache
CREATE TABLE stream_tokens (
    user_id UUID PRIMARY KEY REFERENCES auth.users(id),
    token TEXT NOT NULL,
    expires_at TIMESTAMPTZ NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Fellow "working on" (extends fellows table)
-- ALTER TABLE fellows ADD COLUMN working_on TEXT;
-- ALTER TABLE fellows ADD COLUMN working_on_updated_at TIMESTAMPTZ;
```

---

## Edge Functions Needed

| Function | Purpose | Trigger |
|----------|---------|---------|
| `stream-token` | Mint GetStream tokens for authenticated users | On login / token refresh |
| `stream-sync-users` | Batch sync all 292 fellows to GetStream | Manual / on fellow update |
| `send-newsletter` | Send email via Buttondown API | Staff action |
| `weekly-digest` | Auto-generate and send weekly summary | Cron (Supabase scheduled) |
| `stream-webhook` | Receive GetStream events (message count, etc.) | GetStream webhook |

---

## Navigation Update

Current app navigation needs a "Community" tab:

```
+-----------------------------------------+
|  Home  |  Directory  |  Community  |  Settings  |
+-----------------------------------------+
```

Community tab contains:
- **Feed** (default view) - Announcements + activity
- **Messages** - DM inbox
- **Channels** - Program channels + interest groups
- **Resources** - Shared docs and links

---

## Engagement Metrics to Track

| Metric | How | Goal |
|--------|-----|------|
| Monthly Active Users | Stream analytics + Supabase auth logs | 30-50% of 292 = 88-146 |
| Newsletter open rate | Buttondown analytics | >40% |
| Messages sent/week | Stream analytics | Growing week over week |
| Directory searches/week | Supabase logs | Indicates discovery value |
| Announcements read rate | Stream feed analytics | >60% |
| Fellow-initiated connections | DM conversations started | Growing month over month |

---

## Cost Projection

| Service | Tier | Monthly Cost | Notes |
|---------|------|-------------|-------|
| GetStream | Maker (free) | $0 | <5 team members, <$10K revenue |
| Buttondown | Free | $0 | Up to 100 subscribers |
| Buttondown | Basic | $9/mo | If >100 subscribers (we have 292) |
| Supabase | Free | $0 | Already using |
| Netlify | Free | $0 | Already using |
| **Total** | | **$0-9/mo** | |

Note: Buttondown free tier supports 100 subscribers. With 292 fellows, we'll need the Basic plan at $9/month. Check if nonprofit discount (50% off) was applied.

---

## Risk & Mitigation

| Risk | Impact | Mitigation |
|------|--------|-----------|
| Low fellow adoption | Community feels empty | Seed with staff content first. Fellow Spotlights create passive content. Don't launch messaging until feed has activity. |
| GetStream free tier limits | Service interruption | Monitor usage. 292 MAU is well within limits. Have Supabase Realtime as fallback for basic messaging. |
| Newsletter fatigue | Fellows unsubscribe | Start monthly, not weekly. Make digests valuable with real content. Always include unsubscribe. |
| Moderation burden | Inappropriate content | Staff moderate all channels. Keep channels low-volume initially. GetStream has built-in moderation tools. |
| Data sync issues | Stream/Supabase out of sync | Supabase is always truth. Stream is regenerable. Build sync-check Edge Function. |

---

## Launch Strategy

1. **Soft launch (staff only):** Test all features internally for 1 week.
2. **Beta (10 active fellows):** Invite engaged fellows from each program. Get feedback.
3. **Full launch:** Email all 292 fellows via Buttondown announcing the community features.
4. **Ongoing:** Weekly staff posts, monthly newsletters, quarterly Fellow Spotlights.

---

## Success Criteria (90 days post-launch)

- [ ] 100+ fellows have logged in at least once
- [ ] 50+ fellows have viewed the community feed
- [ ] 20+ DM conversations initiated between fellows
- [ ] 3+ newsletters sent with >40% open rate
- [ ] At least 1 cross-program connection formed (CPF<->GGF or CPF<->ESP)
- [ ] Staff reports time savings on communication tasks
