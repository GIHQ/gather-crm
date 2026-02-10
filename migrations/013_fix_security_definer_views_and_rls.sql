-- =============================================
-- Migration 013: Fix Security Definer Views & Enable RLS on activities
-- =============================================
-- Resolves Supabase linter errors:
--   1. security_definer_view: 5 views using SECURITY DEFINER (owner permissions
--      bypass RLS for querying users)
--   2. rls_disabled_in_public: activities table missing RLS
--
-- In PostgreSQL 15+, views default to security_invoker = false, meaning they
-- execute with the view OWNER's permissions rather than the querying user's.
-- Setting security_invoker = on ensures RLS policies are enforced based on
-- the actual querying user.

-- =============================================
-- 1. Fix SECURITY DEFINER views
-- =============================================

-- Views defined in 006_views_and_helpers.sql
ALTER VIEW public.fellows_with_roles SET (security_invoker = on);
ALTER VIEW public.tags_by_category SET (security_invoker = on);
ALTER VIEW public.pending_tags SET (security_invoker = on);

-- Views created outside migrations (exist in database)
ALTER VIEW public.follow_ups_due SET (security_invoker = on);
ALTER VIEW public.public_directory SET (security_invoker = on);

-- =============================================
-- 2. Enable RLS on activities table
-- =============================================
-- The original migration (007) included ENABLE RLS, but the linter reports
-- it is currently disabled. Re-enable it. This is idempotent — running
-- ENABLE ROW LEVEL SECURITY on a table that already has it is a no-op.

ALTER TABLE public.activities ENABLE ROW LEVEL SECURITY;

-- Ensure the expected policies exist (these use CREATE ... IF NOT EXISTS
-- semantics via DO blocks to avoid errors if they already exist)

DO $$
BEGIN
  -- SELECT policy: anyone can view non-dismissed or verified activities
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE tablename = 'activities'
      AND policyname = 'Anyone can view verified activities'
  ) THEN
    CREATE POLICY "Anyone can view verified activities" ON public.activities
      FOR SELECT USING (verified = true OR dismissed = false);
  END IF;

  -- ALL policy: staff can manage activities
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies
    WHERE tablename = 'activities'
      AND policyname = 'Staff can manage activities'
  ) THEN
    CREATE POLICY "Staff can manage activities" ON public.activities
      FOR ALL USING (
        auth.jwt() ->> 'email' LIKE '%@goldininstitute.org' OR
        auth.jwt() ->> 'email' LIKE '%@chicagopeacefellows.org'
      );
  END IF;
END
$$;
