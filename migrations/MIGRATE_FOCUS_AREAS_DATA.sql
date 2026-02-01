-- ============================================================
-- MIGRATE EXISTING FOCUS AREA DATA
-- Maps focus_area_1/2/3 columns to new fellow_focus_tags system
-- ============================================================

-- Step 1: See what values exist (run this first to preview)
-- SELECT 'focus_area_1' as col, focus_area_1 as value, COUNT(*) as cnt
-- FROM fellows WHERE focus_area_1 IS NOT NULL AND focus_area_1 != ''
-- GROUP BY focus_area_1
-- UNION ALL
-- SELECT 'focus_area_2', focus_area_2, COUNT(*)
-- FROM fellows WHERE focus_area_2 IS NOT NULL AND focus_area_2 != ''
-- GROUP BY focus_area_2
-- UNION ALL
-- SELECT 'focus_area_3', focus_area_3, COUNT(*)
-- FROM fellows WHERE focus_area_3 IS NOT NULL AND focus_area_3 != ''
-- GROUP BY focus_area_3
-- ORDER BY col, value;

-- ============================================================
-- Step 2: Create any missing tags from existing focus_area values
-- ============================================================

-- Get the focus-areas category ID
DO $$
DECLARE
  focus_areas_cat_id uuid;
BEGIN
  SELECT id INTO focus_areas_cat_id FROM focus_categories WHERE slug = 'focus-areas';

  IF focus_areas_cat_id IS NULL THEN
    RAISE EXCEPTION 'focus-areas category not found. Run the main migration first.';
  END IF;
END $$;

-- Insert any focus_area values that don't already exist as tags
INSERT INTO focus_tags (category_id, name, slug, approved)
SELECT DISTINCT
  (SELECT id FROM focus_categories WHERE slug = 'focus-areas'),
  value,
  lower(regexp_replace(regexp_replace(value, '[^a-zA-Z0-9\s-]', '', 'g'), '\s+', '-', 'g')),
  true
FROM (
  SELECT DISTINCT focus_area_1 AS value FROM fellows WHERE focus_area_1 IS NOT NULL AND focus_area_1 != ''
  UNION
  SELECT DISTINCT focus_area_2 FROM fellows WHERE focus_area_2 IS NOT NULL AND focus_area_2 != ''
  UNION
  SELECT DISTINCT focus_area_3 FROM fellows WHERE focus_area_3 IS NOT NULL AND focus_area_3 != ''
) AS unique_values
WHERE value IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 FROM focus_tags ft
    JOIN focus_categories fc ON ft.category_id = fc.id
    WHERE fc.slug = 'focus-areas'
    AND lower(ft.name) = lower(value)
  )
ON CONFLICT (category_id, slug) DO NOTHING;

-- ============================================================
-- Step 3: Migrate focus_area_1 to fellow_focus_tags
-- ============================================================

INSERT INTO fellow_focus_tags (fellow_id, tag_id, is_primary, created_by)
SELECT
  f.id,
  ft.id,
  false,
  'migration'
FROM fellows f
JOIN focus_tags ft ON lower(ft.name) = lower(f.focus_area_1)
JOIN focus_categories fc ON ft.category_id = fc.id AND fc.slug = 'focus-areas'
WHERE f.focus_area_1 IS NOT NULL
  AND f.focus_area_1 != ''
ON CONFLICT (fellow_id, tag_id) DO NOTHING;

-- ============================================================
-- Step 4: Migrate focus_area_2 to fellow_focus_tags
-- ============================================================

INSERT INTO fellow_focus_tags (fellow_id, tag_id, is_primary, created_by)
SELECT
  f.id,
  ft.id,
  false,
  'migration'
FROM fellows f
JOIN focus_tags ft ON lower(ft.name) = lower(f.focus_area_2)
JOIN focus_categories fc ON ft.category_id = fc.id AND fc.slug = 'focus-areas'
WHERE f.focus_area_2 IS NOT NULL
  AND f.focus_area_2 != ''
ON CONFLICT (fellow_id, tag_id) DO NOTHING;

-- ============================================================
-- Step 5: Migrate focus_area_3 to fellow_focus_tags
-- ============================================================

INSERT INTO fellow_focus_tags (fellow_id, tag_id, is_primary, created_by)
SELECT
  f.id,
  ft.id,
  false,
  'migration'
FROM fellows f
JOIN focus_tags ft ON lower(ft.name) = lower(f.focus_area_3)
JOIN focus_categories fc ON ft.category_id = fc.id AND fc.slug = 'focus-areas'
WHERE f.focus_area_3 IS NOT NULL
  AND f.focus_area_3 != ''
ON CONFLICT (fellow_id, tag_id) DO NOTHING;

-- ============================================================
-- Step 6: Verify migration results
-- ============================================================

SELECT
  'Fellows with focus areas (old system)' as metric,
  COUNT(DISTINCT id) as count
FROM fellows
WHERE focus_area_1 IS NOT NULL OR focus_area_2 IS NOT NULL OR focus_area_3 IS NOT NULL

UNION ALL

SELECT
  'Fellows with tags (new system)',
  COUNT(DISTINCT fellow_id)
FROM fellow_focus_tags

UNION ALL

SELECT
  'Total tag assignments',
  COUNT(*)
FROM fellow_focus_tags

UNION ALL

SELECT
  'Unique focus area tags used',
  COUNT(DISTINCT ft.id)
FROM fellow_focus_tags fft
JOIN focus_tags ft ON fft.tag_id = ft.id
JOIN focus_categories fc ON ft.category_id = fc.id
WHERE fc.slug = 'focus-areas';

-- ============================================================
-- Step 7: Show sample of migrated data
-- ============================================================

SELECT
  f.name,
  f.focus_area_1 as old_fa1,
  f.focus_area_2 as old_fa2,
  f.focus_area_3 as old_fa3,
  string_agg(ft.name, ', ') as new_tags
FROM fellows f
LEFT JOIN fellow_focus_tags fft ON f.id = fft.fellow_id
LEFT JOIN focus_tags ft ON fft.tag_id = ft.id
LEFT JOIN focus_categories fc ON ft.category_id = fc.id AND fc.slug = 'focus-areas'
WHERE f.focus_area_1 IS NOT NULL
GROUP BY f.id, f.name, f.focus_area_1, f.focus_area_2, f.focus_area_3
LIMIT 10;
