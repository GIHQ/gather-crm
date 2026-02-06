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
| fellow_id | text | Human-readable ID (P001-P292) |
| first_name | text | |
| last_name | text | |
| email | text | Primary contact email |
| alternate_emails | text[] | Additional email addresses for identity matching |
| phone | text | Phone number |
| program | text | CPF, GGF, or ESP |
| cohort_year | integer | Year they joined (2019-2024) |
| city | text | Current city |
| country | text | Country of residence |
| organization | text | Current employer/org |
| title | text | Job title |
| bio | text | Biography/description |
| photo_url | text | URL to photo in Supabase Storage |
| linkedin_url | text | LinkedIn profile |
| is_active | boolean | Whether currently active in network |
| user_id | uuid | FK → auth.users.id (linked on first login) |
| staff_notes | text | Internal notes visible only to admins |
| created_at | timestamptz | |
| updated_at | timestamptz | |

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
Individual tags within each category (20 focus areas, 77 community areas, etc.).

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

### Focus Areas (FA001-FA020)
| Code | Name | Emoji |
|------|------|-------|
| FA001 | Peacebuilding & Conflict Resolution | 🕊️ |
| FA002 | Youth Development & Mentorship | 👥 |
| FA003 | Violence Prevention & Intervention | 🛡️ |
| FA004 | Community Organizing & Civic Engagement | 📢 |
| FA005 | Education & Academic Support | 📚 |
| FA006 | Arts, Culture & Creative Expression | 🎨 |
| FA007 | Economic Empowerment & Workforce Dev | 💼 |
| FA008 | Mental Health & Wellness | 🧠 |
| FA009 | Trauma-Informed Care & Healing | 💚 |
| FA010 | Restorative Justice & Reentry | ⚖️ |
| FA011 | Public Health & Health Equity | 🏥 |
| FA012 | Environmental Justice & Sustainability | 🌱 |
| FA013 | Housing & Urban Development | 🏘️ |
| FA014 | Food Security & Nutrition | 🍎 |
| FA015 | Immigration & Refugee Services | 🌍 |
| FA016 | Gender Equity & Women's Empowerment | ♀️ |
| FA017 | LGBTQ+ Advocacy & Support | 🏳️‍🌈 |
| FA018 | Policy & Advocacy | 📋 |
| FA019 | Media, Communications & Storytelling | 📱 |
| FA020 | Interfaith Dialogue & Spiritual Wellness | 🙏 |

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

### user_roles
- Super admin only for all operations

---

## Useful Queries

### Fellows missing focus areas
```sql
SELECT f.fellow_id, f.first_name, f.last_name, f.program
FROM fellows f
LEFT JOIN fellow_focus_tags fft ON f.id = fft.fellow_id
WHERE fft.id IS NULL
ORDER BY f.program, f.fellow_id;
```

### Interaction counts by fellow
```sql
SELECT 
  f.fellow_id,
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
