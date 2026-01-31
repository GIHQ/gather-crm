-- =============================================
-- GATHER CRM: Activities Table (Web/Social Mentions)
-- =============================================
-- Activities are passive discoveries (news, social mentions)
-- vs Interactions which are active engagements (calls, emails)

-- Create activities table
CREATE TABLE IF NOT EXISTS activities (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    fellow_id UUID REFERENCES fellows(id) ON DELETE CASCADE,

    -- Activity type: 'news_mention', 'social_mention', 'publication', 'award', 'event_appearance'
    activity_type TEXT NOT NULL DEFAULT 'news_mention',

    -- Source information
    source_name TEXT,           -- e.g., "Chicago Tribune", "LinkedIn", "Twitter"
    source_url TEXT,            -- Link to the article/post
    source_domain TEXT,         -- e.g., "chicagotribune.com"

    -- Content
    title TEXT,                 -- Headline or post title
    snippet TEXT,               -- Excerpt or description
    image_url TEXT,             -- Thumbnail if available

    -- Metadata
    published_at TIMESTAMP WITH TIME ZONE,  -- When the article was published
    discovered_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),  -- When we found it

    -- Search metadata
    search_query TEXT,          -- What search found this
    relevance_score DECIMAL,    -- How confident we are this is about the fellow

    -- Status
    verified BOOLEAN DEFAULT FALSE,  -- Staff confirmed it's about this fellow
    dismissed BOOLEAN DEFAULT FALSE, -- Staff marked as not relevant
    notified BOOLEAN DEFAULT FALSE,  -- Fellow/staff has been notified

    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index for efficient queries
CREATE INDEX IF NOT EXISTS idx_activities_fellow_id ON activities(fellow_id);
CREATE INDEX IF NOT EXISTS idx_activities_discovered_at ON activities(discovered_at DESC);
CREATE INDEX IF NOT EXISTS idx_activities_type ON activities(activity_type);
CREATE INDEX IF NOT EXISTS idx_activities_verified ON activities(verified) WHERE verified = true;

-- Prevent duplicate URLs for same fellow
CREATE UNIQUE INDEX IF NOT EXISTS idx_activities_unique_url
    ON activities(fellow_id, source_url)
    WHERE source_url IS NOT NULL;

-- RLS policies
ALTER TABLE activities ENABLE ROW LEVEL SECURITY;

-- Everyone can read verified activities
CREATE POLICY "Anyone can view verified activities" ON activities
    FOR SELECT USING (verified = true OR dismissed = false);

-- Only staff can insert/update activities
CREATE POLICY "Staff can manage activities" ON activities
    FOR ALL USING (
        auth.jwt() ->> 'email' LIKE '%@goldininstitute.org' OR
        auth.jwt() ->> 'email' LIKE '%@chicagopeacefellows.org'
    );

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_activities_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER activities_updated_at
    BEFORE UPDATE ON activities
    FOR EACH ROW
    EXECUTE FUNCTION update_activities_updated_at();

-- View for recent activities feed
CREATE OR REPLACE VIEW recent_activities AS
SELECT
    a.*,
    f.first_name,
    f.last_name,
    f.photo_url,
    f.program
FROM activities a
JOIN fellows f ON a.fellow_id = f.id
WHERE a.dismissed = false
ORDER BY a.discovered_at DESC
LIMIT 100;

COMMENT ON TABLE activities IS 'Stores web/social mentions and news about fellows discovered through automated monitoring';
