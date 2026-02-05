# GATHER Session Handoff

> **Read this first.** This document gives any Claude session immediate context to continue work on GATHER.

---

## Quick Context

**GATHER** is an alumni CRM for the Goldin Institute managing 292 fellows across 3 programs (CPF, GGF, ESP). It's a mobile-first PWA built as a single HTML file with React, hosted on Netlify, backed by Supabase.

**Live site:** https://gathertracker.netlify.app  
**Supabase:** https://supabase.com/dashboard/project/pwazurumpzydxyppbvee  
**GitHub:** https://github.com/GIHQ/gather-crm

---

## Current State (Updated Feb 4, 2026)

### Recently Completed ✅
- Focus Areas RLS policies fixed (categories now load properly)
- Badge colors standardized (CPF: blue-700, GGF: orange-500, ESP: orange-700)
- News scanner Edge Function deployed (searches Google via SerpAPI)
- 292 fellow photos uploaded and linked

### In Progress 🔄
- Notification preferences UI (spec created, needs implementation)
- Social media scanner expansion (spec created, needs implementation)
- Tyler Stober staff account setup (stobertg@gmail.com)

### Known Issues 🐛
- Notification preferences page UI needs design cleanup
- Guest users see "0 alumni" in directory (RLS or permission issue)
- News scanner returns 0 results (SerpAPI key may need verification)

### Pending Features 📋
- Community features with GetStream
- Newsletter system with Buttondown
- 6-tier permission system testing
- Sort/filter functionality testing

---

## Key Files

| File | Purpose |
|------|---------|
| `index.html` | Main app - all React components embedded |
| `supabase/functions/search-news/index.ts` | News scanner Edge Function |
| `docs/ARCHITECTURE.md` | System overview |
| `docs/DATABASE_SCHEMA.md` | All tables and relationships |
| `docs/STYLE_GUIDE.md` | Colors, fonts, component patterns |
| `docs/COMMUNITY_BUILD_PLAN.md` | GetStream + Buttondown integration |

---

## Common Commands

### Claude Code - Git Operations
```bash
cd ~/gather-crm
git pull                          # Get latest
git status                        # Check changes
git add . && git commit -m "..."  # Commit
git push                          # Deploy (auto via Netlify)
```

### Claude Code - Supabase
```bash
supabase login
supabase link --project-ref pwazurumpzydxyppbvee
supabase functions deploy search-news
supabase db push                  # Run migrations
```

### Useful SQL Queries
```sql
-- Check fellow count by program
SELECT program, COUNT(*) FROM fellows GROUP BY program;

-- Fellows without focus areas
SELECT fellow_id, first_name, last_name FROM fellows f
LEFT JOIN fellow_focus_tags fft ON f.id = fft.fellow_id
WHERE fft.id IS NULL;

-- Recent interactions
SELECT * FROM interactions ORDER BY created_at DESC LIMIT 10;
```

---

## Environment Variables

### Netlify (public, frontend)
- `SUPABASE_URL`
- `SUPABASE_ANON_KEY`

### Supabase Edge Function Secrets (private)
- `SERPAPI_KEY`
- `SUPABASE_SERVICE_ROLE_KEY`
- `GETSTREAM_SECRET` (future)
- `BUTTONDOWN_API_KEY` (future)

---

## Style Quick Reference

| Element | Class |
|---------|-------|
| Primary button | `bg-goldin-orange text-white py-4 rounded-xl` |
| CPF badge | `bg-blue-700 text-white px-2 py-1 rounded-full text-xs` |
| GGF badge | `bg-orange-500 text-white px-2 py-1 rounded-full text-xs` |
| ESP badge | `bg-orange-700 text-white px-2 py-1 rounded-full text-xs` |
| Card | `bg-white rounded-xl shadow-sm border border-gray-100 p-4` |
| Toggle ON | `bg-orange-500` with white circle right |
| Toggle OFF | `bg-gray-300` with white circle left |

---

## Before Making Changes

1. **Check what branch you're on:** `git branch`
2. **Pull latest:** `git pull origin main`
3. **Read relevant docs** in this folder
4. **Test locally if possible** before pushing
5. **Push triggers auto-deploy** - Netlify builds in ~1 min

---

## Getting Help

If you need more context:
1. Search past conversations with keywords
2. Check the `docs/` folder for detailed specs
3. Query Supabase directly to understand data
4. View the live site at gathertracker.netlify.app

---

## Human Contact

**Project Owner:** Travis Rejman (travis@goldininstitute.org)  
**Organization:** Goldin Institute (Chicago-based nonprofit)
