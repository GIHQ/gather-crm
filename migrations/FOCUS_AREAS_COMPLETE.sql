-- ============================================================
-- FOCUS AREAS SYSTEM - COMPLETE MIGRATION
-- Run this entire script in Supabase SQL Editor
-- URL: https://supabase.com/dashboard/project/pwazurumpzydxyppbvee/sql
-- ============================================================

-- First, ensure the update_updated_at_column function exists
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- ============================================================
-- 1. FOCUS CATEGORIES TABLE
-- ============================================================

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

-- Indexes
CREATE INDEX IF NOT EXISTS idx_focus_categories_slug ON focus_categories (slug);
CREATE INDEX IF NOT EXISTS idx_focus_categories_sort ON focus_categories (sort_order);
CREATE INDEX IF NOT EXISTS idx_focus_categories_active ON focus_categories (is_active) WHERE is_active = true;

-- Auto-update trigger
DROP TRIGGER IF EXISTS update_focus_categories_updated_at ON focus_categories;
CREATE TRIGGER update_focus_categories_updated_at
  BEFORE UPDATE ON focus_categories
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- Enable RLS
ALTER TABLE focus_categories ENABLE ROW LEVEL SECURITY;

-- Drop any existing policies to avoid conflicts
DROP POLICY IF EXISTS "Anyone can read active categories" ON focus_categories;
DROP POLICY IF EXISTS "Admins can read all categories" ON focus_categories;
DROP POLICY IF EXISTS "Admins can manage categories" ON focus_categories;
DROP POLICY IF EXISTS "Public read active categories" ON focus_categories;
DROP POLICY IF EXISTS "Admins manage categories" ON focus_categories;

-- Create proper RLS policies (with explicit role grants)
CREATE POLICY "Public read active categories" ON focus_categories
  FOR SELECT TO anon, authenticated
  USING (is_active = true);

CREATE POLICY "Admins manage categories" ON focus_categories
  FOR ALL TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM user_roles ur
      WHERE ur.email = auth.jwt() ->> 'email'
      AND ur.role IN ('super_admin', 'admin')
    )
  );

-- Seed the 4 categories
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

COMMENT ON TABLE focus_categories IS 'Categories for organizing fellow focus tags: Skills, Populations, Focus Areas, Community Areas';

-- ============================================================
-- 2. FOCUS TAGS TABLE
-- ============================================================

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

-- Indexes
CREATE INDEX IF NOT EXISTS idx_focus_tags_category ON focus_tags (category_id);
CREATE INDEX IF NOT EXISTS idx_focus_tags_slug ON focus_tags (slug);
CREATE INDEX IF NOT EXISTS idx_focus_tags_approved ON focus_tags (approved);
CREATE INDEX IF NOT EXISTS idx_focus_tags_active ON focus_tags (is_active) WHERE is_active = true;
CREATE INDEX IF NOT EXISTS idx_focus_tags_name_search ON focus_tags USING gin (to_tsvector('english', name));

-- Auto-update trigger
DROP TRIGGER IF EXISTS update_focus_tags_updated_at ON focus_tags;
CREATE TRIGGER update_focus_tags_updated_at
  BEFORE UPDATE ON focus_tags
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- Enable RLS
ALTER TABLE focus_tags ENABLE ROW LEVEL SECURITY;

-- Drop existing policies
DROP POLICY IF EXISTS "Anyone can read approved tags" ON focus_tags;
DROP POLICY IF EXISTS "Admins can read all tags" ON focus_tags;
DROP POLICY IF EXISTS "Authenticated users can create tags" ON focus_tags;
DROP POLICY IF EXISTS "Admins can manage tags" ON focus_tags;
DROP POLICY IF EXISTS "Admins can delete tags" ON focus_tags;
DROP POLICY IF EXISTS "Public read approved tags" ON focus_tags;

-- Create proper RLS policies
CREATE POLICY "Public read approved tags" ON focus_tags
  FOR SELECT TO anon, authenticated
  USING (approved = true AND is_active = true);

CREATE POLICY "Authenticated users can create tags" ON focus_tags
  FOR INSERT TO authenticated
  WITH CHECK (true);

CREATE POLICY "Admins manage tags" ON focus_tags
  FOR ALL TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM user_roles ur
      WHERE ur.email = auth.jwt() ->> 'email'
      AND ur.role IN ('super_admin', 'admin')
    )
  );

