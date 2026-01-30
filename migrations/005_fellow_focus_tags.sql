-- Migration: Create fellow_focus_tags junction table
-- Run in Supabase SQL Editor after 003_focus_tags.sql

-- Create fellow_focus_tags junction table
CREATE TABLE IF NOT EXISTS fellow_focus_tags (
  fellow_id uuid NOT NULL REFERENCES fellows(id) ON DELETE CASCADE,
  tag_id uuid NOT NULL REFERENCES focus_tags(id) ON DELETE CASCADE,
  is_primary boolean DEFAULT false,  -- For community areas: primary vs secondary
  notes text,  -- Optional notes about this tag for this fellow
  created_at timestamptz DEFAULT now(),
  created_by text,  -- Email of who added this tag
  PRIMARY KEY (fellow_id, tag_id)
);

-- Create indexes for common queries
CREATE INDEX IF NOT EXISTS idx_fellow_focus_tags_fellow ON fellow_focus_tags (fellow_id);
CREATE INDEX IF NOT EXISTS idx_fellow_focus_tags_tag ON fellow_focus_tags (tag_id);
CREATE INDEX IF NOT EXISTS idx_fellow_focus_tags_primary ON fellow_focus_tags (is_primary) WHERE is_primary = true;

-- Enable Row Level Security
ALTER TABLE fellow_focus_tags ENABLE ROW LEVEL SECURITY;

-- RLS Policies

-- Everyone can read fellow tags (public directory needs this)
CREATE POLICY "Anyone can read fellow tags" ON fellow_focus_tags
  FOR SELECT
  USING (true);

-- Fellows can manage their own tags
CREATE POLICY "Fellows can manage own tags" ON fellow_focus_tags
  FOR ALL
  USING (
    EXISTS (
      SELECT 1 FROM fellows f
      WHERE f.id = fellow_id
      AND f.email = auth.jwt() ->> 'email'
    )
  );

-- Staff (team+) can manage any fellow's tags
CREATE POLICY "Staff can manage all fellow tags" ON fellow_focus_tags
  FOR ALL
  USING (
    EXISTS (
      SELECT 1 FROM user_roles ur
      WHERE ur.email = auth.jwt() ->> 'email'
      AND ur.role IN ('super_admin', 'admin', 'manager', 'team')
    )
  );

-- Function to get all tags for a fellow organized by category
CREATE OR REPLACE FUNCTION get_fellow_tags(p_fellow_id uuid)
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

-- Function to search fellows by tags
CREATE OR REPLACE FUNCTION search_fellows_by_tags(p_tag_ids uuid[])
RETURNS TABLE (
  fellow_id uuid,
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

-- Function to update tag usage counts (call periodically or via trigger)
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

-- Trigger to ensure only one primary community area per fellow
CREATE OR REPLACE FUNCTION enforce_single_primary_community_area()
RETURNS TRIGGER AS $$
BEGIN
  -- Only apply to community area tags
  IF NEW.is_primary = true AND EXISTS (
    SELECT 1 FROM focus_tags ft
    JOIN focus_categories fc ON ft.category_id = fc.id
    WHERE ft.id = NEW.tag_id AND fc.slug = 'community-areas'
  ) THEN
    -- Remove primary flag from other community areas for this fellow
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

-- Add comments for documentation
COMMENT ON TABLE fellow_focus_tags IS 'Junction table linking fellows to their focus tags';
COMMENT ON COLUMN fellow_focus_tags.is_primary IS 'For community areas: marks the primary area where fellow works most';
