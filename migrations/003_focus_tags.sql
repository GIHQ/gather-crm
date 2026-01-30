-- Migration: Create focus_tags table and seed initial tags
-- Run in Supabase SQL Editor

-- Create focus_tags table
CREATE TABLE IF NOT EXISTS focus_tags (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  category_id uuid NOT NULL REFERENCES focus_categories(id) ON DELETE CASCADE,
  name text NOT NULL,
  slug text NOT NULL,
  description text,
  approved boolean DEFAULT true,
  created_by text,
  usage_count int DEFAULT 0,
  is_active boolean DEFAULT true,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  UNIQUE(category_id, slug)
);

-- Create indexes
CREATE INDEX IF NOT EXISTS idx_focus_tags_category ON focus_tags (category_id);
CREATE INDEX IF NOT EXISTS idx_focus_tags_slug ON focus_tags (slug);
CREATE INDEX IF NOT EXISTS idx_focus_tags_approved ON focus_tags (approved);
CREATE INDEX IF NOT EXISTS idx_focus_tags_active ON focus_tags (is_active) WHERE is_active = true;
CREATE INDEX IF NOT EXISTS idx_focus_tags_name_search ON focus_tags USING gin (to_tsvector('english', name));

-- Add trigger to auto-update updated_at
DROP TRIGGER IF EXISTS update_focus_tags_updated_at ON focus_tags;
CREATE TRIGGER update_focus_tags_updated_at
  BEFORE UPDATE ON focus_tags
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- Enable Row Level Security
ALTER TABLE focus_tags ENABLE ROW LEVEL SECURITY;

-- RLS Policies

-- Everyone can read approved, active tags
CREATE POLICY "Anyone can read approved tags" ON focus_tags
  FOR SELECT
  USING (approved = true AND is_active = true);

-- Admins can read all tags
CREATE POLICY "Admins can read all tags" ON focus_tags
  FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM user_roles ur
      WHERE ur.email = auth.jwt() ->> 'email'
      AND ur.role IN ('super_admin', 'admin')
    )
  );

-- Authenticated users can create new tags (pending approval)
CREATE POLICY "Authenticated users can create tags" ON focus_tags
  FOR INSERT
  WITH CHECK (auth.role() = 'authenticated');

-- Only admins can update/delete tags
CREATE POLICY "Admins can manage tags" ON focus_tags
  FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM user_roles ur
      WHERE ur.email = auth.jwt() ->> 'email'
      AND ur.role IN ('super_admin', 'admin')
    )
  );

CREATE POLICY "Admins can delete tags" ON focus_tags
  FOR DELETE
  USING (
    EXISTS (
      SELECT 1 FROM user_roles ur
      WHERE ur.email = auth.jwt() ->> 'email'
      AND ur.role IN ('super_admin', 'admin')
    )
  );

-- Helper function to create slug from name
CREATE OR REPLACE FUNCTION slugify(text) RETURNS text AS $$
  SELECT lower(regexp_replace(regexp_replace($1, '[^a-zA-Z0-9\s-]', '', 'g'), '\s+', '-', 'g'));
$$ LANGUAGE SQL IMMUTABLE;

-- Seed Skills tags
INSERT INTO focus_tags (category_id, name, slug)
SELECT
  (SELECT id FROM focus_categories WHERE slug = 'skills'),
  unnest(ARRAY[
    'Public Relations',
    'Accounting',
    'Fundraising',
    'Youth Education',
    'Website Development',
    'Social Media',
    'Facilitation',
    'Asset Mapping',
    'Grant Writing',
    'Event Planning',
    'Public Speaking',
    'Photography',
    'Video Production',
    'Graphic Design',
    'Data Analysis',
    'Project Management',
    'Community Organizing',
    'Conflict Resolution',
    'Leadership Development',
    'Strategic Planning',
    'Nonprofit Management',
    'Volunteer Coordination',
    'Program Evaluation',
    'Policy Advocacy',
    'Coalition Building'
  ]),
  unnest(ARRAY[
    'public-relations',
    'accounting',
    'fundraising',
    'youth-education',
    'website-development',
    'social-media',
    'facilitation',
    'asset-mapping',
    'grant-writing',
    'event-planning',
    'public-speaking',
    'photography',
    'video-production',
    'graphic-design',
    'data-analysis',
    'project-management',
    'community-organizing',
    'conflict-resolution',
    'leadership-development',
    'strategic-planning',
    'nonprofit-management',
    'volunteer-coordination',
    'program-evaluation',
    'policy-advocacy',
    'coalition-building'
  ])
ON CONFLICT (category_id, slug) DO NOTHING;

-- Seed Populations Served tags
INSERT INTO focus_tags (category_id, name, slug)
SELECT
  (SELECT id FROM focus_categories WHERE slug = 'populations'),
  unnest(ARRAY[
    'Youth',
    'Seniors',
    'Women',
    'Men',
    'LGBTQ+',
    'Immigrants/Refugees',
    'Veterans',
    'Formerly Incarcerated',
    'People with Disabilities',
    'Low-Income Families',
    'Homeless/Housing Insecure',
    'Small Business Owners',
    'Artists/Creatives',
    'Students',
    'Parents',
    'Indigenous Communities',
    'Rural Communities',
    'Urban Communities'
  ]),
  unnest(ARRAY[
    'youth',
    'seniors',
    'women',
    'men',
    'lgbtq-plus',
    'immigrants-refugees',
    'veterans',
    'formerly-incarcerated',
    'people-with-disabilities',
    'low-income-families',
    'homeless-housing-insecure',
    'small-business-owners',
    'artists-creatives',
    'students',
    'parents',
    'indigenous-communities',
    'rural-communities',
    'urban-communities'
  ])
ON CONFLICT (category_id, slug) DO NOTHING;

-- Seed Focus Areas tags
INSERT INTO focus_tags (category_id, name, slug)
SELECT
  (SELECT id FROM focus_categories WHERE slug = 'focus-areas'),
  unnest(ARRAY[
    'Violence Prevention',
    'Economic Development',
    'Education',
    'Health/Wellness',
    'Environmental Justice',
    'Arts & Culture',
    'Housing',
    'Food Security',
    'Mental Health',
    'Substance Abuse',
    'Workforce Development',
    'Civic Engagement',
    'Technology Access',
    'Legal Services',
    'Immigration Services',
    'Youth Development',
    'Public Safety',
    'Community Building',
    'Social Enterprise',
    'Human Rights',
    'Peacebuilding',
    'Gender Equality',
    'Racial Justice',
    'Climate Action'
  ]),
  unnest(ARRAY[
    'violence-prevention',
    'economic-development',
    'education',
    'health-wellness',
    'environmental-justice',
    'arts-culture',
    'housing',
    'food-security',
    'mental-health',
    'substance-abuse',
    'workforce-development',
    'civic-engagement',
    'technology-access',
    'legal-services',
    'immigration-services',
    'youth-development',
    'public-safety',
    'community-building',
    'social-enterprise',
    'human-rights',
    'peacebuilding',
    'gender-equality',
    'racial-justice',
    'climate-action'
  ])
ON CONFLICT (category_id, slug) DO NOTHING;

-- Add comment for documentation
COMMENT ON TABLE focus_tags IS 'Tags within focus categories that fellows can select';