-- Helper function for slugs
CREATE OR REPLACE FUNCTION slugify(text) RETURNS text AS $$
  SELECT lower(regexp_replace(regexp_replace($1, '[^a-zA-Z0-9\s-]', '', 'g'), '\s+', '-', 'g'));
$$ LANGUAGE SQL IMMUTABLE;

-- ============================================================
-- 3. SEED SKILLS TAGS (25 tags)
-- ============================================================

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

-- ============================================================
-- 4. SEED POPULATIONS SERVED TAGS (18 tags)
-- ============================================================

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

-- ============================================================
-- 5. SEED FOCUS AREAS TAGS (24 tags)
-- ============================================================

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

-- ============================================================
-- 6. SEED CHICAGO COMMUNITY AREAS (77 neighborhoods)
-- ============================================================

INSERT INTO focus_tags (category_id, name, slug)
SELECT
  (SELECT id FROM focus_categories WHERE slug = 'community-areas'),
  name,
  slug
FROM (VALUES
  -- Far North Side
  ('Rogers Park', 'rogers-park'),
  ('West Ridge', 'west-ridge'),
  ('Uptown', 'uptown'),
  ('Lincoln Square', 'lincoln-square'),
  ('Edison Park', 'edison-park'),

  -- Northwest Side
  ('Norwood Park', 'norwood-park'),
  ('Jefferson Park', 'jefferson-park'),
  ('Forest Glen', 'forest-glen'),
  ('North Park', 'north-park'),
  ('Albany Park', 'albany-park'),
  ('Portage Park', 'portage-park'),
  ('Irving Park', 'irving-park'),
  ('Dunning', 'dunning'),
  ('Montclare', 'montclare'),
  ('Belmont Cragin', 'belmont-cragin'),
  ('Hermosa', 'hermosa'),

  -- North Side
  ('Avondale', 'avondale'),
  ('Logan Square', 'logan-square'),
  ('Humboldt Park', 'humboldt-park'),

  -- Near North Side
  ('North Center', 'north-center'),
  ('Lake View', 'lake-view'),
  ('Lincoln Park', 'lincoln-park'),
  ('Near North Side', 'near-north-side'),

  -- Central
  ('Loop', 'loop'),
  ('Near South Side', 'near-south-side'),

  -- West Side
  ('West Town', 'west-town'),
  ('Austin', 'austin'),
  ('West Garfield Park', 'west-garfield-park'),
  ('East Garfield Park', 'east-garfield-park'),
  ('Near West Side', 'near-west-side'),
  ('North Lawndale', 'north-lawndale'),
  ('South Lawndale', 'south-lawndale'),
  ('Lower West Side', 'lower-west-side'),

  -- Southwest Side
  ('Garfield Ridge', 'garfield-ridge'),
  ('Archer Heights', 'archer-heights'),
  ('Brighton Park', 'brighton-park'),
  ('McKinley Park', 'mckinley-park'),
  ('New City', 'new-city'),
  ('West Elsdon', 'west-elsdon'),
  ('Gage Park', 'gage-park'),
  ('Clearing', 'clearing'),
  ('West Lawn', 'west-lawn'),
  ('Chicago Lawn', 'chicago-lawn'),
  ('West Englewood', 'west-englewood'),
  ('Englewood', 'englewood'),

  -- South Side
  ('Armour Square', 'armour-square'),
  ('Douglas', 'douglas'),
  ('Oakland', 'oakland'),
  ('Fuller Park', 'fuller-park'),
  ('Grand Boulevard', 'grand-boulevard'),
  ('Kenwood', 'kenwood'),
  ('Washington Park', 'washington-park'),
  ('Hyde Park', 'hyde-park'),
  ('Woodlawn', 'woodlawn'),
  ('South Shore', 'south-shore'),

  -- Far Southwest Side
  ('Ashburn', 'ashburn'),
  ('Auburn Gresham', 'auburn-gresham'),
  ('Beverly', 'beverly'),
  ('Washington Heights', 'washington-heights'),
  ('Mount Greenwood', 'mount-greenwood'),
  ('Morgan Park', 'morgan-park'),

  -- Far Southeast Side
  ('Chatham', 'chatham'),
  ('Avalon Park', 'avalon-park'),
  ('South Chicago', 'south-chicago'),
  ('Burnside', 'burnside'),
  ('Calumet Heights', 'calumet-heights'),
  ('Roseland', 'roseland'),
  ('Pullman', 'pullman'),
  ('South Deering', 'south-deering'),
  ('East Side', 'east-side'),
  ('West Pullman', 'west-pullman'),
  ('Riverdale', 'riverdale'),
  ('Hegewisch', 'hegewisch'),

  -- Additional areas
  ('Bridgeport', 'bridgeport'),
  ('Greater Grand Crossing', 'greater-grand-crossing'),
  ('Edgewater', 'edgewater'),
  ('OHare', 'ohare')
) AS areas(name, slug)
ON CONFLICT (category_id, slug) DO NOTHING;

