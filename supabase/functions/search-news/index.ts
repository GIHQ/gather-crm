// GATHER CRM - News & Social Media Search Edge Function
// Searches for news/web mentions of fellows using SerpAPI across multiple platforms
// Platforms: Google News, LinkedIn, Twitter/X, Facebook, Instagram
// Also searches custom organizational terms and links results to fellows

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
  source: 'google_news' | 'linkedin' | 'twitter' | 'facebook' | 'instagram';
  title: string;
  link: string;
  snippet?: string;
  date?: string;
  thumbnail?: string;
  relevanceScore: number;
  fellowId?: string;
}

type PlatformType = 'google_news' | 'linkedin' | 'twitter' | 'facebook' | 'instagram';

// Search configurations for each platform
const SEARCH_CONFIGS: Record<PlatformType, {
  engine: 'google' | 'google_news';
  buildQuery: (fellow: Fellow) => string;
  activityType: string;
}> = {
  google_news: {
    engine: 'google_news',
    buildQuery: (fellow: Fellow) => {
      const fullName = `"${fellow.first_name} ${fellow.last_name}"`;
      return fellow.organization
        ? `${fullName} OR "${fellow.organization}"`
        : fullName;
    },
    activityType: 'news_mention',
  },
  linkedin: {
    engine: 'google',
    buildQuery: (fellow: Fellow) => {
      const name = `"${fellow.first_name} ${fellow.last_name}"`;
      const org = fellow.organization ? ` "${fellow.organization}"` : '';
      return `site:linkedin.com/in ${name}${org}`;
    },
    activityType: 'linkedin_mention',
  },
  twitter: {
    engine: 'google',
    buildQuery: (fellow: Fellow) => {
      const name = `"${fellow.first_name} ${fellow.last_name}"`;
      return `(site:twitter.com OR site:x.com) ${name}`;
    },
    activityType: 'twitter_mention',
  },
  facebook: {
    engine: 'google',
    buildQuery: (fellow: Fellow) => {
      const name = `"${fellow.first_name} ${fellow.last_name}"`;
      return `site:facebook.com ${name}`;
    },
    activityType: 'facebook_mention',
  },
  instagram: {
    engine: 'google',
    buildQuery: (fellow: Fellow) => {
      const name = `"${fellow.first_name} ${fellow.last_name}"`;
      return `site:instagram.com ${name}`;
    },
    activityType: 'instagram_mention',
  },
};

// Calculate relevance score based on name/org matches
function calculateRelevance(
  fellow: Fellow,
  title: string,
  snippet: string
): number {
  const titleLower = (title || "").toLowerCase();
  const snippetLower = (snippet || "").toLowerCase();
  const firstNameLower = fellow.first_name.toLowerCase();
  const lastNameLower = fellow.last_name.toLowerCase();
  const orgLower = (fellow.organization || "").toLowerCase();

  const nameInTitle = titleLower.includes(firstNameLower) && titleLower.includes(lastNameLower);
  const nameInSnippet = snippetLower.includes(firstNameLower) && snippetLower.includes(lastNameLower);
  const orgInTitle = orgLower && orgLower.length > 3 && titleLower.includes(orgLower);
  const orgInSnippet = orgLower && orgLower.length > 3 && snippetLower.includes(orgLower);

  return (
    (nameInTitle ? 0.5 : 0) +
    (nameInSnippet ? 0.3 : 0) +
    (orgInTitle ? 0.4 : 0) +
    (orgInSnippet ? 0.2 : 0)
  );
}

// Check if a result mentions a fellow's name in title or snippet
function resultMentionsFellow(fellow: Fellow, title: string, snippet: string): boolean {
  const text = `${title} ${snippet}`.toLowerCase();
  return text.includes(fellow.first_name.toLowerCase()) && text.includes(fellow.last_name.toLowerCase());
}

