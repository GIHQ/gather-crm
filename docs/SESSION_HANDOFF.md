# GATHER Session Handoff

**Read this first.** This document gives any Claude session immediate context to continue work on GATHER.

---

## Quick Context

GATHER is an alumni CRM for the Goldin Institute managing 292 fellows across 3 programs (CPF, GGF, ESP). It's a mobile-first PWA built as a single HTML file with React, hosted on Netlify, backed by Supabase.

| Resource | URL |
|----------|-----|
| Live site | https://gathertracker.netlify.app |
| Supabase | https://supabase.com/dashboard/project/pwazurumpzydxyppbvee |
| GitHub | https://github.com/GIHQ/gather-crm |

---

## Current State (Updated Feb 6, 2026)

### Recently Completed
- Google OAuth login redirect fixed
- GetStream account created, API keys stored in Supabase + Netlify
- Buttondown account created, API key stored in Supabase
- Full Community Platform plan created
- All 292 fellow photos uploaded and linked
- Focus Areas system working
- Notification settings mobile overflow fix applied (Feb 6)
- Component index comment block added to index.html

### In Progress
- **Community Platform Phase 1** - Stream token minting, announcements, newsletter composer
- **Staff account setup** - Tyler Stober (stobertg@gmail.com) pending

### Known Issues
- Guest users see "0 alumni" in directory (RLS or permission issue)
- News scanner returns 0 results (SerpAPI key may need verification)

---

## Environment Variables (All Configured)

**Supabase Edge Function Secrets:**
SUPABASE_URL, SUPABASE_ANON_KEY, SUPABASE_SERVICE_ROLE_KEY, SUPABASE_DB_URL, SERPAPI_KEY, GOOGLE_TRANSLATE_API_KEY, BUTTONDOWN_API_KEY, GETSTREAM_API_KEY, GETSTREAM_SECRET

**Netlify:** GETSTREAM_API_KEY

---

## Key Files

| File | Purpose |
|------|---------|
| `index.html` | Main app - all React components embedded |
| `docs/ARCHITECTURE.md` | System overview |
| `docs/DATABASE_SCHEMA.md` | All tables and relationships |
| `docs/STYLE_GUIDE.md` | Colors, fonts, component patterns |
| `docs/GATHER_COMMUNITY_PLAN.md` | Community platform product plan |

---

## Community Platform - Phase 1 Scope

From GATHER_COMMUNITY_PLAN.md, Phase 1 (Foundation) includes:
- Stream token-minting Edge Function
- Announcements table + RLS policies
- Resources table + RLS policies
- Announcements feed component
- Newsletter composer (Buttondown API)
- "Community" tab in navigation

---

## Style Quick Reference

| Element | Tailwind Classes |
|---------|-----------------|
| Primary button | `bg-orange-500 text-white py-4 rounded-xl font-semibold` |
| CPF badge | `bg-blue-700 text-white px-2 py-1 rounded-full text-xs` |
| GGF badge | `bg-orange-500 text-white px-2 py-1 rounded-full text-xs` |
| ESP badge | `bg-orange-700 text-white px-2 py-1 rounded-full text-xs` |

**Brand orange:** `#E87722`
