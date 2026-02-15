-- =============================================
-- GATHER v2 — Foundation Migration
-- =============================================
-- Run this in the Supabase SQL Editor for project: Gather-V2
-- https://supabase.com/dashboard/project/ollexkvipnkkyzejmahh
--
-- This creates the complete v2 schema from scratch:
--   1. Tables (no RLS yet)
--   2. Helper functions (SECURITY DEFINER)
--   3. Triggers
--   4. RLS policies on every table
--   5. Indexes
--
-- Total: 27 tables, 4 helper functions, 1 trigger

-- =============================================
-- 1. TABLES
-- =============================================

-- ----- CORE -----

CREATE TABLE contacts (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  legacy_id text,                          -- v1 ID ('P001', 'CF-CHI-001') for migration

  -- identity
  first_name text NOT NULL,
  last_name text NOT NULL,
  email text,
  work_email text,
  alternate_emails text[] DEFAULT '{}',
  phone text,
  birthday date,
  gender text,
  hide_birthday_year boolean DEFAULT false,
  photo_url text,
  biography text,
  languages text,

  -- location
  city text,
  country text,
  region text,
  sub_region text,
  community_area text,                     -- Chicago neighborhood (CPF fellows)

  -- professional
  organization text,
  job_title text,

  -- program (for fellows / alumni)
  program text,                            -- CPF/GGF/ESP/DAR/MOS
  cohort text,                             -- year or identifier
  status text DEFAULT 'Alumni',            -- Alumni, Current, Staff, etc.

  -- social (personal)
  linkedin text,
  twitter text,
  instagram text,
  facebook text,
  website text,
  tiktok text,

  -- social (organization)
  linkedin_org text,
  twitter_org text,
  instagram_org text,
  facebook_org text,
  website_org text,

  -- CRM
  working_on text,
  working_on_updated_at timestamptz,
  last_contact timestamptz,
  last_news_search timestamptz,
  staff_notes text,

  -- legacy focus areas (free text from v1, tags system replaces these)
  focus_area_1 text,
  focus_area_2 text,
  focus_area_3 text,

  -- from v1 team_members (for staff who are also fellows)
  fellowships jsonb,                       -- [{program, year}]
  is_active boolean DEFAULT true,

  -- auth
  user_id uuid REFERENCES auth.users(id),

  -- meta
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

CREATE TABLE contact_roles (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  contact_id uuid NOT NULL REFERENCES contacts(id) ON DELETE CASCADE,
  role text NOT NULL CHECK (role IN ('super_admin', 'admin', 'manager', 'team', 'fellow', 'viewer')),
  granted_by uuid REFERENCES auth.users(id),
  created_at timestamptz DEFAULT now(),
  UNIQUE(contact_id, role)
);


-- ----- COHORTS -----

CREATE TABLE cohorts (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,                      -- "Chicago Peace Fellows 2026"
  program text NOT NULL,                   -- CPF/DAR/MOS
  city text,
  country text,
  cohort_year integer NOT NULL DEFAULT 2026,
  status text NOT NULL DEFAULT 'live' CHECK (status IN ('live', 'archived')),
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

CREATE TABLE cohort_members (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  contact_id uuid NOT NULL REFERENCES contacts(id) ON DELETE CASCADE,
  cohort_id uuid NOT NULL REFERENCES cohorts(id) ON DELETE CASCADE,
  role text NOT NULL DEFAULT 'fellow',     -- fellow, facilitator, mentor, coordinator
  joined_at timestamptz DEFAULT now(),
  created_at timestamptz DEFAULT now(),
  UNIQUE(contact_id, cohort_id)
);

CREATE TABLE cohort_permissions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  contact_id uuid NOT NULL REFERENCES contacts(id) ON DELETE CASCADE,
  cohort_id uuid NOT NULL REFERENCES cohorts(id) ON DELETE CASCADE,
  access_level text NOT NULL DEFAULT 'none' CHECK (access_level IN ('edit', 'view', 'none')),
  granted_by uuid REFERENCES auth.users(id),
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  UNIQUE(contact_id, cohort_id)
);


-- ----- CRM -----

CREATE TABLE interactions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  contact_id uuid NOT NULL REFERENCES contacts(id) ON DELETE CASCADE,
  interaction_type text NOT NULL,          -- Call, Email, Meeting, Text, Note, Event, News Mention
  interaction_date date NOT NULL DEFAULT CURRENT_DATE,
  title text,
  notes text,
  logged_by uuid REFERENCES auth.users(id),
  created_at timestamptz DEFAULT now()
);

