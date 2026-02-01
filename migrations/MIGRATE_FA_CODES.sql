-- ============================================================
-- MIGRATE FA CODES TO NEW FOCUS TAGS SYSTEM
-- Maps FA001-FA020 codes to focus_tags and fellow_focus_tags
-- ============================================================

-- ============================================================
-- Step 1: Add icon column to focus_tags if it doesn't exist
-- ============================================================

ALTER TABLE focus_tags ADD COLUMN IF NOT EXISTS icon text;

-- ============================================================
-- Step 2: Insert/Update the 20 Focus Area tags with codes & icons
-- ============================================================

INSERT INTO focus_tags (category_id, name, slug, icon, approved, is_active)
SELECT
  (SELECT id FROM focus_categories WHERE slug = 'focus-areas'),
  name,
  slug,
  icon,
  true,
  true
FROM (VALUES
  ('Peacebuilding & Conflict Resolution', 'peacebuilding-conflict-resolution', '🕊️'),
  ('Human Rights & Advocacy', 'human-rights-advocacy', '⚖️'),
  ('Gender Justice & Womens Empowerment', 'gender-justice-womens-empowerment', '♀️'),
  ('Youth Development & Leadership', 'youth-development-leadership', '🌟'),
  ('Education & Academic Support', 'education-academic-support', '📚'),
  ('Community Development & Empowerment', 'community-development-empowerment', '🏘️'),
  ('Violence Prevention & Survivor Support', 'violence-prevention-survivor-support', '🛡️'),
  ('Child Protection & Rights', 'child-protection-rights', '👶'),
  ('Mental Health & Trauma Support', 'mental-health-trauma-support', '💚'),
  ('Health & Disability Justice', 'health-disability-justice', '🏥'),
  ('Climate Action & Environmental Justice', 'climate-action-environmental-justice', '🌍'),
  ('Economic Development & Entrepreneurship', 'economic-development-entrepreneurship', '💼'),
  ('Humanitarian Aid & Disaster Response', 'humanitarian-aid-disaster-response', '🆘'),
  ('Migration & Refugee Support', 'migration-refugee-support', '🌐'),
  ('Criminal Justice Reform & Reentry', 'criminal-justice-reform-reentry', '⚖️'),
  ('Social Justice & Racial Equity', 'social-justice-racial-equity', '✊'),
  ('LGBTQ+ Rights & Inclusion', 'lgbtq-rights-inclusion', '🏳️‍🌈'),
  ('Indigenous Rights & Cultural Preservation', 'indigenous-rights-cultural-preservation', '🪶'),
  ('Arts, Culture & Media', 'arts-culture-media', '🎨'),
  ('Interfaith Dialogue & Spiritual Wellness', 'interfaith-dialogue-spiritual-wellness', '🙏')
) AS fa(name, slug, icon)
ON CONFLICT (category_id, slug) DO UPDATE SET
  name = EXCLUDED.name,
  icon = EXCLUDED.icon;

-- ============================================================
-- Step 3: Create mapping table for FA codes
-- ============================================================

CREATE TEMP TABLE fa_code_map (
  code text PRIMARY KEY,
  tag_name text NOT NULL
);

INSERT INTO fa_code_map (code, tag_name) VALUES
  ('FA001', 'Peacebuilding & Conflict Resolution'),
  ('FA002', 'Human Rights & Advocacy'),
  ('FA003', 'Gender Justice & Womens Empowerment'),
  ('FA004', 'Youth Development & Leadership'),
  ('FA005', 'Education & Academic Support'),
  ('FA006', 'Community Development & Empowerment'),
  ('FA007', 'Violence Prevention & Survivor Support'),
  ('FA008', 'Child Protection & Rights'),
  ('FA009', 'Mental Health & Trauma Support'),
  ('FA010', 'Health & Disability Justice'),
  ('FA011', 'Climate Action & Environmental Justice'),
  ('FA012', 'Economic Development & Entrepreneurship'),
  ('FA013', 'Humanitarian Aid & Disaster Response'),
  ('FA014', 'Migration & Refugee Support'),
  ('FA015', 'Criminal Justice Reform & Reentry'),
  ('FA016', 'Social Justice & Racial Equity'),
  ('FA017', 'LGBTQ+ Rights & Inclusion'),
  ('FA018', 'Indigenous Rights & Cultural Preservation'),
  ('FA019', 'Arts, Culture & Media'),
  ('FA020', 'Interfaith Dialogue & Spiritual Wellness');

