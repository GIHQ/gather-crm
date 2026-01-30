-- Migration: Create user_roles table for permission system
-- Run in Supabase SQL Editor

-- Enable UUID extension if not already enabled
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create user_roles table
CREATE TABLE IF NOT EXISTS user_roles (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  email text UNIQUE NOT NULL,
  role text NOT NULL DEFAULT 'viewer'
    CHECK (role IN ('super_admin', 'admin', 'manager', 'team', 'fellow', 'viewer')),
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Create index for email lookups (case-insensitive)
CREATE INDEX IF NOT EXISTS idx_user_roles_email_lower ON user_roles (lower(email));

-- Create index for role filtering
CREATE INDEX IF NOT EXISTS idx_user_roles_role ON user_roles (role);

-- Create updated_at trigger function if it doesn't exist
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ language 'plpgsql';

-- Add trigger to auto-update updated_at
DROP TRIGGER IF EXISTS update_user_roles_updated_at ON user_roles;
CREATE TRIGGER update_user_roles_updated_at
  BEFORE UPDATE ON user_roles
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- Enable Row Level Security
ALTER TABLE user_roles ENABLE ROW LEVEL SECURITY;

-- RLS Policies

-- Allow authenticated users to read their own role
CREATE POLICY "Users can read own role" ON user_roles
  FOR SELECT
  USING (auth.jwt() ->> 'email' = email);

-- Allow super_admin and admin to read all roles
CREATE POLICY "Admins can read all roles" ON user_roles
  FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM user_roles ur
      WHERE ur.email = auth.jwt() ->> 'email'
      AND ur.role IN ('super_admin', 'admin')
    )
  );

-- Allow super_admin to manage all roles
CREATE POLICY "Super admin can manage all roles" ON user_roles
  FOR ALL
  USING (
    EXISTS (
      SELECT 1 FROM user_roles ur
      WHERE ur.email = auth.jwt() ->> 'email'
      AND ur.role = 'super_admin'
    )
  );

-- Allow admin to manage non-super_admin roles
CREATE POLICY "Admin can manage non-super_admin roles" ON user_roles
  FOR INSERT
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM user_roles ur
      WHERE ur.email = auth.jwt() ->> 'email'
      AND ur.role = 'admin'
    )
    AND role != 'super_admin'
  );

CREATE POLICY "Admin can update non-super_admin roles" ON user_roles
  FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM user_roles ur
      WHERE ur.email = auth.jwt() ->> 'email'
      AND ur.role = 'admin'
    )
    AND role != 'super_admin'
  );

-- Seed initial admin users
INSERT INTO user_roles (email, role) VALUES
  ('travis@goldininstitute.org', 'super_admin')
ON CONFLICT (email) DO UPDATE SET role = EXCLUDED.role;

-- Add comment for documentation
COMMENT ON TABLE user_roles IS 'User permission roles: super_admin, admin, manager, team, fellow, viewer';