CREATE TABLE activities (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  contact_id uuid NOT NULL REFERENCES contacts(id) ON DELETE CASCADE,
  activity_type text NOT NULL,             -- news_mention, linkedin_mention, twitter_mention, etc.
  source_name text,
  source_url text,
  source_domain text,
  title text,
  snippet text,
  image_url text,
  published_at timestamptz,
  discovered_at timestamptz DEFAULT now(),
  search_query text,
  relevance_score decimal,
  verified boolean DEFAULT false,
  dismissed boolean DEFAULT false,
  notified boolean DEFAULT false,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  UNIQUE(contact_id, source_url)
);


-- ----- FOCUS AREAS -----

CREATE TABLE focus_categories (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,                      -- Skills, Populations Served, Focus Areas, Community Areas
  slug text UNIQUE NOT NULL,
  display_order integer DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

CREATE TABLE focus_tags (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  category_id uuid NOT NULL REFERENCES focus_categories(id) ON DELETE CASCADE,
  name text NOT NULL,
  slug text NOT NULL,
  emoji text,
  approved boolean DEFAULT true,
  created_at timestamptz DEFAULT now(),
  UNIQUE(category_id, slug)
);

CREATE TABLE contact_focus_tags (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  contact_id uuid NOT NULL REFERENCES contacts(id) ON DELETE CASCADE,
  tag_id uuid NOT NULL REFERENCES focus_tags(id) ON DELETE CASCADE,
  is_primary boolean DEFAULT false,        -- for Community Areas: primary vs secondary
  created_at timestamptz DEFAULT now(),
  UNIQUE(contact_id, tag_id)
);


-- ----- EVENTS & ATTENDANCE -----

CREATE TABLE events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  cohort_id uuid NOT NULL REFERENCES cohorts(id) ON DELETE CASCADE,
  title text NOT NULL,
  description text,
  location text,
  meeting_link text,
  start_time timestamptz,
  end_time timestamptz,
  notes text,                              -- internal staff notes
  facilitator text,
  event_type text DEFAULT 'workshop',      -- workshop, social, orientation, field_trip, guest_speaker, other
  is_required boolean DEFAULT true,
  created_by uuid REFERENCES auth.users(id),
  created_at timestamptz DEFAULT now()
);

CREATE TABLE event_attendance (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  event_id uuid NOT NULL REFERENCES events(id) ON DELETE CASCADE,
  contact_id uuid NOT NULL REFERENCES contacts(id) ON DELETE CASCADE,
  status text NOT NULL CHECK (status IN ('present', 'absent', 'excused', 'late')),
  notes text,
  recorded_by uuid REFERENCES auth.users(id),
  created_at timestamptz DEFAULT now(),
  UNIQUE(event_id, contact_id)
);


-- ----- CURRICULUM -----

CREATE TABLE curricula (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  cohort_id uuid NOT NULL REFERENCES cohorts(id) ON DELETE CASCADE,
  name text NOT NULL,
  year integer,
  created_at timestamptz DEFAULT now()
);

CREATE TABLE curriculum_chapters (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  curriculum_id uuid NOT NULL REFERENCES curricula(id) ON DELETE CASCADE,
  title text NOT NULL,
  description text,
  order_num integer DEFAULT 0
);

CREATE TABLE curriculum_items (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  chapter_id uuid NOT NULL REFERENCES curriculum_chapters(id) ON DELETE CASCADE,
  item_type text NOT NULL CHECK (item_type IN ('page', 'assignment', 'discussion')),
  title text NOT NULL,
  description text,
  due_date date,
  order_num integer DEFAULT 0
);

CREATE TABLE contact_curriculum_progress (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  contact_id uuid NOT NULL REFERENCES contacts(id) ON DELETE CASCADE,
  item_id uuid NOT NULL REFERENCES curriculum_items(id) ON DELETE CASCADE,
  completed boolean DEFAULT false,
  completed_at timestamptz,
  recorded_by uuid REFERENCES auth.users(id),
  UNIQUE(contact_id, item_id)
);

