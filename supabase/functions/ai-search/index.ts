// GATHER CRM - AI Search Edge Function
// Natural language search across fellows using Claude API
// Replaces rule-based "Help Me Connect" with intelligent search

import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    const ANTHROPIC_API_KEY = Deno.env.get("Anthropic-AI");
    const SUPABASE_URL = Deno.env.get("SUPABASE_URL");
    const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

    if (!ANTHROPIC_API_KEY) {
      throw new Error("Missing ANTHROPIC_API_KEY");
    }

    const body = await req.json();
    const { query, conversation = [] } = body;

    if (!query || typeof query !== "string") {
      throw new Error("Missing or invalid 'query'");
    }

    // Fetch fellows with their focus tags from DB
    const supabase = createClient(SUPABASE_URL!, SUPABASE_SERVICE_ROLE_KEY!);

    const [fellowsRes, tagsRes, categoriesRes, focusTagsRes] = await Promise.all([
      supabase.from("fellows").select("id, first_name, last_name, program, cohort_year, city, country, region, organization, job_title, biography, community_area, languages, focus_area_1, focus_area_2, focus_area_3").eq("status", "Alumni"),
      supabase.from("fellow_focus_tags").select("fellow_id, tag_id"),
      supabase.from("focus_categories").select("id, name, slug"),
      supabase.from("focus_tags").select("id, name, category_id"),
    ]);

    const fellows = fellowsRes.data || [];
    const fellowTags = tagsRes.data || [];
    const categories = categoriesRes.data || [];
    const focusTags = focusTagsRes.data || [];

    // Build tag lookup
    const tagMap: Record<string, { name: string; category: string }> = {};
    const catMap: Record<string, string> = {};
    categories.forEach((c: any) => { catMap[c.id] = c.name; });
    focusTags.forEach((t: any) => {
      tagMap[t.id] = { name: t.name, category: catMap[t.category_id] || "Unknown" };
    });

    // Build fellow-to-tags map
    const fellowTagMap: Record<string, string[]> = {};
    fellowTags.forEach((ft: any) => {
      if (!fellowTagMap[ft.fellow_id]) fellowTagMap[ft.fellow_id] = [];
      const tag = tagMap[ft.tag_id];
      if (tag) fellowTagMap[ft.fellow_id].push(`${tag.name} (${tag.category})`);
    });

    // Build compact fellow summaries for Claude
    const fellowSummaries = fellows.map((f: any) => {
      const tags = fellowTagMap[f.id] || [];
      const parts = [
        `ID:${f.id}`,
        `${f.first_name} ${f.last_name}`,
        f.program,
        f.cohort_year ? `'${String(f.cohort_year).slice(-2)}` : "",
        f.city && f.country ? `${f.city}, ${f.country}` : (f.city || f.country || ""),
        f.organization ? `Org: ${f.organization}` : "",
        f.job_title ? `Title: ${f.job_title}` : "",
        tags.length > 0 ? `Tags: ${tags.join(", ")}` : "",
        f.community_area ? `Neighborhood: ${f.community_area}` : "",
        f.languages ? `Languages: ${f.languages}` : "",
      ].filter(Boolean);
      return parts.join(" | ");
    }).join("\n");

    // Build the system prompt
    const systemPrompt = `You are an AI assistant for GATHER, an alumni network CRM for the Goldin Institute. You help staff find and connect with fellows in their network of 292 alumni across 3 programs:
- CPF (Chicago Peace Fellows) — Chicago-based community leaders
- GGF (Goldin Global Fellows) — International peacebuilders
- ESP (Español/Global Spanish) — Spanish-speaking fellows

You have access to the full fellow database below. When the user asks a question:
1. Search through the fellows to find relevant matches
2. Return 3-8 of the most relevant fellows with clear reasoning
3. Be conversational and helpful — suggest connections, introductions, or outreach ideas
4. If the query is vague, ask clarifying questions
5. You can also answer general questions about the network (stats, trends, etc.)

IMPORTANT: Always return your response in this JSON format:
{
  "message": "Your conversational response to the user (markdown OK)",
  "fellows": [
    { "id": "uuid", "name": "Full Name", "reason": "Why they match" }
  ]
}

If no fellows match, return an empty fellows array with a helpful message.
If the user is having a general conversation (greeting, follow-up question), you can return just a message with empty fellows array.

FELLOW DATABASE:
${fellowSummaries}`;

    // Build messages for Claude (support multi-turn conversation)
    const messages = [
      ...conversation.map((msg: any) => ({
        role: msg.role,
        content: msg.content,
      })),
      { role: "user", content: query },
    ];

    // Call Claude API
    const claudeResponse = await fetch("https://api.anthropic.com/v1/messages", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "x-api-key": ANTHROPIC_API_KEY,
        "anthropic-version": "2023-06-01",
      },
      body: JSON.stringify({
        model: "claude-sonnet-4-5-20250929",
        max_tokens: 1024,
        system: systemPrompt,
        messages,
      }),
    });

    const claudeData = await claudeResponse.json();

    if (!claudeResponse.ok) {
      console.error("Claude API error:", claudeData);
      throw new Error(claudeData.error?.message || "Claude API error");
    }

    const responseText = claudeData.content?.[0]?.text || "";

    // Parse the JSON response from Claude
    let parsed;
    try {
      // Extract JSON from the response (Claude might wrap it in markdown code blocks)
      const jsonMatch = responseText.match(/\{[\s\S]*\}/);
      if (jsonMatch) {
        parsed = JSON.parse(jsonMatch[0]);
      } else {
        parsed = { message: responseText, fellows: [] };
      }
    } catch {
      parsed = { message: responseText, fellows: [] };
    }

    return new Response(JSON.stringify(parsed), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (error) {
    console.error("AI Search error:", error);
    return new Response(
      JSON.stringify({ error: error.message }),
      {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  }
});
