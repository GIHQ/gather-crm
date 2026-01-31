// GATHER CRM - News Search Edge Function
// Searches for news/web mentions of fellows and stores in activities table

import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

interface Fellow {
  id: string;
  first_name: string;
  last_name: string;
  organization?: string;
  city?: string;
}

interface SearchResult {
  title: string;
  link: string;
  snippet: string;
  displayLink: string;
  pagemap?: {
    cse_image?: Array<{ src: string }>;
    metatags?: Array<{ "article:published_time"?: string }>;
  };
}

serve(async (req) => {
  // Handle CORS
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    // Get environment variables
    const GOOGLE_API_KEY = Deno.env.get("GOOGLE_API_KEY");
    const GOOGLE_SEARCH_ENGINE_ID = Deno.env.get("GOOGLE_SEARCH_ENGINE_ID");
    const SUPABASE_URL = Deno.env.get("SUPABASE_URL");
    const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

    if (!GOOGLE_API_KEY || !GOOGLE_SEARCH_ENGINE_ID) {
      throw new Error("Missing Google API credentials");
    }

    // Create Supabase client with service role (bypasses RLS)
    const supabase = createClient(SUPABASE_URL!, SUPABASE_SERVICE_ROLE_KEY!);

    // Get request body (optional: specific fellow_id to search)
    const body = await req.json().catch(() => ({}));
    const specificFellowId = body.fellow_id;
    const maxFellows = body.max_fellows || 10; // Limit per run to stay within API quotas

    // Fetch fellows to search
    let query = supabase
      .from("fellows")
      .select("id, first_name, last_name, organization, city")
      .eq("status", "Alumni");

    if (specificFellowId) {
      query = query.eq("id", specificFellowId);
    } else {
      // Get fellows we haven't searched recently (rotate through list)
      query = query.order("last_news_search", { ascending: true, nullsFirst: true })
        .limit(maxFellows);
    }

    const { data: fellows, error: fellowsError } = await query;

    if (fellowsError) throw fellowsError;
    if (!fellows || fellows.length === 0) {
      return new Response(JSON.stringify({ message: "No fellows to search" }), {
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const results: Array<{ fellow: string; activitiesFound: number }> = [];

    for (const fellow of fellows as Fellow[]) {
      // Build search query
      const searchTerms = [
        `"${fellow.first_name} ${fellow.last_name}"`,
        fellow.organization ? `"${fellow.organization}"` : "",
      ].filter(Boolean).join(" OR ");

      // Add context terms to improve relevance
      const contextTerms = "peace OR community OR nonprofit OR social OR award OR interview";
      const fullQuery = `(${searchTerms}) (${contextTerms})`;

      // Search Google Custom Search API
      const searchUrl = new URL("https://www.googleapis.com/customsearch/v1");
      searchUrl.searchParams.set("key", GOOGLE_API_KEY);
      searchUrl.searchParams.set("cx", GOOGLE_SEARCH_ENGINE_ID);
      searchUrl.searchParams.set("q", fullQuery);
      searchUrl.searchParams.set("num", "5"); // Get top 5 results
      searchUrl.searchParams.set("dateRestrict", "m1"); // Last month
      searchUrl.searchParams.set("safe", "active");

      const searchResponse = await fetch(searchUrl.toString());
      const searchData = await searchResponse.json();

      let activitiesFound = 0;

      if (searchData.items && searchData.items.length > 0) {
        for (const item of searchData.items as SearchResult[]) {
          // Calculate basic relevance score
          const titleMatch = item.title.toLowerCase().includes(fellow.first_name.toLowerCase()) &&
                            item.title.toLowerCase().includes(fellow.last_name.toLowerCase());
          const snippetMatch = item.snippet.toLowerCase().includes(fellow.first_name.toLowerCase());
          const relevanceScore = (titleMatch ? 0.5 : 0) + (snippetMatch ? 0.3 : 0) + 0.2;

          // Only store if reasonably relevant
          if (relevanceScore >= 0.3) {
            // Extract image URL if available
            const imageUrl = item.pagemap?.cse_image?.[0]?.src || null;

            // Extract published date if available
            const publishedAt = item.pagemap?.metatags?.[0]?.["article:published_time"] || null;

            // Insert into activities table (upsert to avoid duplicates)
            const { error: insertError } = await supabase
              .from("activities")
              .upsert({
                fellow_id: fellow.id,
                activity_type: "news_mention",
                source_name: item.displayLink,
                source_url: item.link,
                source_domain: item.displayLink,
                title: item.title,
                snippet: item.snippet,
                image_url: imageUrl,
                published_at: publishedAt,
                search_query: fullQuery,
                relevance_score: relevanceScore,
                verified: false,
                dismissed: false,
                notified: false,
              }, {
                onConflict: "fellow_id,source_url",
                ignoreDuplicates: true,
              });

            if (!insertError) {
              activitiesFound++;
            }
          }
        }
      }

      // Update fellow's last_news_search timestamp
      await supabase
        .from("fellows")
        .update({ last_news_search: new Date().toISOString() })
        .eq("id", fellow.id);

      results.push({
        fellow: `${fellow.first_name} ${fellow.last_name}`,
        activitiesFound,
      });

      // Small delay to avoid rate limiting
      await new Promise((resolve) => setTimeout(resolve, 200));
    }

    return new Response(
      JSON.stringify({
        success: true,
        fellowsSearched: results.length,
        results,
      }),
      {
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  } catch (error) {
    console.error("Error:", error);
    return new Response(
      JSON.stringify({ error: error.message }),
      {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  }
});