CREATE TABLE contact_chapter_notes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  contact_id uuid NOT NULL REFERENCES contacts(id) ON DELETE CASCADE,
  chapter_id uuid NOT NULL REFERENCES curriculum_chapters(id) ON DELETE CASCADE,
  notes text,
  updated_by uuid REFERENCES auth.users(id),
  updated_at timestamptz DEFAULT now(),
  UNIQUE(contact_id, chapter_id)
);

CREATE TABLE contact_platform_activity (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  contact_id uuid NOT NULL REFERENCES contacts(id) ON DELETE CASCADE,
  activity_date date NOT NULL,
  login_count integer DEFAULT 1,
  created_at timestamptz DEFAULT now(),
  UNIQUE(contact_id, activity_date)
);


-- ----- AD HOC LISTS -----

CREATE TABLE adhoc_lists (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  cohort_id uuid NOT NULL REFERENCES cohorts(id) ON DELETE CASCADE,
  name text NOT NULL,
  description text,
  fields jsonb NOT NULL DEFAULT '[]',      -- [{key, label, type, options}]
  created_by uuid REFERENCES auth.users(id),
  created_at timestamptz DEFAULT now()
);

CREATE TABLE adhoc_list_entries (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  list_id uuid NOT NULL REFERENCES adhoc_lists(id) ON DELETE CASCADE,
  contact_id uuid NOT NULL REFERENCES contacts(id) ON DELETE CASCADE,
  data jsonb DEFAULT '{}',
  updated_by uuid REFERENCES auth.users(id),
  updated_at timestamptz DEFAULT now(),
  UNIQUE(list_id, contact_id)
);


-- ----- COMMUNITY -----

CREATE TABLE announcements (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  content text,
  author_id uuid REFERENCES auth.users(id),
  target_programs text[] DEFAULT '{}',     -- empty = all programs
  is_pinned boolean DEFAULT false,
  published_at timestamptz,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

CREATE TABLE resources (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  description text,
  url text,
  category text DEFAULT 'link',            -- document, link, video, template
  target_programs text[] DEFAULT '{}',
  uploaded_by uuid REFERENCES auth.users(id),
  created_at timestamptz DEFAULT now()
);


-- ----- SYSTEM -----

CREATE TABLE app_settings (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  key text UNIQUE NOT NULL,
  value jsonb NOT NULL DEFAULT '{}',
  updated_at timestamptz DEFAULT now(),
  updated_by uuid REFERENCES auth.users(id)
);

CREATE TABLE login_events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users(id),
  email text,
  method text DEFAULT 'otp',
  created_at timestamptz DEFAULT now()
);

CREATE TABLE content_translations (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  source_hash text NOT NULL,
  source_text text NOT NULL,
  target_lang text NOT NULL,
  translated_text text NOT NULL,
  created_at timestamptz DEFAULT now(),
  UNIQUE(source_hash, target_lang)
);

CREATE TABLE app_errors (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users(id),
  error_type text,                         -- js_error, api_error, auth_error
  message text,
  stack text,
  metadata jsonb DEFAULT '{}',             -- page, component, browser, etc.
  created_at timestamptz DEFAULT now()
);

CREATE TABLE profile_claim_requests (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  requesting_email text NOT NULL,
  requesting_user_id uuid REFERENCES auth.users(id),
  target_contact_id uuid REFERENCES contacts(id),
  status text NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected')),
  reviewed_by uuid REFERENCES auth.users(id),
  reviewed_at timestamptz,
  notes text,
  created_at timestamptz DEFAULT now()
);


-- =============================================
-- 2. HELPER FUNCTIONS (SECURITY DEFINER)
-- =============================================
-- These bypass RLS to avoid infinite recursion when
-- RLS policies need to check the current user's role.

CREATE OR REPLACE FUNCTION current_contact_id()
RETURNS uuid
LANGUAGE sql
SECURITY DEFINER
STABLE
AS $$
  SELECT id FROM public.contacts WHERE user_id = auth.uid() LIMIT 1;
$$;

