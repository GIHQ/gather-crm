-- Migration: Seed Chicago's 77 official community areas
-- Run in Supabase SQL Editor after 003_focus_tags.sql

-- Seed all 77 Chicago Community Areas (CPF only)
-- Organized by region for easier reference
INSERT INTO focus_tags (category_id, name, slug)
SELECT
  (SELECT id FROM focus_categories WHERE slug = 'community-areas'),
  name,
  slug
FROM (VALUES
  -- Far North Side (1-4, 77)
  ('Rogers Park', 'rogers-park'),
  ('West Ridge', 'west-ridge'),
  ('Uptown', 'uptown'),
  ('Lincoln Square', 'lincoln-square'),
  ('Edison Park', 'edison-park'),

  -- Northwest Side (5-17)
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

  -- North Side (5-7)
  ('Avondale', 'avondale'),
  ('Logan Square', 'logan-square'),
  ('Humboldt Park', 'humboldt-park'),

  -- Near North Side (8)
  ('North Center', 'north-center'),
  ('Lake View', 'lake-view'),
  ('Lincoln Park', 'lincoln-park'),
  ('Near North Side', 'near-north-side'),

  -- Central (32-33)
  ('Loop', 'loop'),
  ('Near South Side', 'near-south-side'),

  -- West Side (23-31)
  ('West Town', 'west-town'),
  ('Austin', 'austin'),
  ('West Garfield Park', 'west-garfield-park'),
  ('East Garfield Park', 'east-garfield-park'),
  ('Near West Side', 'near-west-side'),
  ('North Lawndale', 'north-lawndale'),
  ('South Lawndale', 'south-lawndale'),
  ('Lower West Side', 'lower-west-side'),

  -- Southwest Side (56-67)
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

  -- South Side (34-43)
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

  -- Far Southwest Side (68-75)
  ('Ashburn', 'ashburn'),
  ('Auburn Gresham', 'auburn-gresham'),
  ('Beverly', 'beverly'),
  ('Washington Heights', 'washington-heights'),
  ('Mount Greenwood', 'mount-greenwood'),
  ('Morgan Park', 'morgan-park'),

  -- Far Southeast Side (44-55)
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

-- Add comment
COMMENT ON COLUMN focus_tags.slug IS 'URL-friendly identifier; for community areas, based on official Chicago names';
