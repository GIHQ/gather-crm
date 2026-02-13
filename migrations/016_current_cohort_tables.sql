-- Migration 016: Current Cohort Management Tables
-- Run in Supabase SQL Editor
-- Creates tables for managing current fellows across three sites:
--   Chicago (CPF), Dar es Salaam (GGF), Mosquera (ESP)

-- ============================================================
-- 1. SITES — Program sites where current cohorts operate
-- ============================================================

CREATE TABLE IF NOT EXISTS sites (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  city text NOT NULL,
  country text NOT NULL,
  program text NOT NULL,  -- CPF, GGF, or ESP
  cohort_year integer NOT NULL DEFAULT 2026,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE sites ENABLE ROW LEVEL SECURITY;

-- Staff can read sites
CREATE POLICY "sites_select_team" ON sites FOR SELECT
  USING (EXISTS (
    SELECT 1 FROM team_members
    WHERE team_members.user_id = auth.uid()
    AND team_members.is_active = true
  ));

-- Public can also read sites (needed for current fellows who aren't staff)
CREATE POLICY "sites_select_public" ON sites FOR SELECT
  USING (true);

-- Admin can manage sites
CREATE POLICY "sites_manage_admin" ON sites FOR ALL
  USING (is_admin());

-- Seed the three sites
INSERT INTO sites (name, city, country, program, cohort_year) VALUES
  ('Chicago', 'Chicago', 'USA', 'CPF', 2026),
  ('Dar es Salaam', 'Dar es Salaam', 'Tanzania', 'GGF', 2026),
  ('Mosquera', 'Mosquera', 'Colombia', 'ESP', 2026);


-- ============================================================
-- 2. FELLOWS TABLE — Add site_id column
-- ============================================================

-- Add site_id to fellows (nullable — null for alumni)
ALTER TABLE fellows ADD COLUMN IF NOT EXISTS site_id uuid REFERENCES sites(id);

-- Create index for filtering current fellows by site
CREATE INDEX IF NOT EXISTS idx_fellows_site_id ON fellows(site_id) WHERE site_id IS NOT NULL;
CREATE INDEX IF NOT EXISTS idx_fellows_status ON fellows(status);


-- ============================================================
-- 3. EVENTS — Cohort meetings, workshops, and sessions
-- ============================================================

CREATE TABLE IF NOT EXISTS events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  site_id uuid NOT NULL REFERENCES sites(id) ON DELETE CASCADE,
  title text NOT NULL,
  description text,
  location text,
  meeting_link text,
  start_time timestamptz NOT NULL,
  end_time timestamptz,
  notes text,
  created_by uuid REFERENCES auth.users(id),
  created_at timestamptz DEFAULT now()
);

ALTER TABLE events ENABLE ROW LEVEL SECURITY;

-- Staff can read events
CREATE POLICY "events_select_team" ON events FOR SELECT
  USING (EXISTS (
    SELECT 1 FROM team_members
    WHERE team_members.user_id = auth.uid()
    AND team_members.is_active = true
  ));

-- Staff can manage events
CREATE POLICY "events_manage_team" ON events FOR INSERT
  WITH CHECK (EXISTS (
    SELECT 1 FROM team_members
    WHERE team_members.user_id = auth.uid()
    AND team_members.is_active = true
  ));

CREATE POLICY "events_update_team" ON events FOR UPDATE
  USING (EXISTS (
    SELECT 1 FROM team_members
    WHERE team_members.user_id = auth.uid()
    AND team_members.is_active = true
  ));

CREATE POLICY "events_delete_admin" ON events FOR DELETE
  USING (is_admin());

CREATE INDEX IF NOT EXISTS idx_events_site_id ON events(site_id);
CREATE INDEX IF NOT EXISTS idx_events_start_time ON events(start_time);


-- ============================================================
-- 4. EVENT_ATTENDANCE — Per-fellow attendance for each event
-- ============================================================

CREATE TABLE IF NOT EXISTS event_attendance (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  event_id uuid NOT NULL REFERENCES events(id) ON DELETE CASCADE,
  fellow_id text NOT NULL REFERENCES fellows(id) ON DELETE CASCADE,
  status text NOT NULL DEFAULT 'absent',  -- present, absent, excused, late
  notes text,
  recorded_by uuid REFERENCES auth.users(id),
  created_at timestamptz DEFAULT now(),
  UNIQUE(event_id, fellow_id)
);

ALTER TABLE event_attendance ENABLE ROW LEVEL SECURITY;

CREATE POLICY "attendance_select_team" ON event_attendance FOR SELECT
  USING (EXISTS (
    SELECT 1 FROM team_members
    WHERE team_members.user_id = auth.uid()
    AND team_members.is_active = true
  ));

CREATE POLICY "attendance_manage_team" ON event_attendance FOR INSERT
  WITH CHECK (EXISTS (
    SELECT 1 FROM team_members
    WHERE team_members.user_id = auth.uid()
    AND team_members.is_active = true
  ));

CREATE POLICY "attendance_update_team" ON event_attendance FOR UPDATE
  USING (EXISTS (
    SELECT 1 FROM team_members
    WHERE team_members.user_id = auth.uid()
    AND team_members.is_active = true
  ));

CREATE POLICY "attendance_delete_admin" ON event_attendance FOR DELETE
  USING (is_admin());

CREATE INDEX IF NOT EXISTS idx_attendance_event ON event_attendance(event_id);
CREATE INDEX IF NOT EXISTS idx_attendance_fellow ON event_attendance(fellow_id);


-- ============================================================
-- 5. CURRICULA — Curriculum definitions per site/year
-- ============================================================

CREATE TABLE IF NOT EXISTS curricula (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  site_id uuid NOT NULL REFERENCES sites(id) ON DELETE CASCADE,
  name text NOT NULL,
  year integer NOT NULL DEFAULT 2026,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE curricula ENABLE ROW LEVEL SECURITY;

CREATE POLICY "curricula_select_team" ON curricula FOR SELECT
  USING (EXISTS (
    SELECT 1 FROM team_members
    WHERE team_members.user_id = auth.uid()
    AND team_members.is_active = true
  ));

CREATE POLICY "curricula_manage_admin" ON curricula FOR ALL
  USING (is_admin());


-- ============================================================
-- 6. CURRICULUM_CHAPTERS — Chapters within a curriculum
-- ============================================================

CREATE TABLE IF NOT EXISTS curriculum_chapters (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  curriculum_id uuid NOT NULL REFERENCES curricula(id) ON DELETE CASCADE,
  title text NOT NULL,
  description text,
  order_num integer NOT NULL DEFAULT 0
);

ALTER TABLE curriculum_chapters ENABLE ROW LEVEL SECURITY;

CREATE POLICY "chapters_select_team" ON curriculum_chapters FOR SELECT
  USING (EXISTS (
    SELECT 1 FROM team_members
    WHERE team_members.user_id = auth.uid()
    AND team_members.is_active = true
  ));

CREATE POLICY "chapters_manage_admin" ON curriculum_chapters FOR ALL
  USING (is_admin());


-- ============================================================
-- 7. CURRICULUM_ITEMS — Pages, assignments, discussions
-- ============================================================

CREATE TABLE IF NOT EXISTS curriculum_items (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  chapter_id uuid NOT NULL REFERENCES curriculum_chapters(id) ON DELETE CASCADE,
  item_type text NOT NULL,  -- page, assignment, discussion
  title text NOT NULL,
  description text,
  due_date date,
  order_num integer NOT NULL DEFAULT 0
);

ALTER TABLE curriculum_items ENABLE ROW LEVEL SECURITY;

CREATE POLICY "items_select_team" ON curriculum_items FOR SELECT
  USING (EXISTS (
    SELECT 1 FROM team_members
    WHERE team_members.user_id = auth.uid()
    AND team_members.is_active = true
  ));

CREATE POLICY "items_manage_admin" ON curriculum_items FOR ALL
  USING (is_admin());

CREATE INDEX IF NOT EXISTS idx_curriculum_items_chapter ON curriculum_items(chapter_id);


-- ============================================================
-- 8. FELLOW_CURRICULUM_PROGRESS — Individual completion tracking
-- ============================================================

CREATE TABLE IF NOT EXISTS fellow_curriculum_progress (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  fellow_id text NOT NULL REFERENCES fellows(id) ON DELETE CASCADE,
  item_id uuid NOT NULL REFERENCES curriculum_items(id) ON DELETE CASCADE,
  completed boolean NOT NULL DEFAULT false,
  completed_at timestamptz,
  recorded_by uuid REFERENCES auth.users(id),
  UNIQUE(fellow_id, item_id)
);

ALTER TABLE fellow_curriculum_progress ENABLE ROW LEVEL SECURITY;

CREATE POLICY "progress_select_team" ON fellow_curriculum_progress FOR SELECT
  USING (EXISTS (
    SELECT 1 FROM team_members
    WHERE team_members.user_id = auth.uid()
    AND team_members.is_active = true
  ));

CREATE POLICY "progress_manage_team" ON fellow_curriculum_progress FOR INSERT
  WITH CHECK (EXISTS (
    SELECT 1 FROM team_members
    WHERE team_members.user_id = auth.uid()
    AND team_members.is_active = true
  ));

CREATE POLICY "progress_update_team" ON fellow_curriculum_progress FOR UPDATE
  USING (EXISTS (
    SELECT 1 FROM team_members
    WHERE team_members.user_id = auth.uid()
    AND team_members.is_active = true
  ));

CREATE INDEX IF NOT EXISTS idx_progress_fellow ON fellow_curriculum_progress(fellow_id);
CREATE INDEX IF NOT EXISTS idx_progress_item ON fellow_curriculum_progress(item_id);


-- ============================================================
-- 9. FELLOW_PLATFORM_ACTIVITY — GATHER platform login tracking
-- ============================================================

CREATE TABLE IF NOT EXISTS fellow_platform_activity (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  fellow_id text NOT NULL REFERENCES fellows(id) ON DELETE CASCADE,
  activity_date date NOT NULL DEFAULT CURRENT_DATE,
  login_count integer NOT NULL DEFAULT 1,
  created_at timestamptz DEFAULT now(),
  UNIQUE(fellow_id, activity_date)
);

ALTER TABLE fellow_platform_activity ENABLE ROW LEVEL SECURITY;

CREATE POLICY "platform_activity_select_team" ON fellow_platform_activity FOR SELECT
  USING (EXISTS (
    SELECT 1 FROM team_members
    WHERE team_members.user_id = auth.uid()
    AND team_members.is_active = true
  ));

CREATE POLICY "platform_activity_manage_team" ON fellow_platform_activity FOR INSERT
  WITH CHECK (EXISTS (
    SELECT 1 FROM team_members
    WHERE team_members.user_id = auth.uid()
    AND team_members.is_active = true
  ));

CREATE POLICY "platform_activity_update_team" ON fellow_platform_activity FOR UPDATE
  USING (EXISTS (
    SELECT 1 FROM team_members
    WHERE team_members.user_id = auth.uid()
    AND team_members.is_active = true
  ));

CREATE INDEX IF NOT EXISTS idx_platform_activity_fellow ON fellow_platform_activity(fellow_id);
CREATE INDEX IF NOT EXISTS idx_platform_activity_date ON fellow_platform_activity(activity_date);


-- ============================================================
-- 10. ADHOC_LISTS — Custom data collection lists per site
-- ============================================================

CREATE TABLE IF NOT EXISTS adhoc_lists (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  site_id uuid NOT NULL REFERENCES sites(id) ON DELETE CASCADE,
  name text NOT NULL,
  description text,
  fields jsonb NOT NULL DEFAULT '[]'::jsonb,
  created_by uuid REFERENCES auth.users(id),
  created_at timestamptz DEFAULT now()
);

ALTER TABLE adhoc_lists ENABLE ROW LEVEL SECURITY;

CREATE POLICY "adhoc_lists_select_team" ON adhoc_lists FOR SELECT
  USING (EXISTS (
    SELECT 1 FROM team_members
    WHERE team_members.user_id = auth.uid()
    AND team_members.is_active = true
  ));

CREATE POLICY "adhoc_lists_manage_team" ON adhoc_lists FOR INSERT
  WITH CHECK (EXISTS (
    SELECT 1 FROM team_members
    WHERE team_members.user_id = auth.uid()
    AND team_members.is_active = true
  ));

CREATE POLICY "adhoc_lists_update_team" ON adhoc_lists FOR UPDATE
  USING (EXISTS (
    SELECT 1 FROM team_members
    WHERE team_members.user_id = auth.uid()
    AND team_members.is_active = true
  ));

CREATE POLICY "adhoc_lists_delete_admin" ON adhoc_lists FOR DELETE
  USING (is_admin());

CREATE INDEX IF NOT EXISTS idx_adhoc_lists_site ON adhoc_lists(site_id);


-- ============================================================
-- 11. ADHOC_LIST_ENTRIES — Fellow data for each ad hoc list
-- ============================================================

CREATE TABLE IF NOT EXISTS adhoc_list_entries (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  list_id uuid NOT NULL REFERENCES adhoc_lists(id) ON DELETE CASCADE,
  fellow_id text NOT NULL REFERENCES fellows(id) ON DELETE CASCADE,
  data jsonb NOT NULL DEFAULT '{}'::jsonb,
  updated_by uuid REFERENCES auth.users(id),
  updated_at timestamptz DEFAULT now(),
  UNIQUE(list_id, fellow_id)
);

ALTER TABLE adhoc_list_entries ENABLE ROW LEVEL SECURITY;

CREATE POLICY "adhoc_entries_select_team" ON adhoc_list_entries FOR SELECT
  USING (EXISTS (
    SELECT 1 FROM team_members
    WHERE team_members.user_id = auth.uid()
    AND team_members.is_active = true
  ));

CREATE POLICY "adhoc_entries_manage_team" ON adhoc_list_entries FOR INSERT
  WITH CHECK (EXISTS (
    SELECT 1 FROM team_members
    WHERE team_members.user_id = auth.uid()
    AND team_members.is_active = true
  ));

CREATE POLICY "adhoc_entries_update_team" ON adhoc_list_entries FOR UPDATE
  USING (EXISTS (
    SELECT 1 FROM team_members
    WHERE team_members.user_id = auth.uid()
    AND team_members.is_active = true
  ));

CREATE POLICY "adhoc_entries_delete_team" ON adhoc_list_entries FOR DELETE
  USING (EXISTS (
    SELECT 1 FROM team_members
    WHERE team_members.user_id = auth.uid()
    AND team_members.is_active = true
  ));

CREATE INDEX IF NOT EXISTS idx_adhoc_entries_list ON adhoc_list_entries(list_id);
CREATE INDEX IF NOT EXISTS idx_adhoc_entries_fellow ON adhoc_list_entries(fellow_id);


-- ============================================================
-- DONE
-- ============================================================
-- After running this migration:
-- 1. Verify tables created: SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' ORDER BY table_name;
-- 2. Add current fellows to fellows table with status = 'Current' and appropriate site_id
-- 3. The UI in index.html will use these tables for cohort management
