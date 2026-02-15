# GATHER — Cohort Management Planning Spec

> **Created:** February 15, 2026
> **Status:** Planning — Awaiting Approval
> **Purpose:** Comprehensive spec for the Cohort side of GATHER, covering all modules, data models, permissions, and implementation roadmap based on stakeholder input and existing spreadsheet workflows.

---

## Table of Contents

1. [Overview & Vision](#1-overview--vision)
2. [Cohort Side Architecture](#2-cohort-side-architecture)
3. [Per-Cohort Permissions](#3-per-cohort-permissions)
4. [Module 1: Fellow Roster](#4-module-1-fellow-roster)
5. [Module 2: Program Planner](#5-module-2-program-planner)
6. [Module 3: Workshop Attendance](#6-module-3-workshop-attendance)
7. [Module 4: Curriculum Progress (GATHER LMS)](#7-module-4-curriculum-progress-gather-lms)
8. [Module 5: Ad Hoc Lists](#8-module-5-ad-hoc-lists)
9. [Module 6: Cohort Dashboard](#9-module-6-cohort-dashboard)
10. [Module 7: Admin Preferences](#10-module-7-admin-preferences)
11. [Database Schema Changes](#11-database-schema-changes)
12. [GATHER LMS API Integration](#12-gather-lms-api-integration)
13. [Implementation Roadmap](#13-implementation-roadmap)

---

## 1. Overview & Vision

### What We're Building

The **Cohort side** of GATHER manages **active fellows** going through the fellowship program. It mirrors the Alumni side in having its own dashboard and navigation structure, but focuses on operational tracking: who's showing up, who's progressing through curriculum, who needs attention.

### Current State

The Cohort feature has Phase 3a complete:
- Database tables created (migration 016)
- Cohort Dashboard page (3 site cards with metrics)
- Site Detail page with Directory, Events, and Health tabs
- Attendance taking modal (P/L/E/A per fellow)
- Health score calculation (attendance + interaction recency)

### What's Missing (This Spec)

This spec covers everything needed to match (and exceed) the existing spreadsheet-based workflows:

| Module | Maps To (Spreadsheet) | Status |
|--------|----------------------|--------|
| Fellow Roster | Contact info, Outreach Notes | Partially built (Directory tab) |
| Program Planner | Event grid with dates, topics, logistics, staff notes | Not built |
| Workshop Attendance | Fellow-focused attendance grid (green/yellow/red) | Not built (events exist but not the fellow-focused view) |
| Curriculum Progress | GATHER LMS chapter overview + chapter detail | Not built |
| Ad Hoc Lists | T-shirts, Stipends, Credentials, Access Codes | Not built |
| Cohort Dashboard | Engagement scoring across all signals | Not built |
| Admin Preferences | Configurable thresholds for green/yellow/red | Not built |
| Per-Cohort Permissions | View/edit per team member per cohort | Not built |

---

## 2. Cohort Side Architecture

### Navigation Structure

The Cohort side lives under the existing "Cohorts" menu item (team+ access). The hierarchy:

```
Cohorts (top-level menu item)
├── Cohort Overview          ← shows all cohorts/sites at a glance
│
├── Chicago Peace Fellows (CPF) 2025
│   ├── Dashboard            ← engagement scores, at-a-glance metrics
│   ├── Roster               ← fellow list with contact info, outreach notes
│   ├── Program Planner      ← event grid with dates, topics, staff notes
│   ├── Workshop Attendance   ← fellow-focused attendance across all events
│   ├── Curriculum Progress   ← GATHER LMS overview + chapter drilldown
│   └── Lists                ← ad hoc lists (t-shirts, stipends, credentials, etc.)
│
├── Global Gather Fellows (GGF) 2025
│   └── (same sub-navigation)
│
└── [Future cohorts...]
```

### Cohort as the Container

A **cohort** is the organizing unit. Each cohort:
- Is tied to a **site** (Chicago/CPF, Dar es Salaam/DAR, Mosquera/MOS)
- Has a **year** (2025, 2026, etc.)
- Contains a **roster** of fellows (`fellows` table, `status = 'Current'`, `site_id` set)
- Has its own set of events, curriculum, ad hoc lists, and permissions

### Mirroring the Alumni Side

| Alumni Side | Cohort Side |
|-------------|-------------|
| Dashboard (network health, recent interactions) | Cohort Dashboard (engagement scores, at-risk fellows) |
| Directory (292 alumni, search/filter) | Roster (10-20 fellows, contact details, outreach notes) |
| Activity (interaction log) | Program Planner (event planning grid) |
| — | Workshop Attendance (fellow-focused attendance tracking) |
| — | Curriculum Progress (GATHER LMS tracking) |
| — | Ad Hoc Lists (custom per-cohort spreadsheets) |

---

## 3. Per-Cohort Permissions

### Requirement

Team members get **per-cohort** access levels:
- **edit** — Can modify data (attendance, curriculum, lists, roster)
- **view** — Can see all data but not change anything
- **none** — Cannot access this cohort at all

### Examples

| Team Member | CPF 2025 | GGF 2025 | Notes |
|-------------|----------|----------|-------|
| Travis | edit | edit | Super admin — full access everywhere |
| Tyler | edit | edit | Admin — full access |
| Yusuph | view | edit | Can view CPF but only edit GGF |
| Michael | view | view | Can view everything, edit nothing |
| Jassi | edit | none | Only works with CPF |

### Data Model

New table: `cohort_permissions`

```sql
CREATE TABLE cohort_permissions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  team_member_id uuid NOT NULL REFERENCES team_members(id) ON DELETE CASCADE,
  site_id uuid NOT NULL REFERENCES sites(id) ON DELETE CASCADE,
  access_level text NOT NULL DEFAULT 'none',  -- 'edit', 'view', 'none'
  granted_by uuid REFERENCES auth.users(id),
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  UNIQUE(team_member_id, site_id)
);
```

### Permission Resolution

```
1. If team_member.role = 'super_admin' → edit on ALL cohorts (override)
2. If team_member.role = 'admin' → edit on ALL cohorts (override)
3. Otherwise → check cohort_permissions table for specific access level
4. If no row exists for that team_member + site → 'none' (no access)
```

### Admin UI

In **Team Management** (admin+ page), add a "Cohort Access" section per team member:
- Table showing each cohort/site with a dropdown: None / View / Edit
- Only super_admin and admin can change permissions
- Super admin and admin roles automatically have edit everywhere (shown as locked/greyed out)

---

## 4. Module 1: Fellow Roster

### What It Is

The roster is the **master list of fellows** in a cohort — the rows that appear in every other module. Every grid (attendance, curriculum, ad hoc lists) is keyed to this roster.

### Current State

The Directory tab in Site Detail already shows fellow cards. This module extends it with:

### Fellow Detail Fields

Based on the spreadsheet "Outreach Notes" and "Contact Info":

| Field | Source | Editable By |
|-------|--------|-------------|
| PIC (photo) | `fellows.photo_url` | Admin |
| First Name | `fellows.first_name` | Admin |
| Last Name | `fellows.last_name` | Admin |
| Email | `fellows.email` | Admin |
| Cell/SMS | `fellows.phone` | Admin, self |
| Organization | `fellows.organization` | Admin, self |
| City | `fellows.city` | Admin, self |
| Site | Derived from `fellows.site_id` | Admin |
| Staff Notes | `fellows.staff_notes` | Admin |

### Outreach Notes (Per-Fellow)

From the spreadsheet, staff tracks per-fellow notes with dates:

> "1/9/25: Sent text about orientation details — asked about job title"
> "2/12/25: Needs transportation, followed up"

These map to the existing **interactions** table. Each outreach note = an interaction record:
- `interaction_type`: 'Note', 'Call', 'Email', 'Text', 'Meeting'
- `notes`: The detailed note text
- `interaction_date`: When it happened

### Roster View

- **Table layout** (not cards) — columns: PIC, Name, Email, Phone, Org, Last Contact, Status indicator
- Clicking a row opens the **Fellow Profile Modal** (already built)
- **Quick note** button per row — opens a small inline form to log a new interaction/note
- Sort by: Name, Last Contact Date, Status
- Filter by: Status indicator (green/yellow/red)

---

## 5. Module 2: Program Planner

### What It Is

The **staff-facing planning grid** for the program year. This is the operational calendar showing all events with dates, topics, logistics, and staff notes. It's for planning and coordination, not fellow tracking.

### Based On

The "Program Planner" spreadsheet:

| Date | Day | Event | Topic | Location | Time | Facilitator | Staff Notes |
|------|-----|-------|-------|----------|------|-------------|-------------|
| 1/8/2025 | Wed | Kick Off | Orientation | Venue A | 6:00 PM | Lissette | Need projector, 30 chairs |
| 1/15/2025 | Wed | Workshop | Team Building | Zoom | 6:00 PM | Yusuph | Send pre-work by Monday |

### Data Model

This uses the existing `events` table with these fields already available:
- `title` → Event name
- `description` → Topic
- `location` → Location
- `meeting_link` → Zoom/virtual link
- `start_time` → Date + Time
- `end_time` → End time
- `notes` → Staff notes (internal)
- `created_by` → Who created it

**New columns needed on `events`:**

| Column | Type | Description |
|--------|------|-------------|
| facilitator | text | Who's facilitating/leading |
| event_type | text | 'workshop', 'social', 'orientation', 'field_trip', 'guest_speaker', 'other' |
| is_required | boolean | Whether attendance is mandatory (default true) |

### Program Planner View

- **Grid/table layout** — rows are events, sorted chronologically
- Columns: Date, Day (auto-derived), Event Title, Topic, Location/Link, Time, Facilitator, Notes
- **Color coding** by event type (workshops = blue, socials = orange, orientations = green, etc.)
- Inline editing for notes (quick staff annotations)
- "Add Event" button at bottom or top
- Month/quarter grouping headers for visual separation
- **Past events** shown in muted style, **upcoming** in full color
- **Today indicator** — highlight the current/next event

---

## 6. Module 3: Workshop Attendance

### What It Is

The **fellow-focused attendance tracking grid** — shows each fellow's attendance across all events. Similar to curriculum progress but for workshops. This is where the green/yellow/red status indicators live.

### Based On

The "Attendance Grid" spreadsheet:

| Fellow | 1/8 Kickoff | 1/15 Workshop | 1/22 Workshop | ... | Attendance Rate |
|--------|-------------|---------------|---------------|-----|-----------------|
| Nicole | P | P | P | ... | 100% (green) |
| Aaliyah | P | A | E | ... | 67% (yellow) |
| Wesley | A | A | A | ... | 0% (red) |

### Data Source

Uses existing `event_attendance` table. The view is a **pivot** of that data:
- Rows = fellows (from cohort roster)
- Columns = events (chronological)
- Cells = attendance status (P/L/E/A or blank)

### Attendance Status Display

| Status | Display | Color | Counts as Present |
|--------|---------|-------|-------------------|
| Present | P | Green bg | Yes |
| Late | L | Yellow bg | Yes (but flagged) |
| Excused | E | Blue bg | No (but not penalized) |
| Absent | A | Red bg | No |
| (blank) | — | Gray bg | Not yet recorded |

### Attendance Rate Calculation

```
Attendance Rate = (Present + Late) / (Present + Late + Absent)
```
Excused events are excluded from the denominator (not penalized).

### Green/Yellow/Red Thresholds (Configurable)

| Status | Default Range | Meaning |
|--------|---------------|---------|
| Green | 80-100% | On track |
| Yellow | 50-79% | Needs attention |
| Red | 0-49% | At risk |

These thresholds are configurable via Admin Preferences (see Module 7).

### Workshop Attendance View

- **Frozen left columns**: PIC, Name
- **Scrollable right**: Event columns (date headers), one per event
- **Rightmost column**: Overall attendance rate with color indicator
- Clicking a cell opens quick-edit: P/L/E/A buttons (same as existing attendance modal)
- Clicking a fellow name opens their profile
- **Summary row at bottom**: Per-event attendance rate
- **Sort by**: Name, Attendance Rate (ascending/descending)
- **Filter by**: Status (green/yellow/red)

---

## 7. Module 4: Curriculum Progress (GATHER LMS)

### What It Is

Tracks each fellow's progress through the GATHER learning platform. The curriculum is broken into chapters, and each chapter has pages, assignments (tasks), and discussion board prompts.

### Two Views

#### 7a. Course Overview (All Chapters)

The top-level view showing progress across all chapters at a glance.

| Column | Description |
|--------|-------------|
| PIC | Fellow photo |
| Name | First + Last |
| Last Log In | Date of most recent GATHER platform login |
| Days Since Login | Auto-calculated from last login, **color-coded** |
| Chapter 1: x of Y | Pages completed / total pages in chapter 1 |
| Chapter 2: x of Y | Pages completed / total pages in chapter 2 |
| ... | Up to 10 chapters |

**Days Since Login color coding:**
| Status | Default Range | Color |
|--------|---------------|-------|
| On track | 0-5 days | Green |
| Stale | 6-12 days | Yellow |
| Off track | 13+ days | Red |

These thresholds are configurable via Admin Preferences (see Module 7).

Clicking a chapter column header drills into the **Chapter Detail View**.

#### 7b. Chapter Detail View

Shows granular progress for a single chapter.

| Section | Columns |
|---------|---------|
| **Page Progress** | "x of Y" — count of pages completed in this chapter |
| **Tasks** | 1-6 task columns, each showing 1 (complete) or blank |
| **Discussions** | 1-6 discussion columns, each showing 1 (complete) or blank |
| **Notes** | Free-text staff notes per fellow per chapter |

- Green background = completed
- Blank = not completed
- Tasks and discussions are named columns (e.g., "Seed Photo", "Interview a Peer", "Update Your Profile")

### Data Model

Uses existing tables from migration 016:

```
curricula (per site/year)
└── curriculum_chapters (5-10 per curriculum)
    └── curriculum_items (per chapter)
        ├── type: 'page' (10-20 per chapter)
        ├── type: 'assignment' (1-6 per chapter, = "tasks")
        └── type: 'discussion' (1-6 per chapter)
```

Per-fellow progress: `fellow_curriculum_progress` (fellow_id + item_id + completed boolean)

Platform login tracking: `fellow_platform_activity` (fellow_id + activity_date + login_count)

**New column needed:**

| Table | Column | Type | Description |
|-------|--------|------|-------------|
| fellow_curriculum_progress | notes | text | Staff notes per fellow per chapter |

Wait — notes need to be per fellow per **chapter**, not per item. We need:

### New Table: `fellow_chapter_notes`

```sql
CREATE TABLE fellow_chapter_notes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  fellow_id text NOT NULL REFERENCES fellows(id) ON DELETE CASCADE,
  chapter_id uuid NOT NULL REFERENCES curriculum_chapters(id) ON DELETE CASCADE,
  notes text,
  updated_by uuid REFERENCES auth.users(id),
  updated_at timestamptz DEFAULT now(),
  UNIQUE(fellow_id, chapter_id)
);
```

### Curriculum Data Entry

Two options for populating curriculum progress data:

1. **Manual entry** — Staff marks items complete in the UI (grid with checkboxes)
2. **GATHER LMS API** — Automated sync from the GATHER platform (see Section 12)

Initially, support manual entry. API integration is a future phase.

### Curriculum Admin (Setup)

Super admin / admin can:
- Create/edit a curriculum for a cohort (name, year)
- Add/edit/reorder chapters (title, description, order)
- Add/edit/reorder items within chapters (title, type, order)
- Define tasks and discussions by name (these become column headers)

This setup UI is needed **once per cohort** when the program year starts.

---

## 8. Module 5: Ad Hoc Lists

### What It Is

Custom mini-spreadsheets that staff creates as needs arise throughout the program year. Each list is keyed to the fellow roster. Examples from actual usage:

| List Name | Columns | Purpose |
|-----------|---------|---------|
| T-Shirt Orders | Size (S/M/L/XL/2X/3X), Status (ordered/received) | Swag logistics |
| Onboarding & Credentials | Gather Email, Gather Password, In Platform (Y/N), Zoom Account, Zoom Created (Y/N) | Account setup tracking |
| Stipends & Donations | Event attendance (Y/N), StrengthsFinder code, $35 donation date | Financial tracking |
| Website Access Codes | Access code, Activated (Y/N), Notes | Platform access |

### Design Principle

**Feel like a spreadsheet, but with structure.** Staff should be able to:
- Create a new list in seconds
- Add columns on the fly (the "TBD" columns from the spreadsheets)
- Fill in data inline (no modal per cell)
- See the full grid at a glance

### Data Model (Already Exists)

From migration 016:
- `adhoc_lists` — list definition with `fields` JSONB array
- `adhoc_list_entries` — per-fellow data with `data` JSONB object

**Fields JSONB format:**
```json
[
  {"key": "size", "label": "T-Shirt Size", "type": "select", "options": ["S", "M", "L", "XL", "2X", "3X"]},
  {"key": "ordered", "label": "Ordered?", "type": "boolean"},
  {"key": "notes", "label": "Notes", "type": "text"}
]
```

**Supported field types:** `text`, `number`, `boolean`, `select`, `date`, `url`

### List Management UI

**Lists Tab** (within cohort):
- Shows all ad hoc lists for this cohort as clickable cards/tabs
- "+ New List" button
- Each list card shows: name, column count, last updated

**Create List Modal:**
- List name (required)
- Description (optional)
- Initial columns — add 1+ columns with:
  - Column name (label)
  - Column type (dropdown: Text, Number, Yes/No, Dropdown, Date, URL)
  - Options (for Dropdown type only — comma-separated values)

**List Detail View (Grid):**
- Frozen left: PIC, Name
- Scrollable columns: Each field from the list definition
- Inline editing per cell (click to edit)
- "+" button on far right header to add a new column
- Column header dropdown: Rename, Change type, Delete column
- Rows auto-populated from cohort roster (no manual row management)

### Fellow Profile Integration

When viewing a fellow's profile modal, show a section: **"Lists"** — a summary of all ad hoc list data for this fellow:
- T-Shirt Size: XL
- Zoom Created: Yes
- StrengthsFinder Code: ABC123
- etc.

This gives a 360-degree view of the fellow without navigating to each list separately.

---

## 9. Module 6: Cohort Dashboard

### What It Is

The **capstone view** for each cohort — a single screen showing engagement health across all signals. This is the first thing staff sees when they open a cohort.

### Engagement Score

A **composite score (0-100)** per fellow computed from multiple signals:

| Signal | Source | Default Weight | Description |
|--------|--------|---------------|-------------|
| Workshop Attendance | `event_attendance` | 30% | Attendance rate across all events |
| GATHER Login Recency | `fellow_platform_activity` | 20% | Days since last login → score |
| Curriculum Progress | `fellow_curriculum_progress` | 25% | Overall completion % across all chapters |
| Task/Discussion Completion | `fellow_curriculum_progress` (assignments + discussions) | 15% | Completion rate for non-page items |
| Staff Interaction Recency | `interactions` | 10% | Days since last staff contact |

**Score → Status mapping (configurable):**
| Status | Default Range | Label |
|--------|---------------|-------|
| Green | 80-100 | On Track |
| Yellow | 50-79 | Needs Attention |
| Red | 0-49 | At Risk |

### Dashboard Layout

```
┌─────────────────────────────────────────────────────┐
│  CPF 2025 Dashboard                          [gear] │
├──────────┬──────────┬──────────┬───────────────────┤
│ 🟢 12    │ 🟡 5     │ 🔴 3     │ 20 Fellows        │
│ On Track │ Attention│ At Risk  │ Total             │
├──────────┴──────────┴──────────┴───────────────────┤
│                                                     │
│  ENGAGEMENT OVERVIEW                                │
│  ┌────────────────────────────────────────────┐     │
│  │ Workshop Attendance     ████████░░  78%    │     │
│  │ Curriculum Progress     ██████░░░░  55%    │     │
│  │ GATHER Login (7d avg)   █████████░  88%    │     │
│  │ Task Completion         ███████░░░  65%    │     │
│  └────────────────────────────────────────────┘     │
│                                                     │
│  FELLOWS NEEDING ATTENTION                          │
│  ┌─────────────────────────────────────────────┐    │
│  │ 🔴 Wesley Rodgers    Score: 15  No login 45d│    │
│  │ 🔴 Marcus Johnson    Score: 28  0% attend.  │    │
│  │ 🔴 Tanya Williams    Score: 35  No tasks    │    │
│  │ 🟡 Aaliyah Phillips  Score: 52  Login 8d ago│    │
│  │ 🟡 Devon Harris      Score: 58  2/10 attend │    │
│  └─────────────────────────────────────────────┘    │
│                                                     │
│  RECENT ACTIVITY                                    │
│  • Nicole completed Chapter 3 tasks (2h ago)        │
│  • Aaliyah logged into GATHER (yesterday)           │
│  • Workshop #8 attendance: 85% (Jan 22)             │
│                                                     │
└─────────────────────────────────────────────────────┘
```

### Quick Actions from Dashboard

- Click a fellow → opens their profile with full engagement details
- Click "On Track" / "Attention" / "At Risk" pill → filters the fellow list
- Click a module bar (Workshop Attendance, etc.) → navigates to that module

---

## 10. Module 7: Admin Preferences

### What It Is

A settings panel (accessible to super_admin only) for configuring thresholds, weights, and defaults that affect cohort tracking across the app.

### Configurable Settings

#### Attendance Thresholds
| Setting | Default | Description |
|---------|---------|-------------|
| `attendance_green_min` | 80 | Minimum % for green status |
| `attendance_yellow_min` | 50 | Minimum % for yellow status |
| (Below yellow_min = red) | — | — |

#### Login Recency Thresholds
| Setting | Default | Description |
|---------|---------|-------------|
| `login_green_max_days` | 5 | Max days since login for green |
| `login_yellow_max_days` | 12 | Max days since login for yellow |
| (Above yellow_max = red) | — | — |

#### Engagement Score Weights
| Setting | Default | Description |
|---------|---------|-------------|
| `weight_attendance` | 30 | Workshop attendance weight (%) |
| `weight_login_recency` | 20 | GATHER login recency weight (%) |
| `weight_curriculum` | 25 | Curriculum page progress weight (%) |
| `weight_tasks` | 15 | Task/discussion completion weight (%) |
| `weight_interactions` | 10 | Staff interaction recency weight (%) |

#### Engagement Score Thresholds
| Setting | Default | Description |
|---------|---------|-------------|
| `engagement_green_min` | 80 | Min score for green |
| `engagement_yellow_min` | 50 | Min score for yellow |

### Data Model

Uses existing `app_settings` table (key-value JSONB store):

```json
{
  "key": "cohort_preferences",
  "value": {
    "attendance_green_min": 80,
    "attendance_yellow_min": 50,
    "login_green_max_days": 5,
    "login_yellow_max_days": 12,
    "weight_attendance": 30,
    "weight_login_recency": 20,
    "weight_curriculum": 25,
    "weight_tasks": 15,
    "weight_interactions": 10,
    "engagement_green_min": 80,
    "engagement_yellow_min": 50
  }
}
```

### Preferences UI

Located in **Settings > Cohort Preferences** (super_admin only):
- Grouped sections: Attendance, Login Tracking, Engagement Weights, Engagement Thresholds
- Number inputs with validation (weights must sum to 100)
- Preview: shows what current data would look like with the new settings
- "Reset to Defaults" button
- Changes apply globally across all cohorts

---

## 11. Database Schema Changes

### New Tables

#### `cohort_permissions`
Per-cohort access control for team members.

```sql
CREATE TABLE cohort_permissions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  team_member_id uuid NOT NULL REFERENCES team_members(id) ON DELETE CASCADE,
  site_id uuid NOT NULL REFERENCES sites(id) ON DELETE CASCADE,
  access_level text NOT NULL DEFAULT 'none'
    CHECK (access_level IN ('edit', 'view', 'none')),
  granted_by uuid REFERENCES auth.users(id),
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  UNIQUE(team_member_id, site_id)
);
```

#### `fellow_chapter_notes`
Staff notes per fellow per curriculum chapter.

```sql
CREATE TABLE fellow_chapter_notes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  fellow_id text NOT NULL REFERENCES fellows(id) ON DELETE CASCADE,
  chapter_id uuid NOT NULL REFERENCES curriculum_chapters(id) ON DELETE CASCADE,
  notes text,
  updated_by uuid REFERENCES auth.users(id),
  updated_at timestamptz DEFAULT now(),
  UNIQUE(fellow_id, chapter_id)
);
```

### Modified Tables

#### `events` — New Columns

| Column | Type | Default | Description |
|--------|------|---------|-------------|
| facilitator | text | null | Who's facilitating |
| event_type | text | 'workshop' | Type: workshop, social, orientation, field_trip, guest_speaker, other |
| is_required | boolean | true | Mandatory attendance |

### Existing Tables (No Changes Needed)

These tables from migration 016 are already correct:
- `sites` — cohort containers
- `events` — event records (adding columns above)
- `event_attendance` — per-fellow attendance
- `curricula` — curriculum definitions
- `curriculum_chapters` — chapters within curricula
- `curriculum_items` — pages, assignments, discussions
- `fellow_curriculum_progress` — completion tracking
- `fellow_platform_activity` — login tracking
- `adhoc_lists` — custom list definitions
- `adhoc_list_entries` — per-fellow list data

### RLS Policies

All new tables follow the established pattern:
- **SELECT:** Active team members with view+ access to the cohort
- **INSERT/UPDATE:** Active team members with edit access to the cohort
- **DELETE:** Admin+ only

For `cohort_permissions` specifically:
- **SELECT:** Active team members can see their own permissions
- **ALL:** Admin+ can manage all permissions

### Migration Plan

Single migration file: `019_cohort_planning.sql`

---

## 12. GATHER LMS API Integration

### Goal

Automate the population of curriculum progress data by connecting to the GATHER learning platform's API or database.

### What Needs to Be Synced

| GATHER LMS Data | Maps To | Frequency |
|-----------------|---------|-----------|
| User login timestamps | `fellow_platform_activity` | Daily |
| Page view completion | `fellow_curriculum_progress` (type=page) | Daily |
| Assignment submissions | `fellow_curriculum_progress` (type=assignment) | Daily |
| Discussion post completion | `fellow_curriculum_progress` (type=discussion) | Daily |
| Course structure (chapters, items) | `curricula`, `curriculum_chapters`, `curriculum_items` | On setup / on change |

### Integration Approaches

**Option A: API Integration (Preferred)**
- If GATHER exposes a REST/GraphQL API, create a Supabase Edge Function that:
  1. Authenticates with GATHER API
  2. Fetches progress data for all active fellows
  3. Upserts into `fellow_curriculum_progress` and `fellow_platform_activity`
  4. Runs on a schedule via pg_cron (like the news scanner)

**Option B: Database Direct Connection**
- If GATHER uses a database we can access (Postgres, MySQL, etc.):
  1. Set up a foreign data wrapper or scheduled query
  2. Sync data directly between databases

**Option C: CSV Import**
- Interim solution while API integration is built
- Upload a CSV export from GATHER
- Parse and upsert into the relevant tables
- Staff can do this weekly/monthly

**Option D: Webhook Listener**
- If GATHER supports webhooks for completion events
- Create an Edge Function endpoint that receives events in real-time
- Most accurate but requires GATHER platform changes

### Implementation Priority

1. **Phase 1 (Now):** Manual entry + CSV import
2. **Phase 2 (Soon):** Investigate GATHER API/codebase access
3. **Phase 3 (Target):** Automated daily sync via Edge Function + pg_cron

### Next Step

Travis to provide access to the GATHER platform codebase or API documentation so we can determine the best integration approach.

---

## 13. Implementation Roadmap

### Phase A: Permissions & Preferences (Foundation)

**Priority: HIGH — Other modules depend on this**

1. Migration `019_cohort_planning.sql`:
   - `cohort_permissions` table
   - `fellow_chapter_notes` table
   - New columns on `events` (facilitator, event_type, is_required)
   - Seed `app_settings` with default `cohort_preferences`
   - RLS policies for all new tables

2. Permission resolution logic in frontend:
   - `getCohortAccess(teamMemberId, siteId)` → 'edit' | 'view' | 'none'
   - Admin/super_admin override
   - Conditional rendering of edit controls

3. Cohort Preferences UI (Settings > Cohort Preferences):
   - Threshold editors
   - Weight editors (must sum to 100)
   - Save to `app_settings`

4. Team Management: Cohort Access section:
   - Per-team-member cohort permission dropdowns
   - Admin+ only

### Phase B: Program Planner & Workshop Attendance

**Priority: HIGH — Core operational views**

5. Program Planner view:
   - Event grid/table (chronological)
   - Inline editing for notes
   - Event type badges and color coding
   - Create/edit event from the planner (enhanced modal with new fields)

6. Workshop Attendance view:
   - Fellow × Event pivot grid
   - P/L/E/A cell editing
   - Attendance rate column with green/yellow/red
   - Summary row
   - Filter by status

### Phase C: Curriculum Progress

**Priority: MEDIUM — Depends on GATHER data availability**

7. Curriculum Admin (setup):
   - Create/edit curriculum, chapters, items
   - Define tasks and discussions by name
   - Import from CSV (interim)

8. Course Overview view:
   - Fellow × Chapter grid with page counts
   - Last Login + Days Since columns with color coding
   - Click chapter header → drilldown

9. Chapter Detail view:
   - Page count, task columns, discussion columns
   - Binary completion indicators (green / blank)
   - Per-fellow-per-chapter notes

### Phase D: Ad Hoc Lists

**Priority: MEDIUM — High operational value**

10. List Management:
    - Create list with typed columns
    - List card view for browsing

11. List Detail Grid:
    - Inline-editable spreadsheet
    - Add/rename/delete columns
    - Fellow roster auto-populated

12. Fellow Profile Integration:
    - "Lists" section in FellowProfileModal
    - Aggregated view of all list data for a fellow

### Phase E: Cohort Dashboard

**Priority: MEDIUM — Depends on Phases B-D for data**

13. Dashboard Layout:
    - Status pill summary (green/yellow/red counts)
    - Module-level progress bars
    - "Needs Attention" ranked list
    - Recent activity feed

14. Engagement Score Calculation:
    - Client-side computation from all sources
    - Weighted formula using admin preferences
    - Per-fellow score with breakdown

### Phase F: GATHER LMS Integration

**Priority: LOW (initially) → HIGH (once access available)**

15. Investigate GATHER platform API/codebase
16. Build Edge Function for daily sync
17. Set up pg_cron job for automated runs
18. Replace manual entry with automated data

---

## Appendix A: Existing Data (CPF 2025 & GGF 2025)

Travis mentioned having partial data for CPF 2025 and GGF 2025 cohorts. This data can be imported to seed the system:

- **Fellow roster** — names, emails, phones, photos
- **Event list** — dates, topics, locations
- **Attendance records** — who attended what
- **GATHER progress** — chapter completion data (partial)
- **Login data** — last login dates

Import process:
1. Run migration 019
2. Insert fellows with `status = 'Current'` and appropriate `site_id`
3. Insert events for each site
4. Bulk insert attendance records
5. Bulk insert curriculum structure + progress data
6. Set up cohort permissions for each team member

---

## Appendix B: Data We Have vs. Data We Need

| Data Source | Available Now | Needs Building |
|-------------|--------------|----------------|
| Fellow contact info | Yes (in fellows table) | Need to add current cohort fellows |
| Event schedule | Partial (events table exists) | Need to populate from spreadsheets |
| Attendance records | Partial (table exists, UI exists) | Need historical import |
| GATHER curriculum structure | No (tables empty) | Need setup + data entry or API |
| GATHER login data | No (table exists but empty) | Need API or manual import |
| GATHER progress data | No (table exists but empty) | Need API or manual import |
| Ad hoc list definitions | No (table exists but empty) | Need UI to create |
| Cohort permissions | No (table doesn't exist yet) | Migration 019 |
| Admin preferences | No (no settings row yet) | Migration 019 |

---

## Appendix C: Open Questions

1. **GATHER Platform Access** — Can we get API access or codebase access to automate curriculum/login data sync?
2. **Historical Data Import** — How much CPF 2025 / GGF 2025 data should we import vs. start fresh?
3. **Cohort Archiving** — When a program year ends and fellows transition to alumni, how should cohort data be preserved? (Currently: historical data stays, fellows get `status = 'Alumni'`, `site_id = NULL`)
4. **Mobile Priority** — The program planner and attendance grids are wide tables. On mobile, should we:
   - (a) Use horizontal scroll (match desktop experience)
   - (b) Show a simplified card view
   - (c) Both (responsive)
5. **Notification Triggers** — Should the system alert staff when:
   - A fellow hasn't logged into GATHER in X days?
   - A fellow's engagement score drops below yellow?
   - An event is approaching with low RSVP/expected attendance?
