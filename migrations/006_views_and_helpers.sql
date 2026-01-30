-- Migration: Create helpful views and functions for the UI
-- Run in Supabase SQL Editor after previous migrations

-- View: Get fellows with their role (combines fellows table with user_roles)
CREATE OR REPLACE VIEW fellows_with_roles AS
SELECT
  f.*,
  COALESCE(ur.role, 'fellow') AS user_role
FROM fellows f
LEFT JOIN user_roles ur ON lower(f.email) = lower(ur.email);

-- View: Get all tags grouped by category (useful for filter dropdowns)
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

-- View: Get pending (unapproved) tags for admin review
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

-- Function: Get fellow profile with all their tags
CREATE OR REPLACE FUNCTION get_fellow_profile(p_fellow_id uuid)
RETURNS jsonb AS $$
DECLARE
  result jsonb;
BEGIN
  SELECT jsonb_build_object(
    'fellow', row_to_json(f),
    'tags', (
      SELECT jsonb_object_agg(
        fc.slug,
        (
          SELECT jsonb_agg(
            jsonb_build_object(
              'id', ft.id,
              'name', ft.name,
              'is_primary', fft.is_primary
            )
          )
          FROM fellow_focus_tags fft
          JOIN focus_tags ft ON ft.id = fft.tag_id
          WHERE fft.fellow_id = f.id
            AND ft.category_id = fc.id
        )
      )
      FROM focus_categories fc
      WHERE fc.is_active = true
    )
  ) INTO result
  FROM fellows f
  WHERE f.id = p_fellow_id;

  RETURN result;
END;
$$ LANGUAGE plpgsql STABLE;

-- Function: Check if user has permission for an action
CREATE OR REPLACE FUNCTION user_has_permission(
  p_email text,
  p_required_roles text[]
) RETURNS boolean AS $$
DECLARE
  v_role text;
BEGIN
  -- Get user's role
  SELECT role INTO v_role
  FROM user_roles
  WHERE email = lower(p_email);

  -- If no explicit role, check if fellow
  IF v_role IS NULL THEN
    IF EXISTS (SELECT 1 FROM fellows WHERE email = lower(p_email)) THEN
      v_role := 'fellow';
    ELSE
      v_role := 'viewer';
    END IF;
  END IF;

  RETURN v_role = ANY(p_required_roles);
END;
$$ LANGUAGE plpgsql STABLE;

-- Function: Get user's effective role
CREATE OR REPLACE FUNCTION get_user_role(p_email text)
RETURNS text AS $$
DECLARE
  v_role text;
BEGIN
  -- 1. Check explicit role assignment
  SELECT role INTO v_role
  FROM user_roles
  WHERE email = lower(p_email);

  IF v_role IS NOT NULL THEN
    RETURN v_role;
  END IF;

  -- 2. Check if fellow
  IF EXISTS (SELECT 1 FROM fellows WHERE lower(email) = lower(p_email)) THEN
    RETURN 'fellow';
  END IF;

  -- 3. Check domain for staff
  IF p_email LIKE '%@goldininstitute.org'
     OR p_email LIKE '%@chicagopeacefellows.org' THEN
    RETURN 'team';
  END IF;

  -- 4. Default to viewer
  RETURN 'viewer';
END;
$$ LANGUAGE plpgsql STABLE;

-- Grant execute permissions on functions
GRANT EXECUTE ON FUNCTION get_fellow_tags(uuid) TO authenticated;
GRANT EXECUTE ON FUNCTION search_fellows_by_tags(uuid[]) TO authenticated;
GRANT EXECUTE ON FUNCTION get_fellow_profile(uuid) TO authenticated;
GRANT EXECUTE ON FUNCTION user_has_permission(text, text[]) TO authenticated;
GRANT EXECUTE ON FUNCTION get_user_role(text) TO authenticated, anon;

-- Add comments
COMMENT ON VIEW fellows_with_roles IS 'Fellows with their user role (from user_roles table or defaults)';
COMMENT ON VIEW tags_by_category IS 'All active, approved tags grouped by category';
COMMENT ON VIEW pending_tags IS 'Tags awaiting admin approval';
COMMENT ON FUNCTION get_user_role IS 'Determines user role: checks user_roles, then fellows, then domain, defaults to viewer';