CREATE OR REPLACE FUNCTION is_admin()
RETURNS boolean
LANGUAGE sql
SECURITY DEFINER
STABLE
AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.contact_roles cr
    JOIN public.contacts c ON cr.contact_id = c.id
    WHERE c.user_id = auth.uid()
    AND cr.role IN ('super_admin', 'admin')
  );
$$;

CREATE OR REPLACE FUNCTION is_team_member()
RETURNS boolean
LANGUAGE sql
SECURITY DEFINER
STABLE
AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.contact_roles cr
    JOIN public.contacts c ON cr.contact_id = c.id
    WHERE c.user_id = auth.uid()
    AND cr.role IN ('super_admin', 'admin', 'manager', 'team')
  );
$$;

CREATE OR REPLACE FUNCTION has_cohort_access(p_cohort_id uuid, p_min_level text DEFAULT 'view')
RETURNS boolean
LANGUAGE sql
SECURITY DEFINER
STABLE
AS $$
  SELECT
    CASE
      WHEN is_admin() THEN true
      WHEN p_min_level = 'view' THEN EXISTS (
        SELECT 1 FROM public.cohort_permissions cp
        WHERE cp.contact_id = current_contact_id()
        AND cp.cohort_id = p_cohort_id
        AND cp.access_level IN ('view', 'edit')
      )
      WHEN p_min_level = 'edit' THEN EXISTS (
        SELECT 1 FROM public.cohort_permissions cp
        WHERE cp.contact_id = current_contact_id()
        AND cp.cohort_id = p_cohort_id
        AND cp.access_level = 'edit'
      )
      ELSE false
    END;
$$;


-- =============================================
-- 3. TRIGGERS
-- =============================================

-- Auto-link contacts to auth.users on signup/login
CREATE OR REPLACE FUNCTION link_contact_on_auth()
RETURNS TRIGGER AS $$
BEGIN
  UPDATE public.contacts
  SET user_id = NEW.id, updated_at = now()
  WHERE user_id IS NULL
  AND (
    LOWER(email) = LOWER(NEW.email)
    OR LOWER(NEW.email) = ANY(
      SELECT LOWER(e) FROM unnest(alternate_emails) AS e
    )
  );
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION link_contact_on_auth();

-- Auto-update updated_at on contacts
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER contacts_updated_at
  BEFORE UPDATE ON contacts
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();

CREATE TRIGGER cohorts_updated_at
  BEFORE UPDATE ON cohorts
  FOR EACH ROW EXECUTE FUNCTION update_updated_at();


-- =============================================
-- 4. ROW LEVEL SECURITY
-- =============================================
-- Every table gets RLS enabled. No exceptions.

-- ----- contacts -----
ALTER TABLE contacts ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public can view active contacts"
  ON contacts FOR SELECT
  USING (is_active = true);

CREATE POLICY "Users can update own profile"
  ON contacts FOR UPDATE
  USING (user_id = auth.uid())
  WITH CHECK (user_id = auth.uid());

CREATE POLICY "Admins can manage all contacts"
  ON contacts FOR ALL
  USING (is_admin())
  WITH CHECK (is_admin());

-- ----- contact_roles -----
ALTER TABLE contact_roles ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Team members can view all roles"
  ON contact_roles FOR SELECT
  USING (is_team_member());

CREATE POLICY "Admins can manage roles"
  ON contact_roles FOR ALL
  USING (is_admin())
  WITH CHECK (is_admin());

-- ----- cohorts -----
ALTER TABLE cohorts ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Team members can view cohorts"
  ON cohorts FOR SELECT
  USING (is_team_member());

CREATE POLICY "Admins can manage cohorts"
  ON cohorts FOR ALL
  USING (is_admin())
  WITH CHECK (is_admin());

-- ----- cohort_members -----
ALTER TABLE cohort_members ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Team members can view cohort members"
  ON cohort_members FOR SELECT
  USING (is_team_member());

CREATE POLICY "Team with edit access can manage cohort members"
  ON cohort_members FOR ALL
  USING (has_cohort_access(cohort_id, 'edit'))
  WITH CHECK (has_cohort_access(cohort_id, 'edit'));

