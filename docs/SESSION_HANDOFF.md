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

## Current State (Updated Feb 5, 2026)

### Recently Completed ✅
- Google OAuth login redirect fixed
- GetStream account created, API keys stored in Supabase + Netlify
- Buttondown account created, API key stored in Supabase
- Full Community Platform plan created (GATHER_COMMUNITY_PLAN.md)
- All 292 fellow photos uploaded and linked
- Focus Areas system working
- Badge colors standardized (CPF: blue-700, GGF: orange-500, ESP: orange-700)

### In Progress 🔄
- **Notification preferences UI fix** — buttons/toggles going off screen (fix ready in NotificationSettings-fix.jsx)
- **Community Platform Phase 1** — Stream token minting, announcements, newsletter composer
- **Staff account setup** — Tyler Stober pending

### Known Issues 🐛
- Notification preferences page: delivery buttons and toggles cut off on mobile (CSS fix ready)

### Pending Features 📋
- Community tab with announcements feed
- Direct messaging between fellows (GetStream)
- Newsletter composer (Buttondown integration)
- Weekly digest emails (automated)

---

## Environment Variables

### Supabase Edge Function Secrets ✅
- `SUPABASE_URL`, `SUPABASE_ANON_KEY`, `SUPABASE_SERVICE_ROLE_KEY`, `SUPABASE_DB_URL`
- `SERPAPI_KEY`, `GOOGLE_TRANSLATE_API_KEY`
- `BUTTONDOWN_API_KEY`, `GETSTREAM_API_KEY`, `GETSTREAM_SECRET`

### Netlify Environment Variables ✅
- `GETSTREAM_API_KEY`

---

## Key Files

| File | Purpose |
|------|---------|
| `index.html` | Main app — all React components embedded |
| `docs/ARCHITECTURE.md` | System overview |
| `docs/DATABASE_SCHEMA.md` | All tables and relationships |
| `docs/STYLE_GUIDE.md` | Colors, fonts, component patterns |
| `docs/GATHER_COMMUNITY_PLAN.md` | Community platform product plan |

---

## Style Quick Reference

| Element | Tailwind Classes |
|---------|-----------------|
| Primary button | `bg-orange-500 text-white py-4 rounded-xl font-semibold` |
| CPF badge | `bg-blue-700 text-white px-2 py-1 rounded-full text-xs` |
| GGF badge | `bg-orange-500 text-white px-2 py-1 rounded-full text-xs` |
| ESP badge | `bg-orange-700 text-white px-2 py-1 rounded-full text-xs` |
| Card | `bg-white rounded-xl shadow-sm border border-gray-100 p-4` |

**Brand orange:** `#E87722`

---

## Immediate TODO

1. **Apply notification settings fix** — Replace NotificationSettingsModal in index.html (see NotificationSettings-fix.jsx)
2. **Create Stream token Edge Function** — Mint tokens for authenticated users
3. **Add announcements table** — Staff can post, fellows can read
4. **Build Community tab** — New navigation item with feed view
