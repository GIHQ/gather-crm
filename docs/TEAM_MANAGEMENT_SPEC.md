# GATHER Team Management Feature Spec

## Overview

Add team members (Goldin Institute staff) to the directory alongside fellows, with a dedicated admin page for managing team accounts and permissions.

---

## Database

### New Table: team_members

```sql
CREATE TABLE team_members (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id),  -- populated after first login
  email TEXT UNIQUE NOT NULL,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  title TEXT,                               -- job title, e.g. "Program Director"
  photo_url TEXT,
  bio TEXT,
  phone TEXT,
  role TEXT NOT NULL DEFAULT 'team' CHECK (role IN ('super_admin', 'admin', 'manager', 'team')),
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- RLS: Admins can manage, everyone can read active members
ALTER TABLE team_members ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view active team members" ON team_members
  FOR SELECT USING (is_active = true);

CREATE POLICY "Admins can manage team members" ON team_members
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM team_members tm 
      WHERE tm.user_id = auth.uid() 
      AND tm.role IN ('super_admin', 'admin')
    )
  );
```

### Migration: Drop user_roles, Use team_members

The `team_members` table replaces `user_roles` for staff. Role is stored directly on the team member record.

For fellows who need login access, their role is implicit ('fellow') and checked against the `fellows` table by email.

---

## Directory Integration

### Update Directory Query

```sql
-- Combined directory query
SELECT 
  id,
  first_name,
  last_name,
  'TEAM' as program,
  NULL as cohort_year,
  title as organization,
  photo_url,
  bio,
  email,
  phone,
  'team_member' as record_type
FROM team_members
WHERE is_active = true

UNION ALL

SELECT 
  id,
  first_name,
  last_name,
  program,
  cohort_year,
  organization,
  photo_url,
  bio,
  email,
  phone,
  'fellow' as record_type
FROM fellows
WHERE is_active = true

ORDER BY last_name, first_name;
```

### Filter Options

Update the program filter dropdown:
- All
- **Team** (NEW - silver badge)
- CPF (blue badge)
- GGF (orange badge)  
- ESP (dark orange badge)

### Badge Colors

```javascript
const programBadgeClasses = {
  'TEAM': 'bg-gray-400 text-white',      // Silver
  'CPF': 'bg-blue-700 text-white',       // Blue
  'GGF': 'bg-orange-500 text-white',     // Orange
  'ESP': 'bg-orange-700 text-white',     // Dark orange
};
```

---

## Team Management Page

### Access Control

Only visible to users with role `admin` or `super_admin`.

Add to Settings page:
```jsx
{(userRole === 'admin' || userRole === 'super_admin') && (
  <SettingsItem
    icon="👥"
    title="Team Management"
    description="Manage staff accounts and permissions"
    onClick={() => setCurrentPage('team-management')}
  />
)}
```

### UI Layout

```
┌─────────────────────────────────────────────────────────────┐
│  ← Settings          Team Management              + Add     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ 👤  Travis Rejman                                    │   │
│  │     Executive Director                               │   │
│  │     travis@goldininstitute.org                       │   │
│  │     [Super Admin]                        ✓ Active    │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ 👤  Tyler Stober                                     │   │
│  │     Program Coordinator                              │   │
│  │     stobertg@gmail.com                               │   │
│  │     [Team]  ⚠️ Magic link required      ✓ Active    │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ 👤  Jane Smith                                       │   │
│  │     Program Manager                                  │   │
│  │     jane@goldininstitute.org                         │   │
│  │     [Manager]                           ○ Pending    │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Team Member Card States

**Login status indicators:**
- ✓ Active (green) — has logged in, user_id is set
- ○ Pending (gray) — invited but hasn't logged in yet
- ⚠️ Magic link required — non-Goldin email, can't use Google OAuth

**Role badges:**
- `[Super Admin]` — purple/violet badge
- `[Admin]` — blue badge
- `[Manager]` — teal badge
- `[Team]` — gray badge

### Add/Edit Team Member Modal

```
┌─────────────────────────────────────────────────────────────┐
│                    Add Team Member                     ✕    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Email *                                                    │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ jane@goldininstitute.org                            │   │
│  └─────────────────────────────────────────────────────┘   │
│  ℹ️ @goldininstitute.org can use Google sign-in            │
│                                                             │
│  First Name *              Last Name *                      │
│  ┌────────────────────┐   ┌────────────────────────────┐   │
│  │ Jane               │   │ Smith                      │   │
│  └────────────────────┘   └────────────────────────────┘   │
│                                                             │
│  Title                                                      │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ Program Manager                                     │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  Role                                                       │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ Team                                            ▼   │   │
│  └─────────────────────────────────────────────────────┘   │
│  • Team — Basic staff access                               │
│  • Manager — Can assign tasks to others                    │
│  • Admin — Full access except super admin settings         │
│                                                             │
│  Phone (optional)                                           │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                                                     │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  Bio (optional)                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                                                     │   │
│  │                                                     │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │              Add Team Member                        │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Role Restrictions

- **Super Admin** can: change anyone's role including other super admins
- **Admin** can: add/edit team members, change roles up to admin (cannot create super admins)
- **Manager and below**: cannot access Team Management page

---

## Auth Flow Update

### On Login

```javascript
async function determineUserRole(email, userId) {
  // 1. Check team_members table first
  const { data: teamMember } = await supabase
    .from('team_members')
    .select('role')
    .eq('email', email)
    .single();
  
  if (teamMember) {
    // Update user_id if not set (first login)
    if (!teamMember.user_id) {
      await supabase
        .from('team_members')
        .update({ user_id: userId })
        .eq('email', email);
    }
    return teamMember.role; // super_admin, admin, manager, or team
  }
  
  // 2. Check if they're a fellow
  const { data: fellow } = await supabase
    .from('fellows')
    .select('id')
    .eq('email', email)
    .single();
  
  if (fellow) {
    return 'fellow';
  }
  
  // 3. Auto-grant 'team' for @goldininstitute.org (optional policy)
  if (email.endsWith('@goldininstitute.org')) {
    // Auto-create team member record
    await supabase
      .from('team_members')
      .insert({ email, first_name: 'New', last_name: 'Staff', role: 'team' });
    return 'team';
  }
  
  // 4. Default to viewer
  return 'viewer';
}
```

---

## Initial Data

Seed the team_members table with current staff:

```sql
INSERT INTO team_members (email, first_name, last_name, title, role) VALUES
('travis@goldininstitute.org', 'Travis', 'Rejman', 'Executive Director', 'super_admin'),
('stobertg@gmail.com', 'Tyler', 'Stober', 'Program Coordinator', 'team');
-- Add more staff as needed
```

---

## Files to Modify

1. **Supabase**: Create `team_members` table via SQL Editor or migration
2. **index.html**: 
   - Add TeamManagementPage component
   - Update Directory to UNION team_members
   - Add 'TEAM' to program filter
   - Add silver badge color
   - Update auth flow to check team_members
3. **docs/DATABASE_SCHEMA.md**: Document new table
