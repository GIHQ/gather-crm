-- ============================================
-- MIGRATION 010: Community Platform Tables
-- ============================================
-- Phase 2a: Broadcast — announcements, resources,
-- newsletter tracking, Stream token cache,
-- and fellow "working on" field.
-- ============================================

-- ============================================
-- 1. ANNOUNCEMENTS (staff -> fellows)
-- ============================================
CREATE TABLE IF NOT EXISTS announcements (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    author_id UUID REFERENCES auth.users(id),
    target_programs TEXT[] DEFAULT '{}',  -- empty = all programs
    is_pinned BOOLEAN DEFAULT false,
    published_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- 2. RESOURCES (shared docs/links)
-- ============================================
CREATE TABLE IF NOT EXISTS resources (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title TEXT NOT NULL,
    description TEXT,
    url TEXT NOT NULL,
    category TEXT,  -- 'document', 'link', 'video', 'template'
    target_programs TEXT[] DEFAULT '{}',
    uploaded_by UUID REFERENCES auth.users(id),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- 3. NEWSLETTER SEND TRACKING
-- ============================================
CREATE TABLE IF NOT EXISTS newsletter_sends (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    buttondown_id TEXT,
    subject TEXT NOT NULL,
    body_preview TEXT,
    recipient_count INTEGER,
    target_programs TEXT[],
    sent_by UUID REFERENCES auth.users(id),
    sent_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- 4. GETSTREAM TOKEN CACHE
-- ============================================
CREATE TABLE IF NOT EXISTS stream_tokens (
    user_id UUID PRIMARY KEY REFERENCES auth.users(id),
    token TEXT NOT NULL,
    expires_at TIMESTAMPTZ NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- 5. EXTEND FELLOWS TABLE
-- ============================================
ALTER TABLE fellows ADD COLUMN IF NOT EXISTS working_on TEXT;
ALTER TABLE fellows ADD COLUMN IF NOT EXISTS working_on_updated_at TIMESTAMPTZ;

-- ============================================
-- 6. ROW LEVEL SECURITY
-- ============================================

-- Enable RLS on all new tables
ALTER TABLE announcements ENABLE ROW LEVEL SECURITY;
ALTER TABLE resources ENABLE ROW LEVEL SECURITY;
ALTER TABLE newsletter_sends ENABLE ROW LEVEL SECURITY;
ALTER TABLE stream_tokens ENABLE ROW LEVEL SECURITY;

-- ANNOUNCEMENTS policies

-- Anyone authenticated can read published announcements
DROP POLICY IF EXISTS "Anyone can read published announcements" ON announcements;
CREATE POLICY "Anyone can read published announcements"
ON announcements FOR SELECT
USING (published_at IS NOT NULL AND published_at <= NOW());

-- Staff (team_members) can insert/update/delete
DROP POLICY IF EXISTS "Staff can manage announcements" ON announcements;
CREATE POLICY "Staff can manage announcements"
ON announcements FOR ALL
USING (
    EXISTS (
        SELECT 1 FROM team_members
        WHERE team_members.user_id = auth.uid()
        AND team_members.is_active = true
    )
)
WITH CHECK (
    EXISTS (
        SELECT 1 FROM team_members
        WHERE team_members.user_id = auth.uid()
        AND team_members.is_active = true
    )
);

-- RESOURCES policies

-- Anyone authenticated can read
DROP POLICY IF EXISTS "Anyone can read resources" ON resources;
CREATE POLICY "Anyone can read resources"
ON resources FOR SELECT
USING (true);

-- Staff can manage
DROP POLICY IF EXISTS "Staff can manage resources" ON resources;
CREATE POLICY "Staff can manage resources"
ON resources FOR ALL
USING (
    EXISTS (
        SELECT 1 FROM team_members
        WHERE team_members.user_id = auth.uid()
        AND team_members.is_active = true
    )
)
WITH CHECK (
    EXISTS (
        SELECT 1 FROM team_members
        WHERE team_members.user_id = auth.uid()
        AND team_members.is_active = true
    )
);

-- NEWSLETTER_SENDS policies

-- Staff can read
DROP POLICY IF EXISTS "Staff can view newsletter history" ON newsletter_sends;
CREATE POLICY "Staff can view newsletter history"
ON newsletter_sends FOR SELECT
USING (
    EXISTS (
        SELECT 1 FROM team_members
        WHERE team_members.user_id = auth.uid()
        AND team_members.is_active = true
    )
);

-- Staff can insert
DROP POLICY IF EXISTS "Staff can log newsletter sends" ON newsletter_sends;
CREATE POLICY "Staff can log newsletter sends"
ON newsletter_sends FOR INSERT
WITH CHECK (
    EXISTS (
        SELECT 1 FROM team_members
        WHERE team_members.user_id = auth.uid()
        AND team_members.is_active = true
    )
);

-- STREAM_TOKENS policies

-- Users can only read their own token
DROP POLICY IF EXISTS "Users can read own stream token" ON stream_tokens;
CREATE POLICY "Users can read own stream token"
ON stream_tokens FOR SELECT
USING (user_id = auth.uid());

-- Service role handles insert/update (via Edge Function)
-- No user-facing write policy needed
