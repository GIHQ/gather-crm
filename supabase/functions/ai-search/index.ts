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
    const dbStart = Date.now();

    const [fellowsRes, tagsRes, categoriesRes, focusTagsRes] = await Promise.all([
      supabase.from("fellows").select("id, first_name, last_name, program, cohort, city, country, region, organization, job_title, biography, community_area, languages, focus_area_1, focus_area_2, focus_area_3").eq("status", "Alumni"),
      supabase.from("fellow_focus_tags").select("fellow_id, tag_id"),
      supabase.from("focus_categories").select("id, name, slug"),
      supabase.from("focus_tags").select("id, name, category_id"),
    ]);

    if (fellowsRes.error) throw new Error(`Fellows query failed: ${fellowsRes.error.message}`);
    if (tagsRes.error) console.error("Tags query error:", tagsRes.error);
    if (categoriesRes.error) console.error("Categories query error:", categoriesRes.error);
    if (focusTagsRes.error) console.error("Focus tags query error:", focusTagsRes.error);

    const fellows = Array.isArray(fellowsRes.data) ? fellowsRes.data : [];
    const fellowTags = Array.isArray(tagsRes.data) ? tagsRes.data : [];
    const categories = Array.isArray(categoriesRes.data) ? categoriesRes.data : [];
    const focusTags = Array.isArray(focusTagsRes.data) ? focusTagsRes.data : [];

    console.log(`DB queries took ${Date.now() - dbStart}ms. Loaded ${fellows.length} fellows, ${fellowTags.length} tags, ${categories.length} categories, ${focusTags.length} focus tags`);

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

    // Build compact fellow summaries — minimal tokens, pipe-delimited
    const fellowSummaries = fellows.map((f: any) => {
      const tags = fellowTagMap[f.id] || [];
      const parts = [
        f.id,
        `${f.first_name} ${f.last_name}`,
        f.program,
        f.cohort ? `'${String(f.cohort).slice(-2)}` : "",
        f.city && f.country ? `${f.city},${f.country}` : (f.city || f.country || ""),
        f.organization || "",
        f.job_title || "",
        tags.length > 0 ? tags.map(t => t.split(" (")[0]).join(",") : "",
        f.community_area || "",
        f.languages || "",
      ];
      return parts.join("|");
    }).join("\n");

    // Build the system prompt — fellow data is pipe-delimited:
    // id|name|program|cohort|city,country|org|title|tags|neighborhood|languages
    const systemPrompt = `You are GATHER.ai, an AI assistant for the Goldin Institute alumni network (${fellows.length} fellows). Programs: CPF (Chicago Peace Fellows), GGF (Goldin Global Fellows), ESP (Global Spanish).

Find relevant fellows and respond in JSON:
{"message":"your response","fellows":[{"id":"uuid","name":"Full Name","reason":"why"}]}

Return 3-8 matches. Be conversational. If vague, ask clarifying questions. Empty fellows array for general chat.

Fellow data (id|name|program|cohort|city,country|org|title|tags|neighborhood|languages):
${fellowSummaries}`;

    // Build messages for Claude (support multi-turn conversation)
    const messages = [
      ...conversation.map((msg: any) => ({
        role: msg.role,
        content: msg.content,
      })),
      { role: "user", content: query },
    ];

    // Call Claude API with Haiku (higher rate limits) and prompt caching
    console.log(`Calling Claude API with ${fellows.length} fellows, prompt length: ${systemPrompt.length} chars`);
    const abortController = new AbortController();
    const apiTimeout = setTimeout(() => abortController.abort(), 25000); // 25s timeout

    let claudeResponse;
    try {
      claudeResponse = await fetch("https://api.anthropic.com/v1/messages", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "x-api-key": ANTHROPIC_API_KEY,
          "anthropic-version": "2023-06-01",
          "anthropic-beta": "prompt-caching-2024-07-31",
        },
        body: JSON.stringify({
          model: "claude-haiku-4-5-20251001",
          max_tokens: 1024,
          system: [
            {
              type: "text",
              text: systemPrompt,
              cache_control: { type: "ephemeral" },
            }
          ],
          messages,
        }),
        signal: abortController.signal,
      });
    } catch (fetchErr) {
      clearTimeout(apiTimeout);
      if (fetchErr.name === "AbortError") {
        throw new Error("Claude API timed out after 25 seconds");
      }
      throw fetchErr;
    }
    clearTimeout(apiTimeout);

    const claudeData = await claudeResponse.json();
    console.log("Claude API status:", claudeResponse.status, "usage:", claudeData.usage);

    if (!claudeResponse.ok) {
      console.error("Claude API error:", JSON.stringify(claudeData));
      throw new Error(claudeData.error?.message || `Claude API error (${claudeResponse.status})`);
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
