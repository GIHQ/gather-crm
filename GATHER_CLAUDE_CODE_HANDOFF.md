# GATHER Project - Claude Code Handoff

> **⚠️ ARCHIVED** — This was the original planning document from project start.
>
> **For current project state, see: [`docs/SESSION_HANDOFF.md`](docs/SESSION_HANDOFF.md)**
>
> The SESSION_HANDOFF.md file is kept up-to-date and should be the starting point for any new Claude session.

---

## Project Overview (Historical)
GATHER is an alumni network CRM for the Goldin Institute managing 292 fellows. It serves as both an internal staff CRM and a public alumni directory.

**Live Site**: https://gathertracker.netlify.app
**Backend**: Supabase (PostgreSQL + Auth + Storage)

---

## Current File Structure

```
/
├── index.html          # Main mobile PWA (2,650 lines) - PRIMARY FILE
├── directory.html      # Desktop public directory (1,267 lines)
├── dashboard.html      # Desktop staff CRM (1,216 lines)
├── gather-mobile.html  # Earlier mobile version (may be deprecated)
├── manifest.json       # PWA manifest
├── sw.js              # Service worker
└── (icons needed)      # apple-touch-icon.png, favicon-16.png, favicon-32.png
```

---

## Supabase Configuration

```javascript
const SUPABASE_URL = 'https://pwazurumpzydxyppbvee.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB3YXp1cnVtcHp5ZHh5cHBidmVlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njk1MjM3MDUsImV4cCI6MjA4NTA5OTcwNX0.iGLmSpTPM84lMGGizSfBnkDCvpMZaJVaFhcRJ9cYDrs';
```

**Existing Tables**:
- `fellows` - 292 alumni records with photo_url, contact info, program, cohort, etc.
- `interactions` - Activity log (calls, emails, meetings, notes)
- `cohorts` - Cohort/program definitions
- `focus_areas` - Legacy focus areas (being redesigned)
- `staff` - Staff members (may need expansion for roles)

**Storage Buckets**:
- `Photos` - Fellow photos and logos
- Logo URLs:
  - Square: `https://pwazurumpzydxyppbvee.supabase.co/storage/v1/object/public/Photos/Gather%20logomark%20square.png`
  - Full: `https://pwazurumpzydxyppbvee.supabase.co/storage/v1/object/public/Photos/Gather%20-%20Logo.png`

---

## TODAY'S TASKS (6 Topics)

### TOPIC 1: Permission System (Priority: HIGH)

**New 6-Tier Role System**:
| Role | Description | Capabilities |
|------|-------------|--------------|
| `super_admin` | Full system control | All powers, manage other super admins |
| `admin` | Full operational | All except super admin settings |
| `manager` | Team oversight | Assign tasks to staff, no permission changes |
| `team` | Staff member | Self-assign only, full CRM access |
| `fellow` | Alumni | Edit own profile, click-to-connect, no staff notes |
| `viewer` | Guest/public | Directory & bios only, no contact info |

**Database Migration Needed**:
```sql
CREATE TABLE user_roles (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  email text UNIQUE NOT NULL,
  role text NOT NULL DEFAULT 'viewer' 
    CHECK (role IN ('super_admin', 'admin', 'manager', 'team', 'fellow', 'viewer')),
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Seed initial admins
INSERT INTO user_roles (email, role) VALUES
  ('diane@goldininstitute.org', 'super_admin'),
  ('staff@goldininstitute.org', 'admin');
```

**Auth Logic**:
- Google OAuth (@goldininstitute.org, @chicagopeacefellows.org) → default `team`
- Check `user_roles` table for explicit role assignment
- Check `fellows` table by email → assign `fellow` role if found
- "Skip for now" → `viewer` role (no sensitive data visible)
- Email OTP verification code available for fellows with any email provider

---

### TOPIC 2: Login Flow Updates

**Current**: Welcome → Login (Email OTP Code/Skip) → Onboarding → App

**Updated Logic**:
```javascript
// After authentication, determine role:
async function determineUserRole(email) {
  // 1. Check explicit role assignment
  const { data: roleData } = await supabase
    .from('user_roles')
    .select('role')
    .eq('email', email.toLowerCase())
    .single();
  
  if (roleData) return roleData.role;
  
  // 2. Check if fellow
  const { data: fellowData } = await supabase
    .from('fellows')
    .select('id')
    .eq('email', email.toLowerCase())
    .single();
  
  if (fellowData) return 'fellow';
  
  // 3. Check domain for staff
  if (email.endsWith('@goldininstitute.org') || 
      email.endsWith('@chicagopeacefellows.org')) {
    return 'team';
  }
  
  // 4. Default to viewer
  return 'viewer';
}
```