async function searchPlatform(
  fellow: Fellow,
  platform: PlatformType,
  apiKey: string
): Promise<SearchResult[]> {
  const config = SEARCH_CONFIGS[platform];
  const query = config.buildQuery(fellow);

  const searchUrl = new URL("https://serpapi.com/search.json");
  searchUrl.searchParams.set("api_key", apiKey);
  searchUrl.searchParams.set("q", query);
  searchUrl.searchParams.set("num", "5");

  // Use appropriate engine and settings
  if (config.engine === 'google_news') {
    searchUrl.searchParams.set("engine", "google_news");
  } else {
    searchUrl.searchParams.set("engine", "google");
    // For social media, don't limit to recent results as we want to find profiles
  }

  try {
    const response = await fetch(searchUrl.toString());
    const data = await response.json();

    if (data.error) {
      console.error(`SerpAPI error for ${platform}:`, data.error);
      return [];
    }

    // Parse results based on engine type
    const rawResults = config.engine === 'google_news'
      ? data.news_results || []
      : data.organic_results || [];

    return rawResults.slice(0, 3).map((item: any) => {
      const title = item.title || item.headline || '';
      const snippet = item.snippet || item.description || '';
      const relevanceScore = calculateRelevance(fellow, title, snippet);

      return {
        source: platform,
        title,
        link: item.link || item.url || '',
        snippet,
        date: item.date || item.published_date || '',
        thumbnail: item.thumbnail || '',
        relevanceScore,
      };
    }).filter((r: SearchResult) => r.relevanceScore >= 0.2 || platform !== 'google_news');
    // For social media, we're more lenient since site: filter already targets relevant results
  } catch (error) {
    console.error(`Error searching ${platform} for ${fellow.first_name} ${fellow.last_name}:`, error);
    return [];
  }
}

async function searchAllPlatforms(
  fellow: Fellow,
  apiKey: string,
  platforms: PlatformType[]
): Promise<SearchResult[]> {
  const results: SearchResult[] = [];

  // Search platforms sequentially to respect rate limits
  for (const platform of platforms) {
    console.log(`Searching ${platform} for ${fellow.first_name} ${fellow.last_name}...`);
    const platformResults = await searchPlatform(fellow, platform, apiKey);
    results.push(...platformResults);

    // Small delay between API calls to respect rate limits
    await new Promise(resolve => setTimeout(resolve, 200));
  }

  return results;
}

// Search a custom term via Google News and return results
async function searchCustomTerm(
  term: string,
  apiKey: string
): Promise<Array<{ title: string; link: string; snippet: string; date: string; thumbnail: string }>> {
  const searchUrl = new URL("https://serpapi.com/search.json");
  searchUrl.searchParams.set("api_key", apiKey);
  searchUrl.searchParams.set("q", `"${term}"`);
  searchUrl.searchParams.set("engine", "google_news");
  searchUrl.searchParams.set("num", "5");

  try {
    const response = await fetch(searchUrl.toString());
    const data = await response.json();

    if (data.error) {
      console.error(`SerpAPI error for custom term "${term}":`, data.error);
      return [];
    }

    const rawResults = data.news_results || [];
    return rawResults.slice(0, 5).map((item: any) => ({
      title: item.title || item.headline || '',
      link: item.link || item.url || '',
      snippet: item.snippet || item.description || '',
      date: item.date || item.published_date || '',
      thumbnail: item.thumbnail || '',
    }));
  } catch (error) {
    console.error(`Error searching custom term "${term}":`, error);
    return [];
  }
}

