-- Migration 015: Content translations cache table
-- Persistent cache for translated dynamic content (bios, announcements, etc.)
-- Avoids repeated Google Translate API calls across sessions and users

CREATE TABLE IF NOT EXISTS content_translations (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  source_hash text NOT NULL,          -- MD5 hash of source text for fast lookup
  source_text text NOT NULL,           -- Original English text
  target_lang text NOT NULL,           -- Language code (es, fr, ar, etc.)
  translated_text text NOT NULL,       -- Translated text
  created_at timestamptz DEFAULT now(),
  UNIQUE(source_hash, target_lang)
);

-- Index for fast lookups by hash + language
CREATE INDEX IF NOT EXISTS idx_content_translations_lookup
  ON content_translations(source_hash, target_lang);

-- Index for cleanup of old translations
CREATE INDEX IF NOT EXISTS idx_content_translations_created
  ON content_translations(created_at);

-- RLS: Allow anyone to read translations, only authenticated users can insert
ALTER TABLE content_translations ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read translations"
  ON content_translations FOR SELECT
  USING (true);

CREATE POLICY "Authenticated users can insert translations"
  ON content_translations FOR INSERT
  WITH CHECK (true);

-- Prevent updates/deletes (cache is append-only)
-- Old entries can be cleaned up by admin via SQL if needed
