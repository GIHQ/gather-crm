-- =============================================
-- GATHER v2 — Event Planning Migration
-- =============================================
-- Adds the event_planning table for pre-event checklists.
-- Each event can have multiple planning items (checklist tasks)
-- that staff toggle as they prepare for the event.
--
-- Run in Supabase SQL Editor after 001_foundation.sql

-- ----- TABLE -----

CREATE TABLE event_planning (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  event_id uuid NOT NULL REFERENCES events(id) ON DELETE CASCADE,
  item_text text NOT NULL,
  completed boolean DEFAULT false,
  completed_by uuid REFERENCES auth.users(id),
  completed_at timestamptz,
  assigned_to text,                          -- free text name (not FK, lightweight)
  notes text,
  due_date date,
  sort_order integer DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

-- ----- RLS -----

ALTER TABLE event_planning ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Team members can view event planning"
  ON event_planning FOR SELECT
  USING (is_team_member());

CREATE POLICY "Team members can create planning items"
  ON event_planning FOR INSERT
  WITH CHECK (is_team_member());

CREATE POLICY "Team members can update planning items"
  ON event_planning FOR UPDATE
  USING (is_team_member());

CREATE POLICY "Admins can delete planning items"
  ON event_planning FOR DELETE
  USING (is_admin());

-- ----- INDEXES -----

CREATE INDEX idx_event_planning_event ON event_planning(event_id);
CREATE INDEX idx_event_planning_sort ON event_planning(event_id, sort_order);

-- ----- SEED DEFAULT TEMPLATE -----
-- Store default checklist template in app_settings so it auto-populates new events.

INSERT INTO app_settings (key, value)
VALUES ('event_planning_template', '[
  {"item_text": "Venue secured", "sort_order": 1},
  {"item_text": "Food/catering arranged", "sort_order": 2},
  {"item_text": "Agenda drafted and shared", "sort_order": 3},
  {"item_text": "Speakers/facilitators confirmed", "sort_order": 4},
  {"item_text": "Room setup notes (AV, seating, materials)", "sort_order": 5},
  {"item_text": "Documentation plan (notes, photography)", "sort_order": 6}
]'::jsonb)
ON CONFLICT (key) DO UPDATE SET value = EXCLUDED.value, updated_at = now();
