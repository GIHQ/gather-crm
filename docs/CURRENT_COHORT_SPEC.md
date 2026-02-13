# Current Cohort Management — Specification

> **Created:** February 13, 2026
> **Status:** In Progress
> **Branch:** claude/add-current-cohort-7qV59

---

## Overview

Extend GATHER from an Alumni CRM into a platform that also manages **Current Fellows** — active cohorts going through the fellowship program at three sites. After each program year, current fellows transition to Alumni status and join the existing alumni directory.

### Three Sites (2026)

| Site | City | Country | Program | Est. Fellows |
|------|------|---------|---------|-------------|
| Chicago | Chicago | USA | CPF | 10-20 |
| Dar es Salaam | Dar es Salaam | Tanzania | GGF | 10-20 |
| Mosquera | Mosquera | Colombia | ESP | 10-20 |

Each site has 1-5 team members managing its cohort.

---

## Architecture Decisions

### 1. Single App, Not Separate
Current fellows live within the same `index.html` app. Rationale:
- Shared auth session and permissions
- Admins see both alumni and current cohorts in one place
- Fellows transition from current → alumni by changing `status`
- Shared design system and components

### 2. Extend `fellows` Table
Rather than a separate table, current fellows use the same `fellows` table with:
- `status = 'Current'` (vs `'Alumni'` for graduates)
- `site_id` FK to new `sites` table
- Same fields: name, email, photo, program, cohort, etc.

### 3. Navigation
Add "Cohorts" to the slide menu (team+ access). Leads to:
- **Cohort Dashboard** — overview of all three sites with key metrics
- **Site Detail** — drill into one site with tabs:
  - Directory (fellow cards, same style as alumni)
  - Events (meeting list + attendance)
  - Curriculum (chapter/assignment progress)
  - Health (engagement scores + trends)
  - Lists (ad hoc data collection)

---

## Database Schema — New Tables

### sites
Program sites where current cohorts operate.

| Column | Type | Description |
|--------|------|-------------|
| id | uuid | Primary key |
| name | text | Site display name (e.g., "Chicago") |
| city | text | City |
| country | text | Country |
| program | text | Associated program: CPF, GGF, ESP |
| cohort_year | integer | Current active year (e.g., 2026) |
| created_at | timestamptz | |

### fellows (modified)
Add columns to existing table:

| Column | Type | Description |
|--------|------|-------------|
| site_id | uuid | FK → sites.id (null for alumni) |

The existing `status` column changes from always-'Alumni' to one of: `'Alumni'`, `'Current'`.

### events
Cohort meetings, workshops, and sessions.

| Column | Type | Description |
|--------|------|-------------|
| id | uuid | Primary key |
| site_id | uuid | FK → sites.id |
| title | text | Event name |
| description | text | Details/notes |
| location | text | Physical location |
| meeting_link | text | Virtual/hybrid link |
| start_time | timestamptz | Start date/time |
| end_time | timestamptz | End date/time |
| notes | text | Internal notes |
| created_by | uuid | FK → auth.users.id |
| created_at | timestamptz | |

### event_attendance
Per-fellow attendance records for each event.

| Column | Type | Description |
|--------|------|-------------|
| id | uuid | Primary key |
| event_id | uuid | FK → events.id |
| fellow_id | uuid | FK → fellows.id |
| status | text | present, absent, excused, late |
| notes | text | Optional notes |
| recorded_by | uuid | FK → auth.users.id |
| created_at | timestamptz | |

**Unique constraint:** `(event_id, fellow_id)` — one record per fellow per event.

### curricula
Curriculum definitions per site/year.

| Column | Type | Description |
|--------|------|-------------|
| id | uuid | Primary key |
| site_id | uuid | FK → sites.id |
| name | text | Curriculum name |
| year | integer | Program year |
| created_at | timestamptz | |

### curriculum_chapters
Chapters within a curriculum.

| Column | Type | Description |
|--------|------|-------------|
| id | uuid | Primary key |
| curriculum_id | uuid | FK → curricula.id |
| title | text | Chapter title |
| description | text | Chapter description |
| order_num | integer | Display order |

### curriculum_items
Pages, assignments, and discussion prompts within chapters.

| Column | Type | Description |
|--------|------|-------------|
| id | uuid | Primary key |
| chapter_id | uuid | FK → curriculum_chapters.id |
| item_type | text | page, assignment, discussion |
| title | text | Item title |
| description | text | Item details |
| due_date | date | Due date (assignments only) |
| order_num | integer | Display order within chapter |

### fellow_curriculum_progress
Tracks individual fellow completion of curriculum items.

| Column | Type | Description |
|--------|------|-------------|
| id | uuid | Primary key |
| fellow_id | uuid | FK → fellows.id |
| item_id | uuid | FK → curriculum_items.id |
| completed | boolean | Whether completed |
| completed_at | timestamptz | When completed |
| recorded_by | uuid | FK → auth.users.id |

