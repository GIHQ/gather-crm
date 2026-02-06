-- ============================================
-- MIGRATION 009: Profile Claim Requests
-- ============================================

-- Create profile_claim_requests table
CREATE TABLE IF NOT EXISTS profile_claim_requests (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  requesting_email TEXT NOT NULL,
  requesting_user_id UUID REFERENCES auth.users(id),
  target_type TEXT NOT NULL CHECK (target_type IN ('fellow', 'team_member')),
  target_id UUID NOT NULL,
  status TEXT DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected')),
  reviewed_by UUID REFERENCES auth.users(id),
  reviewed_at TIMESTAMPTZ,
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Indexes
CREATE INDEX IF NOT EXISTS idx_claim_requests_status ON profile_claim_requests (status);
CREATE INDEX IF NOT EXISTS idx_claim_requests_requesting_email ON profile_claim_requests (requesting_email);

-- RLS
ALTER TABLE profile_claim_requests ENABLE ROW LEVEL SECURITY;

-- Users can view and create their own claims
DROP POLICY IF EXISTS "Users can view own claims" ON profile_claim_requests;
CREATE POLICY "Users can view own claims" ON profile_claim_requests
  FOR SELECT USING (requesting_user_id = auth.uid());

DROP POLICY IF EXISTS "Users can create claims" ON profile_claim_requests;
CREATE POLICY "Users can create claims" ON profile_claim_requests
  FOR INSERT WITH CHECK (requesting_user_id = auth.uid());

-- Admins can manage all claims
DROP POLICY IF EXISTS "Admins can manage all claims" ON profile_claim_requests;
CREATE POLICY "Admins can manage all claims" ON profile_claim_requests
  FOR ALL USING (
    EXISTS (
      SELECT 1 FROM team_members
      WHERE user_id = auth.uid()
      AND role IN ('super_admin', 'admin')
    )
  );
