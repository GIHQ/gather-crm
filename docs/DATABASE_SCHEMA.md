# GATHER Database Schema

## Supabase Project
- **Project ID:** pwazurumpzydxyppbvee
- **Region:** (check dashboard)
- **URL:** https://pwazurumpzydxyppbvee.supabase.co

---

## Core Tables

### fellows
The main table storing all 292 Goldin Institute fellows.

| Column | Type | Description |
|--------|------|-------------|
| id | uuid | Primary key |
| first_name | text | |
| last_name | text | |
| email | text | Primary contact email |
| work_email | text | Work email address |
| alternate_emails | text[] | Additional email addresses for identity matching |
| phone | text | Phone number |
| program | text | CPF, GGF, or ESP |
| cohort | text | Cohort identifier (e.g., "2019", "2024") |
| city | text | Current city |
| country | text | Country of residence |
| region | text | Geographic region |
| sub_region | text | Sub-region |
| community_area | text | Chicago community area (CPF fellows) |
| organization | text | Current employer/org |
| job_title | text | Job title |
| biography | text | Biography/description |
| photo_url | text | URL to photo in Supabase Storage |
| linkedin_url | text | LinkedIn profile |
| linkedin_org | text | Organization LinkedIn |
| twitter_org | text | Organization Twitter |
| instagram_org | text | Organization Instagram |
| facebook_org | text | Organization Facebook |
| website_org | text | Organization website |
| languages | text | Languages spoken |
| focus_area_1 | text | Primary focus area (free text) |
| focus_area_2 | text | Secondary focus area (free text) |
| focus_area_3 | text | Tertiary focus area (free text) |
| status | text | Fellow status — all 292 have status = 'Alumni' |
| user_id | uuid | FK → auth.users.id (linked on first login) |
| staff_notes | text | Internal notes visible only to admins |
| working_on | text | Fellow's current project/focus (community feature) |
| working_on_updated_at | timestamptz | When working_on was last changed |
| last_news_search | timestamptz | When fellow was last included in news scan |
| created_at | timestamptz | |
| updated_at | timestamptz | |

> **Note:** Earlier versions of this doc listed incorrect column names (`is_active`, `bio`, `title`, `cohort_year`, `fellow_id`). The columns above reflect the actual database schema as of Feb 2026.

### interactions
Logs all touchpoints between staff and fellows.

| Column | Type | Description |
|--------|------|-------------|
| id | uuid | Primary key |
| fellow_id | uuid | FK → fellows.id |
| interaction_type | text | Call, Email, Meeting, Event, News Mention, etc. |
| interaction_date | date | When it occurred |
| title | text | Brief summary |
| notes | text | Detailed notes |
| logged_by | text | Staff member who logged it |
| created_at | timestamptz | |

### user_roles
Maps authenticated users to permission tiers.

| Column | Type | Description |
|--------|------|-------------|
| id | uuid | Primary key |
| user_id | uuid | FK → auth.users.id |
| role | text | super_admin, admin, staff, fellow, viewer, guest |
| created_at | timestamptz | |

### team_members
Staff and team members of the Goldin Institute. Appear in directory with silver "Team" badge.

| Column | Type | Description |
|--------|------|-------------|
| id | uuid | Primary key |
| user_id | uuid | FK → auth.users.id (linked on first login) |
| email | text | Primary email (unique) |
| alternate_emails | text[] | Additional emails for identity matching |
| first_name | text | |
| last_name | text | |
| title | text | Job title |
| photo_url | text | Profile photo URL |
| bio | text | Biography |
| phone | text | Phone number |
| linkedin_url | text | LinkedIn profile |
| role | text | Permission tier: super_admin, admin, manager, team |
| fellowships | jsonb | Array of {program, year} if staff is also a fellow |
| is_active | boolean | Whether currently active |
| staff_notes | text | Internal notes visible only to admins |
| created_at | timestamptz | |
| updated_at | timestamptz | |

**Indexes:**
- `idx_team_members_alternate_emails` - GIN index on alternate_emails
- `idx_team_members_fellowships` - GIN index on fellowships

**Fellowships format:**
```json
[
  {"program": "CPF", "year": 2021},
  {"program": "GGF", "year": 2023}
]
```

### profile_claim_requests
Tracks requests from users to claim an existing profile when their email isn't recognized.

| Column | Type | Description |
|--------|------|-------------|
| id | uuid | Primary key |
| requesting_email | text | Email the user logged in with |
| requesting_user_id | uuid | FK → auth.users.id |
| target_type | text | 'fellow' or 'team_member' |
| target_id | uuid | ID of the profile being claimed |
| status | text | 'pending', 'approved', 'rejected' |
| reviewed_by | uuid | FK → auth.users.id (admin who reviewed) |
| reviewed_at | timestamptz | When the decision was made |
| notes | text | Optional notes from reviewer |
| created_at | timestamptz | |