serve(async (req) => {
  // Handle CORS
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    // Get environment variables
    const SERPAPI_KEY = Deno.env.get("SERPAPI_KEY");
    const SUPABASE_URL = Deno.env.get("SUPABASE_URL");
    const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

    if (!SERPAPI_KEY) {
      throw new Error("Missing SERPAPI_KEY");
    }

    if (!SUPABASE_URL || !SUPABASE_SERVICE_ROLE_KEY) {
      throw new Error(`Missing Supabase credentials: URL=${!!SUPABASE_URL}, KEY=${!!SUPABASE_SERVICE_ROLE_KEY}`);
    }

    // Create Supabase client with service role (bypasses RLS)
    const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY);

    // Get request body
    const body = await req.json().catch(() => ({}));
    const specificFellowId = body.fellow_id;
    const maxFellows = body.max_fellows || 10;
    // Default to google_news only for backward compatibility
    const platforms: PlatformType[] = body.platforms || ['google_news'];
    // Custom search terms (organizational keywords)
    const customTerms: string[] = body.customTerms || [];

    console.log(`Starting search with platforms: ${platforms.join(', ')}, max_fellows: ${maxFellows}, custom_terms: ${customTerms.length}`);

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

    if (fellowsError) {
      throw new Error(`Fellows query error: ${fellowsError.message}`);
    }
    if (!fellows || fellows.length === 0) {
      return new Response(JSON.stringify({
        message: "No fellows to search",
        debug: { maxFellows, specificFellowId, platforms }
      }), {
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    console.log(`Found ${fellows.length} fellows to search across ${platforms.length} platforms`);

    // Track all URLs we've already inserted to deduplicate
    const seenUrls = new Set<string>();

    const results: Array<{
      fellow: string;
      activitiesFound: number;
      byPlatform: Record<string, number>;
    }> = [];

    for (const fellow of fellows as Fellow[]) {
      const searchResults = await searchAllPlatforms(fellow, SERPAPI_KEY, platforms);
      const byPlatform: Record<string, number> = {};
      let activitiesFound = 0;

      for (const result of searchResults) {
        if (seenUrls.has(`${fellow.id}:${result.link}`)) continue;
        seenUrls.add(`${fellow.id}:${result.link}`);

        const config = SEARCH_CONFIGS[result.source];
        const sourceName = result.source === 'google_news'
          ? (new URL(result.link).hostname.replace('www.', ''))
          : result.source.charAt(0).toUpperCase() + result.source.slice(1);

        // Insert into activities table (upsert to avoid duplicates)
        const { error: insertError } = await supabase
          .from("activities")
          .upsert({
            fellow_id: fellow.id,
            activity_type: config.activityType,
            source_name: sourceName,
            source_url: result.link,
            source_domain: sourceName,
            title: result.title,
            snippet: result.snippet || "",
            image_url: result.thumbnail || null,
            published_at: result.date || null,
            search_query: config.buildQuery(fellow),
            relevance_score: result.relevanceScore,
            verified: false,
            dismissed: false,
            notified: false,
          }, {
            onConflict: "fellow_id,source_url",
            ignoreDuplicates: true,
          });

        if (!insertError) {
          activitiesFound++;
          byPlatform[result.source] = (byPlatform[result.source] || 0) + 1;
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
        byPlatform,
      });

      console.log(`${fellow.first_name} ${fellow.last_name}: ${activitiesFound} results`);
    }

    // Search custom terms independently and link results to fellows
    let customTermResults = 0;
    if (customTerms.length > 0) {
      console.log(`Searching ${customTerms.length} custom terms...`);

      for (const term of customTerms) {
        const termResults = await searchCustomTerm(term, SERPAPI_KEY);

        for (const item of termResults) {
          // Check if this result mentions any fellow's name
          for (const fellow of fellows as Fellow[]) {
            if (!resultMentionsFellow(fellow, item.title, item.snippet)) continue;
            if (seenUrls.has(`${fellow.id}:${item.link}`)) continue;
            seenUrls.add(`${fellow.id}:${item.link}`);

            let sourceName = 'Unknown';
            try {
              sourceName = new URL(item.link).hostname.replace('www.', '');
            } catch { /* ignore invalid URLs */ }

            const { error: insertError } = await supabase
              .from("activities")
              .upsert({
                fellow_id: fellow.id,
                activity_type: 'news_mention',
                source_name: sourceName,
                source_url: item.link,
                source_domain: sourceName,
                title: item.title,
                snippet: item.snippet || "",
                image_url: item.thumbnail || null,
                published_at: item.date || null,
                search_query: `"${term}"`,
                relevance_score: 0.6,
                verified: false,
                dismissed: false,
                notified: false,
              }, {
                onConflict: "fellow_id,source_url",
                ignoreDuplicates: true,
              });

            if (!insertError) {
              customTermResults++;
              // Update the fellow's result count
              const existing = results.find(r => r.fellow === `${fellow.first_name} ${fellow.last_name}`);
              if (existing) {
                existing.activitiesFound++;
                existing.byPlatform['custom_term'] = (existing.byPlatform['custom_term'] || 0) + 1;
              }
            }
          }
        }

        // Delay between custom term searches
        await new Promise(resolve => setTimeout(resolve, 200));
      }

      console.log(`Custom term searches found ${customTermResults} fellow-linked results`);
    }

    const totalFound = results.reduce((sum, r) => sum + r.activitiesFound, 0);

    return new Response(
      JSON.stringify({
        success: true,
        fellowsSearched: results.length,
        platformsSearched: platforms,
        customTermsSearched: customTerms.length,
        customTermResults,
        totalFound,
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
