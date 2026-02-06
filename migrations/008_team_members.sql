-- ============================================
-- MIGRATION 008: Team Members Table
-- Run this in Supabase SQL Editor
-- ============================================

-- Create team_members table
CREATE TABLE IF NOT EXISTS team_members (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id),  -- populated after first login
  email TEXT UNIQUE NOT NULL,
  alternate_emails TEXT[] DEFAULT '{}',    -- other emails this person might log in with
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  title TEXT,                               -- job title, e.g. "Program Director"
  photo_url TEXT,
  bio TEXT,
  phone TEXT,
  linkedin_url TEXT,
  role TEXT NOT NULL DEFAULT 'team' CHECK (role IN ('super_admin', 'admin', 'manager', 'team')),
  fellowships JSONB DEFAULT '[]',          -- fellowship history: [{"program": "CPF", "year": 2020}]
  is_active BOOLEAN DEFAULT true,
  staff_notes TEXT,                        -- Admin-only notes (not visible to the person)
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Index for fast alternate email lookups
CREATE INDEX IF NOT EXISTS idx_team_members_alternate_emails ON team_members USING GIN (alternate_emails);

-- Index for fellowship queries (find staff who are also CPF fellows, etc.)
CREATE INDEX IF NOT EXISTS idx_team_members_fellowships ON team_members USING GIN (fellowships);

-- Index for email lookup
CREATE INDEX IF NOT EXISTS idx_team_members_email ON team_members (email);

-- RLS: Enable row level security
ALTER TABLE team_members ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if they exist (for idempotent re-runs)
DROP POLICY IF EXISTS "Anyone can view active team members" ON team_members;
DROP POLICY IF EXISTS "Admins can manage team members" ON team_members;
DROP POLICY IF EXISTS "Team can update own profile" ON team_members;

-- Policy: Anyone can view active team members
CREATE POLICY "Anyone can view active team members" ON team_members
  FOR SELECT USING (is_active = true);

-- Policy: Admins can manage team members
CREATE POLICY "Admins can manage team members" ON team_members
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM team_members tm
      WHERE tm.user_id = auth.uid()
      AND tm.role IN ('super_admin', 'admin')
    )
  );

-- Policy: Team members can update their own profile (limited fields)
CREATE POLICY "Team can update own profile" ON team_members
  FOR UPDATE USING (user_id = auth.uid())
  WITH CHECK (user_id = auth.uid());

-- ============================================
-- Add missing columns to fellows table
-- ============================================
ALTER TABLE fellows ADD COLUMN IF NOT EXISTS user_id UUID REFERENCES auth.users(id);
ALTER TABLE fellows ADD COLUMN IF NOT EXISTS alternate_emails TEXT[] DEFAULT '{}';
ALTER TABLE fellows ADD COLUMN IF NOT EXISTS staff_notes TEXT;

CREATE INDEX IF NOT EXISTS idx_fellows_user_id ON fellows (user_id);
CREATE INDEX IF NOT EXISTS idx_fellows_alternate_emails ON fellows USING GIN (alternate_emails);

-- ============================================
-- RLS Policies for profile editing
-- ============================================

-- Fellows can update own profile
DROP POLICY IF EXISTS "Fellows can update own profile" ON fellows;
CREATE POLICY "Fellows can update own profile" ON fellows
  FOR UPDATE USING (user_id = auth.uid())
  WITH CHECK (user_id = auth.uid());

-- Admins can update any fellow
DROP POLICY IF EXISTS "Admins can update any fellow" ON fellows;
CREATE POLICY "Admins can update any fellow" ON fellows
  FOR UPDATE USING (
    EXISTS (
      SELECT 1 FROM team_members
      WHERE user_id = auth.uid()
      AND role IN ('super_admin', 'admin')
    )
  );

-- ============================================
-- Trigger to auto-update updated_at
-- ============================================
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

DROP TRIGGER IF EXISTS update_team_members_updated_at ON team_members;
CREATE TRIGGER update_team_members_updated_at
    BEFORE UPDATE ON team_members
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();
