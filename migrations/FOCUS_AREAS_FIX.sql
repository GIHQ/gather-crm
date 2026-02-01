-- ============================================================
-- FOCUS AREAS - FIX RLS POLICIES
-- Run this to fix the RLS issue (tables already exist)
-- ============================================================

-- ============================================================
-- 1. FIX FOCUS_CATEGORIES POLICIES
-- ============================================================

DO $$
BEGIN
  -- Drop all existing policies on focus_categories
  DROP POLICY IF EXISTS "Anyone can read active categories" ON focus_categories;
  DROP POLICY IF EXISTS "Admins can read all categories" ON focus_categories;
  DROP POLICY IF EXISTS "Admins can manage categories" ON focus_categories;
  DROP POLICY IF EXISTS "Public read active categories" ON focus_categories;
  DROP POLICY IF EXISTS "Admins manage categories" ON focus_categories;
EXCEPTION WHEN undefined_table THEN
  RAISE NOTICE 'focus_categories does not exist yet';
END $$;

-- Create proper policies with explicit role grants
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

-- ============================================================
-- 2. FIX FOCUS_TAGS POLICIES
-- ============================================================

DO $$
BEGIN
  -- Drop all existing policies on focus_tags
  DROP POLICY IF EXISTS "Anyone can read approved tags" ON focus_tags;
  DROP POLICY IF EXISTS "Admins can read all tags" ON focus_tags;
  DROP POLICY IF EXISTS "Authenticated users can create tags" ON focus_tags;
  DROP POLICY IF EXISTS "Admins can manage tags" ON focus_tags;
  DROP POLICY IF EXISTS "Admins can delete tags" ON focus_tags;
  DROP POLICY IF EXISTS "Public read approved tags" ON focus_tags;
  DROP POLICY IF EXISTS "Admins manage tags" ON focus_tags;
EXCEPTION WHEN undefined_table THEN
  RAISE NOTICE 'focus_tags does not exist yet';
END $$;

-- Create proper policies
CREATE POLICY "Public read approved tags" ON focus_tags
  FOR SELECT TO anon, authenticated
  USING (approved = true AND is_active = true);

CREATE POLICY "Authenticated users can create tags" ON focus_tags
  FOR INSERT TO authenticated
  WITH CHECK (true);

CREATE POLICY "Admins manage tags" ON focus_tags
  FOR UPDATE TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM user_roles ur
      WHERE ur.email = auth.jwt() ->> 'email'
      AND ur.role IN ('super_admin', 'admin')
    )
  );

CREATE POLICY "Admins delete tags" ON focus_tags
  FOR DELETE TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM user_roles ur
      WHERE ur.email = auth.jwt() ->> 'email'
      AND ur.role IN ('super_admin', 'admin')
    )
  );

-- ============================================================
-- 3. FIX FELLOW_FOCUS_TAGS POLICIES
-- ============================================================

DO $$
BEGIN
  DROP POLICY IF EXISTS "Anyone can read fellow tags" ON fellow_focus_tags;
  DROP POLICY IF EXISTS "Fellows can manage own tags" ON fellow_focus_tags;
  DROP POLICY IF EXISTS "Staff can manage all fellow tags" ON fellow_focus_tags;
  DROP POLICY IF EXISTS "Public read fellow tags" ON fellow_focus_tags;
EXCEPTION WHEN undefined_table THEN
  RAISE NOTICE 'fellow_focus_tags does not exist yet';
END $$;

-- Create proper policies
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

-- ============================================================
-- 4. VERIFY DATA EXISTS
-- ============================================================

-- Check category count (should be 4)
DO $$
DECLARE
  cat_count int;
  tag_count int;
BEGIN
  SELECT COUNT(*) INTO cat_count FROM focus_categories;
  SELECT COUNT(*) INTO tag_count FROM focus_tags;

  RAISE NOTICE 'Categories: %, Tags: %', cat_count, tag_count;

  IF cat_count = 0 THEN
    RAISE NOTICE 'WARNING: No categories found - you may need to run the full migration';
  END IF;
END $$;

-- ============================================================
-- DONE! Refresh GATHER CRM to test
-- ============================================================