**UI Changes**:
- Add "View public directory" subtext under Skip button
- Show role badge in header after login (Admin, Manager, etc.)
- Hide sensitive fields (email, phone, WhatsApp, staff notes) for viewer/fellow roles

---

### TOPIC 3: Mobile Directory Sort/Filter

**Add filter icon next to search bar** that opens a slide-up panel:

**Sort Options** (default: days since last contact, high to low):
- Days since last contact (↓↑)
- Name (A-Z, Z-A)
- Year (newest first, oldest first)
- Status (Red→Yellow→Green or reverse)

**Filter Options**:
- **Program**: CPF, GGF, ESP (multi-select checkboxes)
- **Region**: Africa, Asia, Latin America, Europe, Middle East (for GGF/ESP)
- **Community Area**: 77 Chicago areas dropdown (CPF only, show conditionally)
- **Year**: 2010-2025 (multi-select or range slider)
- **Status**: Green, Yellow, Red (multi-select)

**UI Pattern**:
```jsx
// Filter icon with badge showing active filter count
<button className="relative">
  <FilterIcon />
  {activeFilterCount > 0 && (
    <span className="absolute -top-1 -right-1 w-5 h-5 bg-goldin-orange text-white text-xs rounded-full">
      {activeFilterCount}
    </span>
  )}
</button>
```

---

### TOPIC 4: Program Pills Update

**Current**: Single program indicator
**New**: Two pills - Program type + Year

```jsx
const programColors = {
  'CPF': { bg: 'bg-blue-500', text: 'text-blue-700', light: 'bg-blue-100' },
  'GGF': { bg: 'bg-green-500', text: 'text-green-700', light: 'bg-green-100' },
  'ESP': { bg: 'bg-purple-500', text: 'text-purple-700', light: 'bg-purple-100' },
};

// In card/list item:
<div className="flex gap-1.5">
  <span className={`text-xs px-2 py-0.5 rounded-full font-semibold text-white ${programColors[program].bg}`}>
    {program}
  </span>
  <span className="text-xs px-2 py-0.5 rounded-full font-medium bg-gray-200 text-gray-700">
    {year}
  </span>
</div>
```

---

### TOPIC 5: Unified Contact Detail View

**Merge best of mobile (index.html) and desktop (directory.html) modals**:

**Structure**:
1. **Header**: Photo, Name, Title, Org (white background like mobile)
2. **Quick Actions Row**: Call | WhatsApp | Email buttons (like desktop, in a row)
3. **Status Bar**: Status pill + "X days since contact" + Log Interaction button
4. **Tabs or Sections**:
   - Overview (Bio, Contact Info, Socials)
   - Focus Areas (Skills, Populations, Topics, Community Areas)
   - Activity (Recent interactions - staff only)
   - Staff Notes (staff only)

**Background blur**: Apply `backdrop-blur-sm` and freeze scroll on body when modal open (like desktop)

---

### TOPIC 6: Focus Areas Redesign (Biggest Change)

**New Schema**:

```sql
-- Categories
CREATE TABLE focus_categories (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  name text NOT NULL,  -- 'Skills', 'Populations Served', 'Focus Areas', 'Community Areas'
  slug text UNIQUE NOT NULL,
  sort_order int DEFAULT 0,
  applicable_programs text[] DEFAULT ARRAY['CPF', 'GGF', 'ESP']
);

-- Tags within categories
CREATE TABLE focus_tags (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  category_id uuid REFERENCES focus_categories(id) ON DELETE CASCADE,
  name text NOT NULL,
  slug text NOT NULL,
  approved boolean DEFAULT true,
  created_by text,  -- email of creator
  created_at timestamptz DEFAULT now(),
  UNIQUE(category_id, slug)
);

-- Fellow-Tag junction
CREATE TABLE fellow_focus_tags (
  fellow_id uuid REFERENCES fellows(id) ON DELETE CASCADE,
  tag_id uuid REFERENCES focus_tags(id) ON DELETE CASCADE,
  is_primary boolean DEFAULT false,  -- For community areas: primary vs secondary
  created_at timestamptz DEFAULT now(),
  PRIMARY KEY (fellow_id, tag_id)
);

-- Seed categories
INSERT INTO focus_categories (name, slug, sort_order, applicable_programs) VALUES
  ('Skills', 'skills', 1, ARRAY['CPF', 'GGF', 'ESP']),
  ('Populations Served', 'populations', 2, ARRAY['CPF', 'GGF', 'ESP']),
  ('Focus Areas', 'focus-areas', 3, ARRAY['CPF', 'GGF', 'ESP']),
  ('Community Areas', 'community-areas', 4, ARRAY['CPF']);

-- Seed initial tags for Skills
INSERT INTO focus_tags (category_id, name, slug) 
SELECT id, unnest(ARRAY[
  'Public Relations', 'Accounting', 'Fundraising', 'Youth Education',
  'Website Development', 'Social Media', 'Facilitation', 'Asset Mapping',
  'Grant Writing', 'Event Planning', 'Public Speaking', 'Photography',
  'Video Production', 'Graphic Design', 'Data Analysis', 'Project Management'
]), unnest(ARRAY[
  'public-relations', 'accounting', 'fundraising', 'youth-education',
  'website-development', 'social-media', 'facilitation', 'asset-mapping',
  'grant-writing', 'event-planning', 'public-speaking', 'photography',
  'video-production', 'graphic-design', 'data-analysis', 'project-management'
])
FROM focus_categories WHERE slug = 'skills';

-- (Similar for populations, focus-areas, community-areas...)
```

