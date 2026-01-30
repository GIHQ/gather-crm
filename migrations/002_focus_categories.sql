-- Migration: Create focus_categories table for focus areas redesign
-- Run in Supabase SQL Editor

-- Create focus_categories table
CREATE TABLE IF NOT EXISTS focus_categories (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  name text NOT NULL,
  slug text UNIQUE NOT NULL,
  description text,
  sort_order int DEFAULT 0,
  applicable_programs text[] DEFAULT ARRAY['CPF', 'GGF', 'ESP'],
  is_active boolean DEFAULT true,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Create indexes
CREATE INDEX IF NOT EXISTS idx_focus_categories_slug ON focus_categories (slug);
CREATE INDEX IF NOT EXISTS idx_focus_categories_sort ON focus_categories (sort_order);
CREATE INDEX IF NOT EXISTS idx_focus_categories_active ON focus_categories (is_active) WHERE is_active = true;

-- Add trigger to auto-update updated_at
DROP TRIGGER IF EXISTS update_focus_categories_updated_at ON focus_categories;
CREATE TRIGGER update_focus_categories_updated_at
  BEFORE UPDATE ON focus_categories
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- Enable Row Level Security
ALTER TABLE focus_categories ENABLE ROW LEVEL SECURITY;

-- RLS Policies

-- Everyone can read active categories
CREATE POLICY "Anyone can read active categories" ON focus_categories
  FOR SELECT
  USING (is_active = true);

-- Admins can read all categories (including inactive)
CREATE POLICY "Admins can read all categories" ON focus_categories
  FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM user_roles ur
      WHERE ur.email = auth.jwt() ->> 'email'
      AND ur.role IN ('super_admin', 'admin')
    )
  );

-- Only super_admin and admin can manage categories
CREATE POLICY "Admins can manage categories" ON focus_categories
  FOR ALL
  USING (
    EXISTS (
      SELECT 1 FROM user_roles ur
      WHERE ur.email = auth.jwt() ->> 'email'
      AND ur.role IN ('super_admin', 'admin')
    )
  );

-- Seed the four main categories
INSERT INTO focus_categories (name, slug, description, sort_order, applicable_programs) VALUES
  ('Skills', 'skills', 'Professional skills and expertise areas', 1, ARRAY['CPF', 'GGF', 'ESP']),
  ('Populations Served', 'populations', 'Target populations and communities served', 2, ARRAY['CPF', 'GGF', 'ESP']),
  ('Focus Areas', 'focus-areas', 'Thematic areas of work and interest', 3, ARRAY['CPF', 'GGF', 'ESP']),
  ('Community Areas', 'community-areas', 'Chicago community areas (77 official areas)', 4, ARRAY['CPF'])
ON CONFLICT (slug) DO UPDATE SET
  name = EXCLUDED.name,
  description = EXCLUDED.description,
  sort_order = EXCLUDED.sort_order,
  applicable_programs = EXCLUDED.applicable_programs;

-- Add comment for documentation
COMMENT ON TABLE focus_categories IS 'Categories for organizing fellow focus tags: Skills, Populations, Focus Areas, Community Areas';
