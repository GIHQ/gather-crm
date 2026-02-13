-- =============================================
-- GATHER CRM: Login Events Table
-- =============================================
-- Tracks user logins for the activity feed

CREATE TABLE IF NOT EXISTS login_events (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id UUID NOT NULL,
    email TEXT NOT NULL,
    name TEXT,
    logged_in_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index for efficient queries
CREATE INDEX IF NOT EXISTS idx_login_events_logged_in_at ON login_events(logged_in_at DESC);

-- RLS policies
ALTER TABLE login_events ENABLE ROW LEVEL SECURITY;

-- Authenticated users can read all login events
CREATE POLICY "Authenticated users can view login events" ON login_events
    FOR SELECT USING (auth.role() = 'authenticated');

-- Authenticated users can insert their own login events
CREATE POLICY "Users can insert own login events" ON login_events
    FOR INSERT WITH CHECK (auth.uid() = user_id);

COMMENT ON TABLE login_events IS 'Tracks user logins for the activity feed';