**Community Areas for CPF**:
- Primary Community Area: Single select (where they work most)
- Secondary Community Areas: Multi-select
- Use Chicago's 77 official community areas

**Tag Management UI** (Admin/Super Admin only):
- View all tags by category
- Consolidate duplicates (merge)
- Edit tag names
- Remove/archive unused tags
- New tags auto-approved but flagged for review

---

## Files to Upload to Claude Code

1. `index.html` - Main mobile app
2. `directory.html` - Desktop directory
3. `dashboard.html` - Desktop dashboard
4. `manifest.json` - PWA config
5. `sw.js` - Service worker
6. GATHER logo files (from project):
   - `Gather_logomark_primary.png`
   - `Gather_logomark_square.png`
   - `Gather__Logo.png`

---

## Deployment Strategy

**Goal**: Consolidate changes into single Netlify deploy

**Steps**:
1. Make all changes locally
2. Test thoroughly
3. Generate favicons/icons from logo files
4. Single deploy to Netlify

**Netlify Site**: gathertracker.netlify.app
**Deploy Method**: Manual upload or Git

---

## Unfinished Items (Backlog)

1. ⏳ Batch photo standardization (600x600, face-centered)
2. ⏳ Staff auth credentials setup
3. ⏳ Cohort Communication → live email integration
4. ⏳ OAuth redirect fix (prevent welcome screen return)
5. ⏳ PWA app icons (192px, 512px)
6. ⏳ Mailchimp integration for bulk email
7. ⏳ Auto-logging for call/text/email actions
8. ⏳ Interaction history in profile modals

---

## Design System

**Colors**:
- Goldin Orange: `#E87722`
- Goldin Orange Dark: `#D56A1C`
- Gray: `#6B7280`
- Gray Dark: `#374151`

**Program Colors**:
- CPF (Chicago): Blue (`bg-blue-500`)
- GGF (Global English): Green (`bg-green-500`)
- ESP (Global Spanish): Purple (`bg-purple-500`)

**Status Colors**:
- Green (Recent, ≤30 days): `#10B981`
- Yellow (Follow-up, 31-90 days): `#F59E0B`
- Red (Overdue, >90 days): `#EF4444`

**Typography**: DM Sans

**Radius**: `rounded-xl` to `rounded-2xl`

---

## Getting Started in Claude Code

```bash
# 1. Create project directory
mkdir gather-crm && cd gather-crm

# 2. Copy uploaded files into directory

# 3. Start Claude Code session
claude

# 4. Provide this handoff document as context

# 5. Begin with database migrations, then UI changes
```

---

## Priority Order

1. **Database migrations** (user_roles, focus_categories, focus_tags, fellow_focus_tags)
2. **Permission system** in index.html (role checking, UI hiding)
3. **Login flow** updates (hybrid auth, role determination)
4. **Sort/Filter UI** in mobile directory
5. **Program pills** update (CPF/GGF/ESP + year)
6. **Contact detail merge** (unified modal)
7. **Focus Areas UI** (new multi-category system)
8. **Testing** across all permission levels
9. **Single Netlify deploy**

---

## Questions Resolved

- **Fellow auth**: Email OTP verification code (any email provider). Google OAuth removed Feb 13, magic links replaced with OTP Feb 14.
- **Staff default role**: `team` for @goldininstitute.org and @chicagopeacefellows.org
- **Skip for now**: `viewer` role (public directory only, no contact info)