-- ----- cohort_permissions -----
ALTER TABLE cohort_permissions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own permissions"
  ON cohort_permissions FOR SELECT
  USING (contact_id = current_contact_id());

CREATE POLICY "Admins can view all permissions"
  ON cohort_permissions FOR SELECT
  USING (is_admin());

CREATE POLICY "Admins can manage permissions"
  ON cohort_permissions FOR ALL
  USING (is_admin())
  WITH CHECK (is_admin());

-- ----- interactions -----
ALTER TABLE interactions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Team members can view all interactions"
  ON interactions FOR SELECT
  USING (is_team_member());

CREATE POLICY "Team members can create interactions"
  ON interactions FOR INSERT
  WITH CHECK (is_team_member());

CREATE POLICY "Users can update own interactions"
  ON interactions FOR UPDATE
  USING (logged_by = auth.uid());

CREATE POLICY "Admins can manage all interactions"
  ON interactions FOR DELETE
  USING (is_admin());

-- ----- activities -----
ALTER TABLE activities ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view non-dismissed activities"
  ON activities FOR SELECT
  USING (verified = true OR dismissed = false);

CREATE POLICY "Team members can manage activities"
  ON activities FOR ALL
  USING (is_team_member())
  WITH CHECK (is_team_member());

-- ----- focus_categories -----
ALTER TABLE focus_categories ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view focus categories"
  ON focus_categories FOR SELECT
  USING (true);

CREATE POLICY "Admins can manage focus categories"
  ON focus_categories FOR ALL
  USING (is_admin())
  WITH CHECK (is_admin());

-- ----- focus_tags -----
ALTER TABLE focus_tags ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view approved tags"
  ON focus_tags FOR SELECT
  USING (approved = true);

CREATE POLICY "Admins can view all tags"
  ON focus_tags FOR SELECT
  USING (is_admin());

CREATE POLICY "Admins can manage tags"
  ON focus_tags FOR ALL
  USING (is_admin())
  WITH CHECK (is_admin());

-- ----- contact_focus_tags -----
ALTER TABLE contact_focus_tags ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view contact tags"
  ON contact_focus_tags FOR SELECT
  USING (true);

CREATE POLICY "Team members can manage contact tags"
  ON contact_focus_tags FOR ALL
  USING (is_team_member())
  WITH CHECK (is_team_member());

-- ----- events -----
ALTER TABLE events ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Team members can view events"
  ON events FOR SELECT
  USING (is_team_member());

CREATE POLICY "Team with edit access can manage events"
  ON events FOR ALL
  USING (has_cohort_access(cohort_id, 'edit'))
  WITH CHECK (has_cohort_access(cohort_id, 'edit'));

-- ----- event_attendance -----
ALTER TABLE event_attendance ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Team members can view attendance"
  ON event_attendance FOR SELECT
  USING (is_team_member());

CREATE POLICY "Team with edit access can manage attendance"
  ON event_attendance FOR INSERT
  WITH CHECK (is_team_member());

CREATE POLICY "Team with edit access can update attendance"
  ON event_attendance FOR UPDATE
  USING (is_team_member());

CREATE POLICY "Admins can delete attendance"
  ON event_attendance FOR DELETE
  USING (is_admin());

-- ----- curricula -----
ALTER TABLE curricula ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Team members can view curricula"
  ON curricula FOR SELECT
  USING (is_team_member());

CREATE POLICY "Team with edit access can manage curricula"
  ON curricula FOR ALL
  USING (has_cohort_access(cohort_id, 'edit'))
  WITH CHECK (has_cohort_access(cohort_id, 'edit'));

-- ----- curriculum_chapters -----
ALTER TABLE curriculum_chapters ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Team members can view chapters"
  ON curriculum_chapters FOR SELECT
  USING (is_team_member());

CREATE POLICY "Admins can manage chapters"
  ON curriculum_chapters FOR ALL
  USING (is_admin())
  WITH CHECK (is_admin());

-- ----- curriculum_items -----
ALTER TABLE curriculum_items ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Team members can view items"
  ON curriculum_items FOR SELECT
  USING (is_team_member());

CREATE POLICY "Admins can manage items"
  ON curriculum_items FOR ALL
  USING (is_admin())
  WITH CHECK (is_admin());