COMMENT ON TABLE focus_tags IS 'Tags within focus categories that fellows can select';

-- ============================================================
-- 7. FELLOW_FOCUS_TAGS JUNCTION TABLE
-- ============================================================

CREATE TABLE IF NOT EXISTS fellow_focus_tags (
  fellow_id text NOT NULL REFERENCES fellows(id) ON DELETE CASCADE,
  tag_id uuid NOT NULL REFERENCES focus_tags(id) ON DELETE CASCADE,
  is_primary boolean DEFAULT false,
  notes text,
  created_at timestamptz DEFAULT now(),
  created_by text,
  PRIMARY KEY (fellow_id, tag_id)
);

-- Indexes
CREATE INDEX IF NOT EXISTS idx_fellow_focus_tags_fellow ON fellow_focus_tags (fellow_id);
CREATE INDEX IF NOT EXISTS idx_fellow_focus_tags_tag ON fellow_focus_tags (tag_id);
CREATE INDEX IF NOT EXISTS idx_fellow_focus_tags_primary ON fellow_focus_tags (is_primary) WHERE is_primary = true;

-- Enable RLS
ALTER TABLE fellow_focus_tags ENABLE ROW LEVEL SECURITY;

-- Drop existing policies
DROP POLICY IF EXISTS "Anyone can read fellow tags" ON fellow_focus_tags;
DROP POLICY IF EXISTS "Fellows can manage own tags" ON fellow_focus_tags;
DROP POLICY IF EXISTS "Staff can manage all fellow tags" ON fellow_focus_tags;
DROP POLICY IF EXISTS "Public read fellow tags" ON fellow_focus_tags;

-- Create RLS policies
CREATE POLICY "Public read fellow tags" ON fellow_focus_tags
  FOR SELECT TO anon, authenticated
  USING (true);

CREATE POLICY "Fellows can manage own tags" ON fellow_focus_tags
  FOR ALL TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM fellows f
      WHERE f.id = fellow_id
      AND lower(f.email) = lower(auth.jwt() ->> 'email')
    )
  );

CREATE POLICY "Staff can manage all fellow tags" ON fellow_focus_tags
  FOR ALL TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM user_roles ur
      WHERE ur.email = auth.jwt() ->> 'email'
      AND ur.role IN ('super_admin', 'admin', 'manager', 'team')
    )
  );

COMMENT ON TABLE fellow_focus_tags IS 'Junction table linking fellows to their focus tags';
COMMENT ON COLUMN fellow_focus_tags.is_primary IS 'For community areas: marks the primary area where fellow works most';

-- ============================================================
-- 8. HELPER FUNCTIONS
-- ============================================================

-- Get all tags for a fellow organized by category
CREATE OR REPLACE FUNCTION get_fellow_tags(p_fellow_id text)
RETURNS TABLE (
  category_name text,
  category_slug text,
  tags jsonb
) AS $$
BEGIN
  RETURN QUERY
  SELECT
    fc.name AS category_name,
    fc.slug AS category_slug,
    jsonb_agg(
      jsonb_build_object(
        'id', ft.id,
        'name', ft.name,
        'slug', ft.slug,
        'is_primary', fft.is_primary
      ) ORDER BY fft.is_primary DESC, ft.name
    ) AS tags
  FROM focus_categories fc
  JOIN focus_tags ft ON ft.category_id = fc.id
  JOIN fellow_focus_tags fft ON fft.tag_id = ft.id
  WHERE fft.fellow_id = p_fellow_id
    AND ft.is_active = true
    AND ft.approved = true
  GROUP BY fc.id, fc.name, fc.slug
  ORDER BY fc.sort_order;
END;
$$ LANGUAGE plpgsql STABLE;

