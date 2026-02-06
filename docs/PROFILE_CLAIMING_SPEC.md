# GATHER Profile Claiming & Identity Matching Spec

## Overview

When fellows or staff log in with an email that doesn't match their profile, we need a way to:
1. Prevent duplicate accounts
2. Let users claim their existing profile
3. Give admins tools to fix mismatches

---

## The Problem

| Scenario | What Happens | Result |
|----------|--------------|--------|
| Fellow Maria has `maria.old@yahoo.com` in DB | She logs in with `maria.new@gmail.com` | Can't find her profile → viewer access |
| Staff Michael is added as `michael@goldininstitute.org` | He logs in with `mike@gmail.com` | New account created → duplicate |
| Fellow types `john@gmial.com` (typo) | System can't match | Orphan login → no profile access |

---

## Solution: Multi-Email Identity + Claim Flow

### 1. Alternate Emails (Already Added)

Both tables now support multiple emails per person:

```sql
-- Already in schema
ALTER TABLE fellows ADD COLUMN alternate_emails TEXT[] DEFAULT '{}';
ALTER TABLE team_members ADD COLUMN alternate_emails TEXT[] DEFAULT '{}';
```

### 2. Login Matching Logic

```
User enters email
        ↓
Check team_members.email OR team_members.alternate_emails
        ↓ (no match)
Check fellows.email OR fellows.alternate_emails  
        ↓ (no match)
Is email @goldininstitute.org?
        ↓ yes → auto-create team member
        ↓ no
Show "Is This You?" flow
```

---

## "Is This You?" Claim Flow

### UI: Unrecognized Email Screen

```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│  👋 We don't recognize that email                           │
│                                                             │
│  maria.new@gmail.com isn't in our system yet.               │
│                                                             │
│  Are you one of these people?                               │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ 👤 Maria Garcia                                      │   │
│  │    Chicago Peace Fellow, 2022                        │   │
│  │    Currently: maria.old@yahoo.com                    │   │
│  │                              [This is me]            │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ 👤 Maria Santos                                      │   │
│  │    Global Fellow, 2021                               │   │
│  │    Currently: m.santos@company.org                   │   │
│  │                              [This is me]            │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ 🔍 Search by name                                    │   │
│  │    ┌─────────────────────────────────────────────┐  │   │
│  │    │                                             │  │   │
│  │    └─────────────────────────────────────────────┘  │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  [I'm not in the system yet → Browse as guest]              │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### Finding Potential Matches

```javascript
async function findPotentialMatches(loginEmail) {
  // Extract potential name from email
  // john.smith@gmail.com → ["john", "smith"]
  // jsmith123@yahoo.com → ["jsmith"]
  const localPart = loginEmail.split('@')[0];
  const nameParts = localPart
    .replace(/[0-9]/g, '')           // Remove numbers
    .replace(/[._-]/g, ' ')          // Split on separators
    .split(' ')
    .filter(p => p.length > 2);      // Keep meaningful parts
  
  if (nameParts.length === 0) {
    // Can't guess name from email, return empty
    return { fellows: [], teamMembers: [] };
  }
  
  // Build OR query for name matching
  const nameQuery = nameParts
    .map(p => `first_name.ilike.%${p}%,last_name.ilike.%${p}%`)
    .join(',');
  
  // Search unclaimed fellows
  const { data: fellows } = await supabase
    .from('fellows')
    .select('id, first_name, last_name, email, program, cohort_year, photo_url')
    .is('user_id', null)  // Only profiles not yet claimed
    .eq('is_active', true)
    .or(nameQuery)
    .limit(5);
  
  // Search unclaimed team members
  const { data: teamMembers } = await supabase
    .from('team_members')
    .select('id, first_name, last_name, email, title, photo_url')
    .is('user_id', null)
    .eq('is_active', true)
    .or(nameQuery)
    .limit(5);
  
  return { fellows: fellows || [], teamMembers: teamMembers || [] };
}
```

### Claim Verification Options

**Option A: Verify via original email (more secure)**

```
User clicks "This is me" on Maria Garcia's profile
        ↓
System sends email to maria.old@yahoo.com:
"Someone is trying to link maria.new@gmail.com to your GATHER profile.
 If this is you, click here to confirm: [Verify Link]
 If this wasn't you, ignore this email."
        ↓
User clicks verify link
        ↓
System adds maria.new@gmail.com to alternate_emails
Links user_id to profile
```

**Option B: Admin approval (for inaccessible old emails)**

```
User clicks "This is me" but can't access old email
        ↓