**Unique constraint:** `(fellow_id, item_id)` — one record per fellow per item.

### fellow_platform_activity
Tracks fellow logins to the GATHER platform (proxy for engagement).

| Column | Type | Description |
|--------|------|-------------|
| id | uuid | Primary key |
| fellow_id | uuid | FK → fellows.id |
| activity_date | date | Date of activity |
| login_count | integer | Number of logins that day |
| created_at | timestamptz | |

**Unique constraint:** `(fellow_id, activity_date)` — one record per fellow per day.

### adhoc_lists
Custom data collection lists attached to a site/cohort.

| Column | Type | Description |
|--------|------|-------------|
| id | uuid | Primary key |
| site_id | uuid | FK → sites.id |
| name | text | List name (e.g., "T-Shirt Sizes") |
| description | text | What this list tracks |
| fields | jsonb | Array of field definitions |
| created_by | uuid | FK → auth.users.id |
| created_at | timestamptz | |

**Fields JSONB format:**
```json
[
  {"key": "size", "label": "T-Shirt Size", "type": "select", "options": ["S", "M", "L", "XL"]},
  {"key": "notes", "label": "Notes", "type": "text"},
  {"key": "received", "label": "Received?", "type": "boolean"}
]
```

Supported field types: `text`, `number`, `boolean`, `select`, `date`

### adhoc_list_entries
Fellow data for each ad hoc list.

| Column | Type | Description |
|--------|------|-------------|
| id | uuid | Primary key |
| list_id | uuid | FK → adhoc_lists.id |
| fellow_id | uuid | FK → fellows.id |
| data | jsonb | Field values keyed by field key |
| updated_by | uuid | FK → auth.users.id |
| updated_at | timestamptz | |

**Unique constraint:** `(list_id, fellow_id)` — one entry per fellow per list.

---

## Health Score

Each current fellow gets a **health score** (0-100) computed from:

| Factor | Weight | Source |
|--------|--------|--------|
| Event attendance rate | 30% | event_attendance |
| Curriculum completion rate | 30% | fellow_curriculum_progress |
| Platform activity (days since last login) | 20% | fellow_platform_activity |
| Staff interaction recency | 20% | interactions |

**Score → Status mapping:**
- 80-100: Green (healthy)
- 50-79: Yellow (needs attention)
- 0-49: Red (at risk)

Health score is computed client-side from the underlying data (no stored score column needed).

---

## UI Components

### Cohort Dashboard (cohorts page)
- Header: "Current Cohorts" with year
- Three site cards showing:
  - Site name + flag/icon
  - Fellow count
  - Average health score (color-coded)
  - Upcoming events count
  - Curriculum completion %
- Quick action: "View Site" → navigates to site detail

### Site Detail (cohort-detail page)
- Tab bar: Directory | Events | Curriculum | Health | Lists
- **Directory tab:** Fellow cards (same as alumni) filtered to this site
- **Events tab:** List of events with attendance rates; "Take Attendance" button
- **Curriculum tab:** Chapter list with completion bars; drill into chapter for per-fellow status
- **Health tab:** Fellow list sorted by health score; trend sparklines
- **Lists tab:** Ad hoc lists with data entry grid

### Attendance Sheet (modal)
- Event header (title, date, time)
- Fellow list with radio buttons: Present / Absent / Excused / Late
- Bulk actions: "Mark All Present"
- Save button

---

## Implementation Phases

### Phase 1: Foundation (This PR)
- [x] Spec document
- [ ] Database migration (all tables)
- [ ] Sites seed data (Chicago, Dar es Salaam, Mosquera)
- [ ] Navigation: "Cohorts" menu item
- [ ] Cohort Dashboard page (3 site cards)
- [ ] Site Detail page with Directory tab
- [ ] Events tab with attendance taking

### Phase 2: Curriculum & Scores
- [ ] Curriculum management UI
- [ ] Fellow progress tracking
- [ ] Health score computation + display
- [ ] Health dashboard tab

### Phase 3: Ad Hoc Lists & Polish
- [ ] Ad hoc list creation UI
- [ ] Data entry grid
- [ ] Combined dashboard (alumni + current)
- [ ] GATHER platform API integration

---

## RLS Policies

All new tables follow the same pattern:
- **SELECT:** Active team_members can read
- **INSERT/UPDATE/DELETE:** Active team_members can manage
- Current fellows (status = 'Current') follow same SELECT policy as alumni (public directory)

---

## Migration to Alumni

At end of program year:
```sql
UPDATE fellows SET status = 'Alumni', site_id = NULL WHERE status = 'Current' AND cohort = '2026';
```

Historical event/curriculum/attendance data is preserved permanently.
