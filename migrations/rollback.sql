-- GATHER CRM Database Rollback
-- WARNING: This will DELETE all data in the new tables!
-- Only use this if you need to start fresh

BEGIN;

-- Drop views first (they depend on tables)
DROP VIEW IF EXISTS pending_tags CASCADE;
DROP VIEW IF EXISTS tags_by_category CASCADE;
DROP VIEW IF EXISTS fellows_with_roles CASCADE;

-- Drop functions
DROP FUNCTION IF EXISTS get_fellow_profile(uuid) CASCADE;
DROP FUNCTION IF EXISTS get_fellow_tags(uuid) CASCADE;
DROP FUNCTION IF EXISTS search_fellows_by_tags(uuid[]) CASCADE;
DROP FUNCTION IF EXISTS user_has_permission(text, text[]) CASCADE;
DROP FUNCTION IF EXISTS get_user_role(text) CASCADE;
DROP FUNCTION IF EXISTS update_tag_usage_counts() CASCADE;
DROP FUNCTION IF EXISTS enforce_single_primary_community_area() CASCADE;
DROP FUNCTION IF EXISTS slugify(text) CASCADE;

-- Drop tables in reverse order (respecting foreign keys)
DROP TABLE IF EXISTS fellow_focus_tags CASCADE;
DROP TABLE IF EXISTS focus_tags CASCADE;
DROP TABLE IF EXISTS focus_categories CASCADE;
DROP TABLE IF EXISTS user_roles CASCADE;

-- Note: update_updated_at_column() function is shared, don't drop it

COMMIT;

SELECT 'Rollback complete. All new tables and functions have been removed.' AS status;
