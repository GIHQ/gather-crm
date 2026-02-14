-- Migration 018: Set up daily automated news scan via pg_cron
-- Scans 25 fellows/day across all 5 platforms (Google News, LinkedIn, Twitter, Facebook, Instagram)
-- With ~292 fellows, cycles through all of them every ~12 days
-- Uses SerpAPI Developer plan (5,000 searches/month) — estimated ~3,900/month

-- Requires pg_cron and pg_net extensions (available on Supabase Pro plan)
CREATE EXTENSION IF NOT EXISTS pg_cron;
CREATE EXTENSION IF NOT EXISTS pg_net;

-- Fetch custom search terms from app_settings to pass to the edge function
-- Schedule daily at 6 AM UTC (midnight CST)
SELECT cron.schedule(
  'daily-news-scan',
  '0 6 * * *',
  $$
  SELECT net.http_post(
    url := 'https://pwazurumpzydxyppbvee.supabase.co/functions/v1/search-news',
    headers := jsonb_build_object(
      'Content-Type', 'application/json',
      'Authorization', 'Bearer ' || current_setting('app.settings.anon_key', true)
    ),
    body := jsonb_build_object(
      'max_fellows', 25,
      'platforms', jsonb_build_array('google_news', 'linkedin', 'twitter', 'facebook', 'instagram'),
      'customTerms', COALESCE(
        (SELECT value FROM app_settings WHERE key = 'news_search_terms'),
        '["Goldin Institute", "Chicago Peace Fellows"]'::jsonb
      )
    )
  );
  $$
);

-- Store the notification email in app_settings
INSERT INTO app_settings (key, value) VALUES
  ('news_alert_email', '"travis@goldininstitute.org"'::jsonb)
ON CONFLICT (key) DO NOTHING;
