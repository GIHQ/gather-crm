-- GATHER CRM Database Migrations
-- Run this file in Supabase SQL Editor to apply all migrations
-- Alternatively, run each numbered file in sequence

-- =============================================================================
-- IMPORTANT: Run these migrations in a transaction
-- If any fail, the entire migration will be rolled back
-- =============================================================================

BEGIN;

-- Check if migrations have already been run
DO $$
BEGIN
  IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'user_roles') THEN
    RAISE NOTICE 'Tables already exist. Skipping creation...';
  END IF;
END $$;

-- =============================================================================
-- Migration 001: User Roles (Permission System)
-- =============================================================================
\echo 'Running 001_user_roles.sql...'
\i 001_user_roles.sql

-- =============================================================================
-- Migration 002: Focus Categories
-- =============================================================================
\echo 'Running 002_focus_categories.sql...'
\i 002_focus_categories.sql

-- =============================================================================
-- Migration 003: Focus Tags
-- =============================================================================
\echo 'Running 003_focus_tags.sql...'
\i 003_focus_tags.sql

-- =============================================================================
-- Migration 004: Chicago Community Areas
-- =============================================================================
\echo 'Running 004_chicago_community_areas.sql...'
\i 004_chicago_community_areas.sql

-- =============================================================================
-- Migration 005: Fellow Focus Tags Junction
-- =============================================================================
\echo 'Running 005_fellow_focus_tags.sql...'
\i 005_fellow_focus_tags.sql

-- =============================================================================
-- Migration 006: Views and Helper Functions
-- =============================================================================
\echo 'Running 006_views_and_helpers.sql...'
\i 006_views_and_helpers.sql

COMMIT;

-- =============================================================================
-- Verification: Check all tables were created
-- =============================================================================
SELECT 'Tables created:' AS status;
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_name IN ('user_roles', 'focus_categories', 'focus_tags', 'fellow_focus_tags')
ORDER BY table_name;

SELECT 'Row counts:' AS status;
SELECT 'user_roles' AS table_name, COUNT(*) AS count FROM user_roles
UNION ALL
SELECT 'focus_categories', COUNT(*) FROM focus_categories
UNION ALL
SELECT 'focus_tags', COUNT(*) FROM focus_tags
UNION ALL
SELECT 'fellow_focus_tags', COUNT(*) FROM fellow_focus_tags;
