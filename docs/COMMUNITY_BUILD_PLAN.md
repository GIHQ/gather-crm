# GATHER Community Build Plan

## Overview

This document outlines the integration of community features into GATHER using:
- **GetStream** - Social features (feeds, messaging, notifications)
- **Buttondown** - Email newsletters

The goal: Transform GATHER from a staff-only CRM into a living alumni community where fellows can connect, share updates, and stay engaged.

---

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                         GATHER                               │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────┐ │
│  │   CRM       │  │  Community  │  │    Newsletters      │ │
│  │ (existing)  │  │  (Stream)   │  │   (Buttondown)      │ │
│  └──────┬──────┘  └──────┬──────┘  └──────────┬──────────┘ │
│         │                │                     │            │
│         └────────────────┼─────────────────────┘            │
│                          │                                   │
│                    ┌─────┴─────┐                            │
│                    │  Supabase │                            │
│                    │  (source  │                            │
│                    │  of truth)│                            │
│                    └───────────┘                            │
└─────────────────────────────────────────────────────────────┘
```

**Key principle:** Supabase remains the single source of truth. GetStream and Buttondown are service layers that receive data from Supabase, not the other way around.

---

## Phase 1: Account Setup (Human Tasks)

### GetStream Maker Account
1. Go to https://getstream.io/maker-account/
2. Sign up with your Goldin Institute email
3. Create an app called "GATHER"
4. Copy the **API Key** and **Secret**
5. Store in:
   - Netlify Environment Variables: `GETSTREAM_API_KEY` (public)
   - Supabase Edge Function Secrets: `GETSTREAM_SECRET` (private)

### Buttondown Account
1. Go to https://buttondown.email
2. Sign up for free tier
3. Apply for nonprofit discount (50% off): https://buttondown.email/pricing
4. Create a newsletter called "Goldin Network"
5. Copy the **API Key**
6. Store in Supabase Edge Function Secrets: `BUTTONDOWN_API_KEY`

### DNS for Custom Email (Optional)
To send from @goldininstitute.org instead of buttondown.email:
1. Add DKIM records to your domain DNS
2. Verify in Buttondown settings
3. (Claude can provide exact records once Buttondown is set up)

---

## Phase 2: Database Schema

### New Tables

```sql
-- Announcements (staff broadcasts)
CREATE TABLE announcements (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  author_id UUID REFERENCES auth.users(id),
  target_programs TEXT[] DEFAULT '{}', -- empty = all programs
  is_pinned BOOLEAN DEFAULT false,
  published_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Resources (shared documents/links)
CREATE TABLE resources (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT NOT NULL,
  description TEXT,
  url TEXT NOT NULL,
  category TEXT, -- 'document', 'link', 'video', etc.
  target_programs TEXT[] DEFAULT '{}',
  uploaded_by UUID REFERENCES auth.users(id),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Newsletter sends (tracking)
CREATE TABLE newsletter_sends (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  buttondown_id TEXT, -- ID from Buttondown API
  subject TEXT NOT NULL,
  recipient_count INTEGER,
  target_programs TEXT[],
  sent_by UUID REFERENCES auth.users(id),
  sent_at TIMESTAMPTZ DEFAULT NOW()
);

-- Stream user tokens (cache)
CREATE TABLE stream_tokens (
  user_id UUID PRIMARY KEY REFERENCES auth.users(id),
  token TEXT NOT NULL,
  expires_at TIMESTAMPTZ NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);
```

### RLS Policies

```sql
-- Announcements: anyone can read, staff+ can write
ALTER TABLE announcements ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Anyone can read published" ON announcements 
  FOR SELECT USING (published_at IS NOT NULL);
CREATE POLICY "Staff can manage" ON announcements 
  FOR ALL USING (
    EXISTS (SELECT 1 FROM user_roles WHERE user_id = auth.uid() AND role IN ('staff', 'admin', 'super_admin'))
  );

-- Resources: anyone can read, staff+ can write
ALTER TABLE resources ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Anyone can read" ON resources FOR SELECT USING (true);
CREATE POLICY "Staff can manage" ON resources FOR ALL USING (
  EXISTS (SELECT 1 FROM user_roles WHERE user_id = auth.uid() AND role IN ('staff', 'admin', 'super_admin'))
);
```

---

## Phase 3: GetStream Integration

### Edge Function: Token Minting

```typescript
// supabase/functions/stream-token/index.ts
import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import { StreamChat } from "https://esm.sh/stream-chat";

serve(async (req) => {
  const supabase = createClient(
    Deno.env.get("SUPABASE_URL")!,
    Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!
  );

  // Verify user is authenticated
  const authHeader = req.headers.get("Authorization");
  const { data: { user }, error } = await supabase.auth.getUser(
    authHeader?.replace("Bearer ", "")
  );
  
  if (error || !user) {
    return new Response(JSON.stringify({ error: "Unauthorized" }), { status: 401 });
  }

  // Get fellow profile for display name/photo
  const { data: fellow } = await supabase
    .from("fellows")
    .select("first_name, last_name, photo_url, program")
    .eq("email", user.email)
    .single();

  // Initialize Stream client
  const streamClient = StreamChat.getInstance(
    Deno.env.get("GETSTREAM_API_KEY")!,
    Deno.env.get("GETSTREAM_SECRET")!
  );

  // Create/update Stream user
  await streamClient.upsertUser({
    id: user.id,
    name: fellow ? `${fellow.first_name} ${fellow.last_name}` : user.email,
    image: fellow?.photo_url,
    program: fellow?.program,
  });

  // Generate token
  const token = streamClient.createToken(user.id);

  return new Response(JSON.stringify({ token, userId: user.id }), {
    headers: { "Content-Type": "application/json" },
  });
});
```

### Frontend: Stream React Components

```jsx
// Add to index.html after other script imports
<script src="https://cdn.jsdelivr.net/npm/stream-chat-react@latest/dist/browser.full.js"></script>

// Community tab component
const CommunityFeed = () => {
  const [client, setClient] = useState(null);
  const [channel, setChannel] = useState(null);

  useEffect(() => {
    const initStream = async () => {
      // Get token from Edge Function
      const res = await fetch(`${SUPABASE_URL}/functions/v1/stream-token`, {
        headers: { Authorization: `Bearer ${session.access_token}` }
      });
      const { token, userId } = await res.json();

      // Initialize client
      const streamClient = StreamChat.getInstance(STREAM_API_KEY);
      await streamClient.connectUser({ id: userId }, token);
      
      // Connect to main feed channel
      const channel = streamClient.channel('messaging', 'goldin-network', {
        name: 'Goldin Network',
      });
      await channel.watch();
      
      setClient(streamClient);
      setChannel(channel);
    };

    initStream();
    return () => client?.disconnectUser();
  }, []);

  if (!client || !channel) return <LoadingSpinner />;

  return (
    <Chat client={client} theme="str-chat__theme-light">
      <Channel channel={channel}>
        <MessageList />
        <MessageInput />
      </Channel>
    </Chat>
  );
};
```

### Stream Features to Enable
- [x] Activity feeds (posts, updates)
- [x] Comments and reactions
- [x] Direct messaging
- [ ] Follow relationships (optional)
- [ ] Push notifications (requires service worker update)

---

## Phase 4: Buttondown Integration

### Edge Function: Newsletter Send

```typescript
// supabase/functions/send-newsletter/index.ts
serve(async (req) => {
  const { subject, body, targetPrograms } = await req.json();

  // Get recipient list from Supabase
  let query = supabase.from("fellows").select("email, first_name").eq("is_active", true);
  if (targetPrograms?.length) {
    query = query.in("program", targetPrograms);
  }
  const { data: recipients } = await query;

  // Send via Buttondown API
  const response = await fetch("https://api.buttondown.email/v1/emails", {
    method: "POST",
    headers: {
      Authorization: `Token ${Deno.env.get("BUTTONDOWN_API_KEY")}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      subject,
      body,
      recipients: recipients.map(r => r.email),
    }),
  });

  // Log to newsletter_sends table
  await supabase.from("newsletter_sends").insert({
    subject,
    recipient_count: recipients.length,
    target_programs: targetPrograms,
    sent_by: user.id,
  });

  return new Response(JSON.stringify({ success: true, sent: recipients.length }));
});
```

### Admin UI: Newsletter Composer

Add to Settings page (Staff+ only):

```jsx
const NewsletterComposer = () => {
  const [subject, setSubject] = useState('');
  const [body, setBody] = useState('');
  const [targetPrograms, setTargetPrograms] = useState([]);
  const [sending, setSending] = useState(false);

  const sendNewsletter = async () => {
    setSending(true);
    await fetch(`${SUPABASE_URL}/functions/v1/send-newsletter`, {
      method: 'POST',
      headers: { 
        Authorization: `Bearer ${session.access_token}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ subject, body, targetPrograms })
    });
    setSending(false);
    // Show success toast
  };

  return (
    <div className="space-y-4">
      <h3 className="font-semibold">Send Newsletter</h3>
      
      <div>
        <label className="text-sm text-gray-600">Recipients</label>
        <div className="flex gap-2 mt-1">
          {['CPF', 'GGF', 'ESP'].map(p => (
            <button
              key={p}
              onClick={() => toggleProgram(p)}
              className={`px-3 py-1 rounded-full text-sm ${
                targetPrograms.includes(p) ? 'bg-orange-500 text-white' : 'bg-gray-200'
              }`}
            >
              {p}
            </button>
          ))}
        </div>
        <p className="text-xs text-gray-500 mt-1">
          {targetPrograms.length === 0 ? 'All 292 fellows' : `${getCount()} fellows`}
        </p>
      </div>

      <input
        type="text"
        placeholder="Subject line..."
        value={subject}
        onChange={e => setSubject(e.target.value)}
        className="w-full px-4 py-3 border rounded-xl"
      />

      <textarea
        placeholder="Newsletter content (Markdown supported)..."
        value={body}
        onChange={e => setBody(e.target.value)}
        rows={10}
        className="w-full px-4 py-3 border rounded-xl"
      />

      <button
        onClick={sendNewsletter}
        disabled={!subject || !body || sending}
        className="w-full py-4 bg-orange-500 text-white font-semibold rounded-xl disabled:opacity-50"
      >
        {sending ? 'Sending...' : 'Send Newsletter'}
      </button>
    </div>
  );
};
```

---

## Phase 5: Native Supabase Features

For simpler needs that don't require Stream:

### Announcements
Staff can post announcements that appear at the top of the dashboard/directory.

### Resources
Shared links, documents, templates accessible to all fellows.

### Supabase Realtime (optional)
For live notifications without Stream:
```javascript
supabase
  .channel('announcements')
  .on('postgres_changes', { event: 'INSERT', schema: 'public', table: 'announcements' }, 
    payload => showNotification(payload.new))
  .subscribe();
```

---

## Implementation Order

1. **Account setup** (human) - Stream + Buttondown accounts, API keys
2. **Database migrations** (Claude Code) - New tables and RLS
3. **Stream Edge Function** (Claude Code) - Token minting
4. **Stream frontend** (Claude Code) - Community tab with feed
5. **Buttondown Edge Function** (Claude Code) - Newsletter API
6. **Newsletter UI** (Claude Code) - Composer in admin settings
7. **Announcements** (Claude Code) - Native feature
8. **Testing** (human + Claude) - Verify all flows work

---

## Cost Summary

| Service | Tier | Cost | Notes |
|---------|------|------|-------|
| GetStream | Maker | Free | < 5 team members, < $10K revenue |
| Buttondown | Free/Basic | $0-9/mo | 292 subscribers well within limits |
| Supabase | Free | $0 | Already using |
| Netlify | Free | $0 | Already using |

**Total additional cost: $0-9/month**

---

## Future Enhancements

- [ ] Program-specific channels in Stream
- [ ] Event RSVPs and calendar
- [ ] Mentorship matching
- [ ] Job board
- [ ] Push notifications via service worker
- [ ] Weekly digest emails (automated)