-- ----- contact_curriculum_progress -----
ALTER TABLE contact_curriculum_progress ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Team members can view progress"
  ON contact_curriculum_progress FOR SELECT
  USING (is_team_member());

CREATE POLICY "Team members can manage progress"
  ON contact_curriculum_progress FOR ALL
  USING (is_team_member())
  WITH CHECK (is_team_member());

-- ----- contact_chapter_notes -----
ALTER TABLE contact_chapter_notes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Team members can view chapter notes"
  ON contact_chapter_notes FOR SELECT
  USING (is_team_member());

CREATE POLICY "Team members can manage chapter notes"
  ON contact_chapter_notes FOR ALL
  USING (is_team_member())
  WITH CHECK (is_team_member());

-- ----- contact_platform_activity -----
ALTER TABLE contact_platform_activity ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Team members can view platform activity"
  ON contact_platform_activity FOR SELECT
  USING (is_team_member());

CREATE POLICY "Team members can manage platform activity"
  ON contact_platform_activity FOR ALL
  USING (is_team_member())
  WITH CHECK (is_team_member());

-- ----- adhoc_lists -----
ALTER TABLE adhoc_lists ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Team members can view lists"
  ON adhoc_lists FOR SELECT
  USING (is_team_member());

CREATE POLICY "Team with edit access can manage lists"
  ON adhoc_lists FOR ALL
  USING (has_cohort_access(cohort_id, 'edit'))
  WITH CHECK (has_cohort_access(cohort_id, 'edit'));

-- ----- adhoc_list_entries -----
ALTER TABLE adhoc_list_entries ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Team members can view list entries"
  ON adhoc_list_entries FOR SELECT
  USING (is_team_member());

CREATE POLICY "Team members can manage list entries"
  ON adhoc_list_entries FOR ALL
  USING (is_team_member())
  WITH CHECK (is_team_member());

-- ----- announcements -----
ALTER TABLE announcements ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view published announcements"
  ON announcements FOR SELECT
  USING (published_at IS NOT NULL AND published_at <= now());

CREATE POLICY "Team members can manage announcements"
  ON announcements FOR ALL
  USING (is_team_member())
  WITH CHECK (is_team_member());

-- ----- resources -----
ALTER TABLE resources ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view resources"
  ON resources FOR SELECT
  USING (true);

CREATE POLICY "Team members can manage resources"
  ON resources FOR ALL
  USING (is_team_member())
  WITH CHECK (is_team_member());

-- ----- app_settings -----
ALTER TABLE app_settings ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Authenticated users can view settings"
  ON app_settings FOR SELECT
  USING (auth.uid() IS NOT NULL);

CREATE POLICY "Admins can manage settings"
  ON app_settings FOR ALL
  USING (is_admin())
  WITH CHECK (is_admin());

-- ----- login_events -----
ALTER TABLE login_events ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Team members can view login events"
  ON login_events FOR SELECT
  USING (is_team_member());

CREATE POLICY "Authenticated users can insert own login events"
  ON login_events FOR INSERT
  WITH CHECK (auth.uid() = user_id);

-- ----- content_translations -----
ALTER TABLE content_translations ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read translations"
  ON content_translations FOR SELECT
  USING (true);

CREATE POLICY "Anyone can insert translations"
  ON content_translations FOR INSERT
  WITH CHECK (true);

-- ----- app_errors -----
ALTER TABLE app_errors ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Authenticated users can report errors"
  ON app_errors FOR INSERT
  WITH CHECK (auth.uid() IS NOT NULL);

CREATE POLICY "Admins can view errors"
  ON app_errors FOR SELECT
  USING (is_admin());

-- ----- profile_claim_requests -----
ALTER TABLE profile_claim_requests ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view own claims"
  ON profile_claim_requests FOR SELECT
  USING (requesting_user_id = auth.uid());

CREATE POLICY "Users can create own claims"
  ON profile_claim_requests FOR INSERT
  WITH CHECK (requesting_user_id = auth.uid());

CREATE POLICY "Admins can manage all claims"
  ON profile_claim_requests FOR ALL
  USING (is_admin())
  WITH CHECK (is_admin());


-- =============================================
-- 5. INDEXES
-- =============================================

