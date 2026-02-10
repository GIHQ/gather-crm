-- Migration 012: App Settings table (key-value store)
-- Used for shared application configuration like news scanner custom search terms

CREATE TABLE IF NOT EXISTS app_settings (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  key text UNIQUE NOT NULL,
  value jsonb NOT NULL,
  updated_at timestamptz DEFAULT now(),
  updated_by uuid REFERENCES auth.users(id)
);

-- RLS: staff+ can read, admin+ can write
ALTER TABLE app_settings ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Authenticated users can read settings" ON app_settings
  FOR SELECT USING (auth.role() = 'authenticated');

CREATE POLICY "Admins can manage settings" ON app_settings
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM team_members
      WHERE user_id = auth.uid()
      AND role IN ('super_admin', 'admin')
    )
  );

-- Seed default custom search terms for news scanner
INSERT INTO app_settings (key, value) VALUES
  ('news_search_terms', '["Goldin Institute", "Chicago Peace Fellows", "Goldin Global Fellows", "GATHER"]'::jsonb)
ON CONFLICT (key) DO NOTHING;