User clicks "I can't access that email"
        ↓
System creates a claim request for admin review
        ↓
Admin sees pending claim in Team Management
Admin verifies identity (phone call, Slack, etc.)
Admin approves → email added, profile linked
```

---

## Database: Claim Requests Table

```sql
CREATE TABLE profile_claim_requests (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  requesting_email TEXT NOT NULL,           -- Email they logged in with
  requesting_user_id UUID REFERENCES auth.users(id),
  target_type TEXT NOT NULL,                -- 'fellow' or 'team_member'
  target_id UUID NOT NULL,                  -- ID of profile they're claiming
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected')),
  reviewed_by UUID REFERENCES auth.users(id),
  reviewed_at TIMESTAMPTZ,
  notes TEXT,                               -- Admin notes
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- RLS: Admins can see all, users can see their own
ALTER TABLE profile_claim_requests ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own claims" ON profile_claim_requests
  FOR SELECT USING (requesting_user_id = auth.uid());

CREATE POLICY "Admins can manage all claims" ON profile_claim_requests
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM team_members 
      WHERE user_id = auth.uid() 
      AND role IN ('super_admin', 'admin')
    )
  );
```

---

## Admin: Pending Claims UI

Add to Team Management page:

```
┌─────────────────────────────────────────────────────────────┐
│  Pending Profile Claims (2)                                 │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ ⏳ maria.new@gmail.com                               │   │
│  │    wants to claim: Maria Garcia (CPF 2022)           │   │
│  │    Original email: maria.old@yahoo.com               │   │
│  │    Requested: 2 hours ago                            │   │
│  │                                                      │   │
│  │    [✓ Approve]  [✕ Reject]  [📧 Send Verification]  │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ ⏳ mike.personal@gmail.com                           │   │
│  │    wants to claim: Michael Johnson (Staff)           │   │
│  │    Original email: michael@goldininstitute.org       │   │
│  │    Requested: 1 day ago                              │   │
│  │                                                      │   │
│  │    [✓ Approve]  [✕ Reject]  [📧 Send Verification]  │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Admin: Manual Email Management

In the edit modal for any fellow or team member:

```
┌─────────────────────────────────────────────────────────────┐
│  Edit: Maria Garcia                                    ✕    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Primary Email                                              │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ maria.old@yahoo.com                                 │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  Alternate Emails (can also be used to log in)              │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ maria.new@gmail.com                            [✕]  │   │
│  │ mgarcia@work.org                               [✕]  │   │
│  └─────────────────────────────────────────────────────┘   │
│  [+ Add alternate email]                                    │
│                                                             │
│  ⚠️ Login Status                                            │
│  ┌─────────────────────────────────────────────────────┐   │
│  │ ✓ Profile claimed via maria.new@gmail.com           │   │
│  │   First login: Jan 15, 2026                         │   │
│  │   [Unlink account] (removes login, keeps profile)   │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## Implementation Phases

### Phase 1 (Now)
- [x] Add `alternate_emails` column to both tables
- [x] Update login check to query alternate emails
- [ ] Admin UI to add/remove alternate emails manually
- [ ] Auto-grant @goldininstitute.org creates team record

### Phase 2 (After Launch)
- [ ] "Is This You?" flow for unrecognized emails
- [ ] Name-based potential match search
- [ ] Claim request system
- [ ] Admin approval queue

### Phase 3 (If Needed)
- [ ] Email verification for self-service claiming
- [ ] Merge duplicate accounts tool
- [ ] Bulk alternate email import from spreadsheet

---

## Edge Cases

| Case | Handling |
|------|----------|
| Two people share an email | Shouldn't happen, but first match wins. Admin can fix. |
| Person claims wrong profile | Admin can unlink and reassign |
| Old email bounces during verification | Admin approval path |
| Person has 5+ email addresses | All can be in alternate_emails array |
| @goldininstitute.org person already in fellows table | Check fellows first? Or prioritize team_members? (Recommend: check both, let user choose if ambiguous) |

---

## Files to Modify

1. **Supabase**: 
   - Add `alternate_emails` to fellows (migration)
   - Create `profile_claim_requests` table
   
2. **index.html**:
   - Update auth flow to check alternate emails
   - Add "Is This You?" component
   - Add claim management to Team Management page
   - Add alternate email editor to profile edit modals

3. **docs/DATABASE_SCHEMA.md**: Document new columns and table