-- contacts
CREATE INDEX idx_contacts_email ON contacts(LOWER(email));
CREATE INDEX idx_contacts_user_id ON contacts(user_id);
CREATE INDEX idx_contacts_program ON contacts(program);
CREATE INDEX idx_contacts_status ON contacts(status);
CREATE INDEX idx_contacts_legacy_id ON contacts(legacy_id);
CREATE INDEX idx_contacts_alternate_emails ON contacts USING GIN(alternate_emails);

-- contact_roles
CREATE INDEX idx_contact_roles_contact ON contact_roles(contact_id);
CREATE INDEX idx_contact_roles_role ON contact_roles(role);

-- cohorts
CREATE INDEX idx_cohorts_status ON cohorts(status);
CREATE INDEX idx_cohorts_program ON cohorts(program);

-- cohort_members
CREATE INDEX idx_cohort_members_contact ON cohort_members(contact_id);
CREATE INDEX idx_cohort_members_cohort ON cohort_members(cohort_id);

-- interactions
CREATE INDEX idx_interactions_contact ON interactions(contact_id);
CREATE INDEX idx_interactions_date ON interactions(interaction_date DESC);

-- activities
CREATE INDEX idx_activities_contact ON activities(contact_id);
CREATE INDEX idx_activities_discovered ON activities(discovered_at DESC);
CREATE INDEX idx_activities_type ON activities(activity_type);
CREATE INDEX idx_activities_verified ON activities(verified) WHERE verified = true;

-- focus
CREATE INDEX idx_focus_tags_category ON focus_tags(category_id);
CREATE INDEX idx_contact_focus_tags_contact ON contact_focus_tags(contact_id);
CREATE INDEX idx_contact_focus_tags_tag ON contact_focus_tags(tag_id);

-- events
CREATE INDEX idx_events_cohort ON events(cohort_id);
CREATE INDEX idx_events_start ON events(start_time);

-- attendance
CREATE INDEX idx_attendance_event ON event_attendance(event_id);
CREATE INDEX idx_attendance_contact ON event_attendance(contact_id);

-- curriculum
CREATE INDEX idx_curricula_cohort ON curricula(cohort_id);
CREATE INDEX idx_progress_contact ON contact_curriculum_progress(contact_id);
CREATE INDEX idx_progress_item ON contact_curriculum_progress(item_id);

-- platform activity
CREATE INDEX idx_platform_activity_contact ON contact_platform_activity(contact_id);

-- translations
CREATE INDEX idx_translations_lookup ON content_translations(source_hash, target_lang);

-- app errors
CREATE INDEX idx_app_errors_created ON app_errors(created_at DESC);


-- =============================================
-- 6. SEED DATA
-- =============================================

-- Focus categories (same as v1)
INSERT INTO focus_categories (name, slug, display_order) VALUES
  ('Skills', 'skills', 1),
  ('Populations Served', 'populations', 2),
  ('Focus Areas', 'focus-areas', 3),
  ('Community Areas', 'community-areas', 4);

-- Default cohort preferences
INSERT INTO app_settings (key, value) VALUES
  ('cohort_preferences', '{
    "attendance_green_min": 80,
    "attendance_yellow_min": 50,
    "login_green_max_days": 5,
    "login_yellow_max_days": 12,
    "weight_attendance": 30,
    "weight_login_recency": 20,
    "weight_curriculum": 25,
    "weight_tasks": 15,
    "weight_interactions": 10,
    "engagement_green_min": 80,
    "engagement_yellow_min": 50
  }'::jsonb);

-- Seed cohort sites for 2026
INSERT INTO cohorts (name, program, city, country, cohort_year, status) VALUES
  ('Chicago Peace Fellows 2026', 'CPF', 'Chicago', 'USA', 2026, 'live'),
  ('Dar es Salaam Fellows 2026', 'DAR', 'Dar es Salaam', 'Tanzania', 2026, 'live'),
  ('Mosquera Fellows 2026', 'MOS', 'Mosquera', 'Colombia', 2026, 'live');


-- =============================================
-- DONE
-- =============================================
-- Next: Run this SQL in the Supabase SQL Editor
-- Then: Set up auth (Email OTP) in Authentication settings
-- Then: Create 'photos' storage bucket (public)
