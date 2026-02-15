-- Migration 019: Add organization social link columns
-- The existing linkedin, twitter, instagram, facebook, website columns
-- store personal/generic links. These new columns store organization-level links
-- from the historical Excel trackers (Global Alumni Directory, CPF/GGF Trackers).

ALTER TABLE fellows ADD COLUMN IF NOT EXISTS linkedin_org TEXT;
ALTER TABLE fellows ADD COLUMN IF NOT EXISTS twitter_org TEXT;
ALTER TABLE fellows ADD COLUMN IF NOT EXISTS instagram_org TEXT;
ALTER TABLE fellows ADD COLUMN IF NOT EXISTS facebook_org TEXT;
ALTER TABLE fellows ADD COLUMN IF NOT EXISTS website_org TEXT;
ALTER TABLE fellows ADD COLUMN IF NOT EXISTS tiktok TEXT;

COMMENT ON COLUMN fellows.linkedin_org IS 'Organization LinkedIn URL (from historical data import)';
COMMENT ON COLUMN fellows.twitter_org IS 'Organization Twitter/X URL (from historical data import)';
COMMENT ON COLUMN fellows.instagram_org IS 'Organization Instagram URL (from historical data import)';
COMMENT ON COLUMN fellows.facebook_org IS 'Organization Facebook URL (from historical data import)';
COMMENT ON COLUMN fellows.website_org IS 'Organization website URL (from historical data import)';
COMMENT ON COLUMN fellows.tiktok IS 'TikTok profile URL (from historical data import)';