**Workflow:**
1. User logs in with unrecognized email
2. System shows potential profile matches based on name parsing
3. User selects "This is me" on a profile
4. Claim request created with status 'pending'
5. Admin reviews in Team Management page
6. If approved: alternate_emails updated on target profile
7. User can now log in and access their profile

### app_settings
Key-value store for shared application configuration (e.g., news scanner search terms).

| Column | Type | Description |
|--------|------|-------------|
| id | uuid | Primary key |
| key | text | Unique setting key |
| value | jsonb | Setting value (any JSON) |
| updated_at | timestamptz | Last modification timestamp |
| updated_by | uuid | FK → auth.users.id (who last changed it) |

**Current keys:**
- `news_search_terms` — JSON array of custom organizational keywords for the news scanner (default: `["Goldin Institute", "Chicago Peace Fellows", "Goldin Global Fellows", "GATHER"]`)

**RLS:**
- **SELECT:** Authenticated users can read all settings
- **ALL:** Admins (admin, super_admin via team_members) can insert/update/delete

---

## Community Tables

### announcements
Staff-created announcements broadcast to fellows. Supports program targeting and pinning.

| Column | Type | Description |
|--------|------|-------------|
| id | uuid | Primary key |
| title | text | Announcement title |
| content | text | Full announcement body |
| author_id | uuid | FK → auth.users.id |
| target_programs | text[] | Program filter (empty = all programs) |
| is_pinned | boolean | Whether pinned to top of feed |
| published_at | timestamptz | When published (null = draft) |
| created_at | timestamptz | |
| updated_at | timestamptz | |

### resources
Shared documents, links, videos, and templates curated by staff.

| Column | Type | Description |
|--------|------|-------------|
| id | uuid | Primary key |
| title | text | Resource title |
| description | text | Brief description |
| url | text | Link to the resource |
| category | text | 'document', 'link', 'video', 'template' |
| target_programs | text[] | Program filter (empty = all programs) |
| uploaded_by | uuid | FK → auth.users.id |
| created_at | timestamptz | |

### newsletter_sends
Tracks newsletters sent via Buttondown for audit and analytics.

| Column | Type | Description |
|--------|------|-------------|
| id | uuid | Primary key |
| buttondown_id | text | Buttondown's email ID |
| subject | text | Email subject line |
| body_preview | text | First ~200 chars of body |
| recipient_count | integer | Number of recipients |
| target_programs | text[] | Which programs were targeted |
| sent_by | uuid | FK → auth.users.id |
| sent_at | timestamptz | When the email was sent |

### stream_tokens
Caches GetStream JWT tokens to avoid re-minting on every request.

| Column | Type | Description |
|--------|------|-------------|
| user_id | uuid | PK, FK → auth.users.id |
| token | text | GetStream JWT token |
| expires_at | timestamptz | Token expiration (24h from creation) |
| created_at | timestamptz | |

---

## Focus Areas System

### focus_categories
The four main groupings for fellow expertise.

| Column | Type | Description |
|--------|------|-------------|
| id | uuid | Primary key |
| name | text | Skills, Populations Served, Focus Areas, Community Areas |
| slug | text | URL-safe identifier |
| display_order | integer | Sort order in UI |

### focus_tags
Individual tags within each category (44 focus areas, 77 community areas, etc.).

| Column | Type | Description |
|--------|------|-------------|
| id | uuid | Primary key |
| category_id | uuid | FK → focus_categories.id |
| name | text | Tag display name |
| slug | text | URL-safe identifier |
| emoji | text | Visual indicator (optional) |

### fellow_focus_tags
Junction table linking fellows to their tags.

| Column | Type | Description |
|--------|------|-------------|
| id | uuid | Primary key |
| fellow_id | uuid | FK → fellows.id |
| tag_id | uuid | FK → focus_tags.id |
| is_primary | boolean | For Community Areas: distinguishes primary vs secondary |
| created_at | timestamptz | |

---

## Focus Area Reference

