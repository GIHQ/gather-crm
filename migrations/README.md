# GATHER CRM Database Migrations

## Overview

These migrations create the new database tables for:
1. **Permission System** - 6-tier role system (user_roles)
2. **Focus Areas Redesign** - Categories, tags, and fellow-tag relationships

## Migration Files

Run these in the Supabase SQL Editor in order:

| File | Description |
|------|-------------|
| `001_user_roles.sql` | Permission system with 6 roles |
| `002_focus_categories.sql` | Focus area categories (Skills, Populations, etc.) |
| `003_focus_tags.sql` | Tags within each category |
| `004_chicago_community_areas.sql` | 77 Chicago community areas for CPF |
| `005_fellow_focus_tags.sql` | Junction table linking fellows to tags |
| `006_views_and_helpers.sql` | Useful views and functions |
| `007_activities_table.sql` | News/activities tracking table |
| `008_team_members.sql` | Team members table with alternate_emails |
| `009_profile_claims.sql` | Profile claim requests for identity matching |
| `010_community_tables.sql` | Announcements, resources, newsletter_sends, stream_tokens |
| `011_team_import.sql` | Import of 11 staff members |
| `012_app_settings.sql` | App settings key-value table |
| `013_fix_security_definer_views_and_rls.sql` | Fix security definer views + enable RLS on activities |
| `014_auto_link_team_members.sql` | **Auto-link team_members/fellows to auth.users on signup** |

## How to Run

### Option 1: Run each file individually (Recommended)
1. Go to Supabase Dashboard → SQL Editor
2. Copy and paste each file in order (001 → 006)
3. Click "Run" after each one

### Option 2: Combine all migrations
1. Copy the contents of each file (001-006) into one query
2. Run as a single transaction

## New Tables

### `user_roles`
- Stores explicit role assignments for users
- Roles: `super_admin`, `admin`, `manager`, `team`, `fellow`, `viewer`
- Default seed: travis@goldininstitute.org (super_admin)

### `focus_categories`
- 4 categories: Skills, Populations Served, Focus Areas, Community Areas
- Each has `applicable_programs` array (CPF, GGF, ESP)
- Community Areas only applies to CPF

### `focus_tags`
- Individual tags within categories
- Support for user-created tags (pending approval)
- Usage count tracking

### `fellow_focus_tags`
- Links fellows to their tags
- `is_primary` flag for community areas (one primary per fellow)

## Helper Functions

### `get_user_role(email)`
Determines a user's effective role:
1. Check `user_roles` table for explicit assignment
2. Check `fellows` table - assign 'fellow' if found
3. Check email domain - assign 'team' for @goldininstitute.org
4. Default to 'viewer'

### `get_fellow_tags(fellow_id)`
Returns all tags for a fellow, organized by category.

### `search_fellows_by_tags(tag_ids[])`
Find fellows matching specific tags.

## Rollback

If you need to start fresh, run `rollback.sql` to drop all new tables and functions.

**WARNING**: Rollback will delete all data in these tables!

## RLS Policies

All tables have Row Level Security enabled with appropriate policies:
- Public can read active categories and tags
- Fellows can manage their own tags
- Staff (team+) can manage all fellow tags
- Only admins can manage categories and approve tags