-- Search fellows by tags
CREATE OR REPLACE FUNCTION search_fellows_by_tags(p_tag_ids uuid[])
RETURNS TABLE (
  fellow_id text,
  match_count int
) AS $$
BEGIN
  RETURN QUERY
  SELECT
    fft.fellow_id,
    COUNT(*)::int AS match_count
  FROM fellow_focus_tags fft
  WHERE fft.tag_id = ANY(p_tag_ids)
  GROUP BY fft.fellow_id
  ORDER BY match_count DESC;
END;
$$ LANGUAGE plpgsql STABLE;

-- Update tag usage counts
CREATE OR REPLACE FUNCTION update_tag_usage_counts()
RETURNS void AS $$
BEGIN
  UPDATE focus_tags ft
  SET usage_count = (
    SELECT COUNT(*)
    FROM fellow_focus_tags fft
    WHERE fft.tag_id = ft.id
  );
END;
$$ LANGUAGE plpgsql;

-- Enforce single primary community area per fellow
CREATE OR REPLACE FUNCTION enforce_single_primary_community_area()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.is_primary = true AND EXISTS (
    SELECT 1 FROM focus_tags ft
    JOIN focus_categories fc ON ft.category_id = fc.id
    WHERE ft.id = NEW.tag_id AND fc.slug = 'community-areas'
  ) THEN
    UPDATE fellow_focus_tags fft
    SET is_primary = false
    FROM focus_tags ft
    JOIN focus_categories fc ON ft.category_id = fc.id
    WHERE fft.fellow_id = NEW.fellow_id
      AND fft.tag_id = ft.id
      AND fc.slug = 'community-areas'
      AND fft.tag_id != NEW.tag_id
      AND fft.is_primary = true;
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS enforce_primary_community_area ON fellow_focus_tags;
CREATE TRIGGER enforce_primary_community_area
  AFTER INSERT OR UPDATE ON fellow_focus_tags
  FOR EACH ROW
  EXECUTE FUNCTION enforce_single_primary_community_area();

-- ============================================================
-- 9. VIEWS
-- ============================================================

-- Tags grouped by category
CREATE OR REPLACE VIEW tags_by_category AS
SELECT
  fc.id AS category_id,
  fc.name AS category_name,
  fc.slug AS category_slug,
  fc.applicable_programs,
  fc.sort_order,
  jsonb_agg(
    jsonb_build_object(
      'id', ft.id,
      'name', ft.name,
      'slug', ft.slug,
      'usage_count', ft.usage_count
    ) ORDER BY ft.usage_count DESC, ft.name
  ) AS tags
FROM focus_categories fc
LEFT JOIN focus_tags ft ON ft.category_id = fc.id
  AND ft.is_active = true
  AND ft.approved = true
WHERE fc.is_active = true
GROUP BY fc.id, fc.name, fc.slug, fc.applicable_programs, fc.sort_order
ORDER BY fc.sort_order;

-- Pending tags for admin review
CREATE OR REPLACE VIEW pending_tags AS
SELECT
  ft.id,
  ft.name,
  ft.slug,
  ft.created_at,
  ft.created_by,
  fc.name AS category_name,
  fc.slug AS category_slug
FROM focus_tags ft
JOIN focus_categories fc ON ft.category_id = fc.id
WHERE ft.approved = false
ORDER BY ft.created_at DESC;

-- ============================================================
-- 10. GRANT PERMISSIONS
-- ============================================================

GRANT EXECUTE ON FUNCTION get_fellow_tags(text) TO authenticated;
GRANT EXECUTE ON FUNCTION search_fellows_by_tags(uuid[]) TO authenticated;
GRANT EXECUTE ON FUNCTION slugify(text) TO authenticated;

-- ============================================================
-- VERIFICATION QUERY - Run after migration
-- ============================================================

-- SELECT
--   'focus_categories' AS table_name,
--   COUNT(*) AS row_count
-- FROM focus_categories
-- UNION ALL
-- SELECT 'focus_tags', COUNT(*) FROM focus_tags
-- UNION ALL
-- SELECT 'fellow_focus_tags', COUNT(*) FROM fellow_focus_tags;

-- Expected results:
-- focus_categories: 4
-- focus_tags: 144 (25 skills + 18 populations + 24 focus areas + 77 community areas)
-- fellow_focus_tags: 0 (or however many have been assigned)
