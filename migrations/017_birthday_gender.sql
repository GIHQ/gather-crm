-- Migration 017: Add birthday and gender fields to fellows
-- Birthday supports hiding the year for privacy-sensitive fellows

ALTER TABLE fellows ADD COLUMN IF NOT EXISTS gender TEXT;
ALTER TABLE fellows ADD COLUMN IF NOT EXISTS birthday DATE;
ALTER TABLE fellows ADD COLUMN IF NOT EXISTS hide_birthday_year BOOLEAN DEFAULT false;
