# GATHER News Search Edge Function

Automatically searches the web for news mentions of fellows and stores them in the `activities` table.

## Setup Instructions

### 1. Run the database migration first
```sql
-- Run migrations/007_activities_table.sql in Supabase SQL Editor
-- Also add this column to fellows table:
ALTER TABLE fellows ADD COLUMN IF NOT EXISTS last_news_search TIMESTAMP WITH TIME ZONE;
```

### 2. Get Google API Credentials
1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a project or select existing
3. Enable "Custom Search API"
4. Create an API key under Credentials
5. Go to [Programmable Search Engine](https://programmablesearchengine.google.com/)
6. Create a new search engine → "Search the entire web"
7. Copy the Search Engine ID

### 3. Set Environment Variables in Supabase
Go to Supabase Dashboard → Settings → Edge Functions → Add secrets:
- `GOOGLE_API_KEY`: Your Google API key
- `GOOGLE_SEARCH_ENGINE_ID`: Your search engine ID

### 4. Deploy the Edge Function
```bash
# Install Supabase CLI if not already
npm install -g supabase

# Login to Supabase
supabase login

# Link to your project
supabase link --project-ref pwazurumpzydxyppbvee

# Deploy the function
supabase functions deploy search-news
```

### 5. Set up Daily Cron Job
In Supabase SQL Editor, run:
```sql
-- Enable pg_cron extension
CREATE EXTENSION IF NOT EXISTS pg_cron;

-- Schedule daily search at 6 AM UTC
SELECT cron.schedule(
  'daily-news-search',
  '0 6 * * *',
  $$
  SELECT net.http_post(
    url := 'https://pwazurumpzydxyppbvee.supabase.co/functions/v1/search-news',
    headers := '{"Authorization": "Bearer YOUR_ANON_KEY"}'::jsonb,
    body := '{"max_fellows": 20}'::jsonb
  );
  $$
);
```

## Manual Testing
```bash
curl -X POST https://pwazurumpzydxyppbvee.supabase.co/functions/v1/search-news \
  -H "Authorization: Bearer YOUR_ANON_KEY" \
  -H "Content-Type: application/json" \
  -d '{"max_fellows": 5}'
```

## Cost Estimate
- Google Custom Search API: 100 free queries/day, then $5 per 1000 queries
- Searching 20 fellows/day = ~600 queries/month = mostly free tier
- If you have 200+ fellows, budget ~$5-10/month

## How It Works
1. Fetches fellows sorted by `last_news_search` (oldest first)
2. Searches Google for `"First Last" OR "Organization"` + context terms
3. Filters results by relevance score
4. Stores new mentions in `activities` table
5. Updates `last_news_search` on fellow record
6. Rotates through all fellows over multiple days