-- ============================================================
-- Step 4: Migrate focus_area_1 codes to fellow_focus_tags
-- ============================================================

INSERT INTO fellow_focus_tags (fellow_id, tag_id, is_primary, created_by)
SELECT
  f.id,
  ft.id,
  false,
  'migration-fa-codes'
FROM fellows f
JOIN fa_code_map m ON f.focus_area_1 = m.code
JOIN focus_tags ft ON ft.name = m.tag_name
JOIN focus_categories fc ON ft.category_id = fc.id AND fc.slug = 'focus-areas'
WHERE f.focus_area_1 IS NOT NULL
ON CONFLICT (fellow_id, tag_id) DO NOTHING;

-- ============================================================
-- Step 5: Migrate focus_area_2 codes to fellow_focus_tags
-- ============================================================

INSERT INTO fellow_focus_tags (fellow_id, tag_id, is_primary, created_by)
SELECT
  f.id,
  ft.id,
  false,
  'migration-fa-codes'
FROM fellows f
JOIN fa_code_map m ON f.focus_area_2 = m.code
JOIN focus_tags ft ON ft.name = m.tag_name
JOIN focus_categories fc ON ft.category_id = fc.id AND fc.slug = 'focus-areas'
WHERE f.focus_area_2 IS NOT NULL
ON CONFLICT (fellow_id, tag_id) DO NOTHING;

-- ============================================================
-- Step 6: Migrate focus_area_3 codes to fellow_focus_tags
-- ============================================================

INSERT INTO fellow_focus_tags (fellow_id, tag_id, is_primary, created_by)
SELECT
  f.id,
  ft.id,
  false,
  'migration-fa-codes'
FROM fellows f
JOIN fa_code_map m ON f.focus_area_3 = m.code
JOIN focus_tags ft ON ft.name = m.tag_name
JOIN focus_categories fc ON ft.category_id = fc.id AND fc.slug = 'focus-areas'
WHERE f.focus_area_3 IS NOT NULL
ON CONFLICT (fellow_id, tag_id) DO NOTHING;

-- ============================================================
-- Step 7: Verification - Show migration results
-- ============================================================

SELECT
  'Fellows with FA codes (old system)' as metric,
  COUNT(DISTINCT id)::text as count
FROM fellows
WHERE focus_area_1 IS NOT NULL OR focus_area_2 IS NOT NULL OR focus_area_3 IS NOT NULL

UNION ALL

SELECT
  'Fellows with tags (new system)',
  COUNT(DISTINCT fellow_id)::text
FROM fellow_focus_tags

UNION ALL

SELECT
  'Total tag assignments',
  COUNT(*)::text
FROM fellow_focus_tags

UNION ALL

SELECT
  'Focus Area tags in use',
  COUNT(DISTINCT ft.id)::text
FROM fellow_focus_tags fft
JOIN focus_tags ft ON fft.tag_id = ft.id
JOIN focus_categories fc ON ft.category_id = fc.id
WHERE fc.slug = 'focus-areas';

-- ============================================================
-- Step 8: Show sample of migrated data with readable names
-- ============================================================

SELECT
  f.first_name || ' ' || f.last_name as fellow_name,
  m1.tag_name as focus_area_1,
  m2.tag_name as focus_area_2,
  m3.tag_name as focus_area_3,
  (
    SELECT string_agg(ft.icon || ' ' || ft.name, ', ')
    FROM fellow_focus_tags fft
    JOIN focus_tags ft ON fft.tag_id = ft.id
    JOIN focus_categories fc ON ft.category_id = fc.id AND fc.slug = 'focus-areas'
    WHERE fft.fellow_id = f.id
  ) as migrated_tags
FROM fellows f
LEFT JOIN fa_code_map m1 ON f.focus_area_1 = m1.code
LEFT JOIN fa_code_map m2 ON f.focus_area_2 = m2.code
LEFT JOIN fa_code_map m3 ON f.focus_area_3 = m3.code
WHERE f.focus_area_1 IS NOT NULL
LIMIT 10;

-- ============================================================
-- DONE! Refresh GATHER CRM to see focus areas on fellow profiles
-- ============================================================
