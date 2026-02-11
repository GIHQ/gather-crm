-- ============================================
-- MIGRATION 014: Auto-link Team Members
-- ============================================
-- Automatically links team_members.user_id to auth.users.id
-- when a user signs up or logs in for the first time.
-- ============================================

-- Function to link team_member to auth user by email
CREATE OR REPLACE FUNCTION link_team_member_on_auth()
RETURNS TRIGGER AS $$
BEGIN
    -- Update team_members record if email matches and user_id is not set
    UPDATE team_members
    SET user_id = NEW.id,
        updated_at = NOW()
    WHERE (LOWER(email) = LOWER(NEW.email)
           OR LOWER(NEW.email) = ANY(SELECT LOWER(unnest(alternate_emails)) FROM team_members WHERE LOWER(email) = LOWER(NEW.email)))
    AND user_id IS NULL;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Trigger on new user creation
DROP TRIGGER IF EXISTS on_auth_user_created_link_team ON auth.users;
CREATE TRIGGER on_auth_user_created_link_team
    AFTER INSERT ON auth.users
    FOR EACH ROW
    EXECUTE FUNCTION link_team_member_on_auth();

-- Also run on email confirmation (in case user existed but wasn't confirmed)
DROP TRIGGER IF EXISTS on_auth_user_updated_link_team ON auth.users;
CREATE TRIGGER on_auth_user_updated_link_team
    AFTER UPDATE OF email_confirmed_at ON auth.users
    FOR EACH ROW
    WHEN (OLD.email_confirmed_at IS NULL AND NEW.email_confirmed_at IS NOT NULL)
    EXECUTE FUNCTION link_team_member_on_auth();

-- ============================================
-- Also link fellows table while we're at it
-- ============================================

CREATE OR REPLACE FUNCTION link_fellow_on_auth()
RETURNS TRIGGER AS $$
BEGIN
    -- Update fellows record if email matches and user_id is not set
    UPDATE fellows
    SET user_id = NEW.id
    WHERE (LOWER(email) = LOWER(NEW.email)
           OR LOWER(NEW.email) = ANY(SELECT LOWER(unnest(alternate_emails)) FROM fellows WHERE LOWER(email) = LOWER(NEW.email)))
    AND user_id IS NULL;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Trigger on new user creation for fellows
DROP TRIGGER IF EXISTS on_auth_user_created_link_fellow ON auth.users;
CREATE TRIGGER on_auth_user_created_link_fellow
    AFTER INSERT ON auth.users
    FOR EACH ROW
    EXECUTE FUNCTION link_fellow_on_auth();

-- Trigger on email confirmation for fellows
DROP TRIGGER IF EXISTS on_auth_user_updated_link_fellow ON auth.users;
CREATE TRIGGER on_auth_user_updated_link_fellow
    AFTER UPDATE OF email_confirmed_at ON auth.users
    FOR EACH ROW
    WHEN (OLD.email_confirmed_at IS NULL AND NEW.email_confirmed_at IS NOT NULL)
    EXECUTE FUNCTION link_fellow_on_auth();
