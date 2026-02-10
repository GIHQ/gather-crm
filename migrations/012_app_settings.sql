-- Migration 012: App Settings table (key-value store)
-- Used for shared application configuration like news scanner custom search terms

CREATE TABLE IF NOT EXISTS app_settings (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  key text UNIQUE NOT NULL,
  value jsonb NOT NULL,
  updated_at timestamptz DEFAULT now(),
  updated_by uuid REFERENCES auth.users(id)
);

-- RLS: authenticated can read, admin+ can write
ALTER TABLE app_settings ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Authenticated users can read settings" ON app_settings
  FOR SELECT USING (auth.uid() IS NOT NULL);

-- Helper function to check admin status without triggering RLS recursion on team_members
CREATE OR REPLACE FUNCTION is_admin()
RETURNS boolean
LANGUAGE sql
SECURITY DEFINER
STABLE
AS $$
  SELECT EXISTS (
    SELECT 1 FROM team_members
    WHERE user_id = auth.uid()
    AND role IN ('super_admin', 'admin')
  );
$$;

CREATE POLICY "Admins can manage settings" ON app_settings
  FOR ALL USING (is_admin());

-- Also fix the team_members admin policy (was causing infinite recursion)
DROP POLICY IF EXISTS "Admins can manage team members" ON team_members;
CREATE POLICY "Admins can manage team members" ON team_members
  FOR ALL USING (is_admin());

-- Seed default custom search terms for news scanner
INSERT INTO app_settings (key, value) VALUES
  ('news_search_terms', '["Goldin Institute", "Chicago Peace Fellows", "Goldin Global Fellows", "GATHER"]'::jsonb)
ON CONFLICT (key) DO NOTHING;