### Focus Areas (44 tags)
| Name |
|------|
| Arts & Culture |
| Arts, Culture & Media |
| Child Protection & Rights |
| Civic Engagement |
| Climate Action |
| Climate Action & Environmental Justice |
| Community Building |
| Community Development & Empowerment |
| Criminal Justice Reform & Reentry |
| Economic Development |
| Economic Development & Entrepreneurship |
| Education |
| Education & Academic Support |
| Environmental Justice |
| Food Security |
| Gender Equality |
| Gender Justice & Womens Empowerment |
| Health & Disability Justice |
| Health/Wellness |
| Housing |
| Human Rights |
| Human Rights & Advocacy |
| Humanitarian Aid & Disaster Response |
| Immigration Services |
| Indigenous Rights & Cultural Preservation |
| Interfaith Dialogue & Spiritual Wellness |
| Legal Services |
| LGBTQ+ Rights & Inclusion |
| Mental Health |
| Mental Health & Trauma Support |
| Migration & Refugee Support |
| Peacebuilding |
| Peacebuilding & Conflict Resolution |
| Public Safety |
| Racial Justice |
| Social Enterprise |
| Social Justice & Racial Equity |
| Substance Abuse |
| Technology Access |
| Violence Prevention |
| Violence Prevention & Survivor Support |
| Workforce Development |
| Youth Development |
| Youth Development & Leadership |

As of Feb 2026, **274 of 292 fellows** have focus area tags assigned (1-4 per fellow).

### Community Areas (Chicago - CPF only)
77 Chicago neighborhoods. See full list in `migrations/seed_community_areas.sql`.

---

## Storage Buckets

### Photos
- **Type:** Public bucket
- **Path:** `/Photos/{filename}`
- **URL Pattern:** `https://pwazurumpzydxyppbvee.supabase.co/storage/v1/object/public/Photos/{filename}`
- **Naming:** Most use `{fellow_id}.png` (e.g., P001.png)

---

## Row Level Security (RLS)

All tables have RLS enabled. Key policies:

### fellows
- **SELECT:** Anyone (public directory, `USING (true)`)
- **UPDATE (self):** Fellows can update own profile where `user_id = auth.uid()`
- **UPDATE (admin):** Admins can update any fellow (checked via team_members role)
- **INSERT/DELETE:** Admin+ only

### team_members
- **SELECT:** Anyone can view active team members (`is_active = true`)
- **UPDATE (self):** Team members can update own profile where `user_id = auth.uid()`
- **ALL (admin):** Admins/super_admins can manage all team members

### profile_claim_requests
- **SELECT (self):** Users can view their own claims (`requesting_user_id = auth.uid()`)
- **INSERT (self):** Users can create claims for themselves
- **ALL (admin):** Admins can view and manage all claims

### interactions
- Staff+ can SELECT all
- Staff+ can INSERT
- Own interactions can be updated by creator

### focus_* tables
- **focus_categories:** Public SELECT (`USING (true)`)
- **focus_tags:** Public SELECT (`USING (true)`)
- **fellow_focus_tags:** Public SELECT, authenticated can manage
- Staff+ can manage all assignments

### announcements
- **SELECT:** Anyone can read published announcements (`published_at IS NOT NULL AND published_at <= NOW()`)
- **ALL (staff):** Active team_members can manage all announcements

### resources
- **SELECT:** Anyone (`USING (true)`)
- **ALL (staff):** Active team_members can manage all resources

### newsletter_sends
- **SELECT (staff):** Active team_members can view send history
- **INSERT (staff):** Active team_members can log sends

### stream_tokens
- **SELECT (self):** Users can read only their own token (`user_id = auth.uid()`)
- **INSERT/UPDATE:** Service role only (via Edge Function)

### user_roles
- Super admin only for all operations

---

## Useful Queries

### Fellows missing focus areas
```sql
SELECT f.first_name, f.last_name, f.program
FROM fellows f
WHERE f.status = 'Alumni'
AND NOT EXISTS (
  SELECT 1 FROM fellow_focus_tags fft
  JOIN focus_tags ft ON fft.tag_id = ft.id
  JOIN focus_categories fc ON ft.category_id = fc.id
  WHERE fft.fellow_id = f.id AND fc.slug = 'focus-areas'
)
ORDER BY f.program, f.last_name;
```

### Interaction counts by fellow
```sql
SELECT
  f.first_name || ' ' || f.last_name as name,
  f.program,
  COUNT(i.id) as interaction_count,
  MAX(i.interaction_date) as last_contact
FROM fellows f
LEFT JOIN interactions i ON f.id = i.fellow_id
GROUP BY f.id
ORDER BY last_contact NULLS FIRST;
```

### Focus area distribution
```sql
SELECT 
  ft.name as tag_name,
  fc.name as category,
  COUNT(fft.id) as fellow_count
FROM focus_tags ft
JOIN focus_categories fc ON ft.category_id = fc.id
LEFT JOIN fellow_focus_tags fft ON ft.id = fft.tag_id
GROUP BY ft.id, fc.name
ORDER BY fc.display_order, fellow_count DESC;
```
