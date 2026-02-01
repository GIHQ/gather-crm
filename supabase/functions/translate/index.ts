// GATHER CRM - Translation Edge Function
// Proxies translation requests to Google Translate API with server-side API key

import { serve } from "https://deno.land/std@0.168.0/http/server.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
};

serve(async (req) => {
  // Handle CORS preflight
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    const GOOGLE_TRANSLATE_API_KEY = Deno.env.get("GOOGLE_TRANSLATE_API_KEY");

    if (!GOOGLE_TRANSLATE_API_KEY) {
      throw new Error("Missing GOOGLE_TRANSLATE_API_KEY");
    }

    const body = await req.json();
    const { texts, targetLang, sourceLang = "en" } = body;

    if (!texts || !Array.isArray(texts) || texts.length === 0) {
      throw new Error("Missing or invalid 'texts' array");
    }

    if (!targetLang) {
      throw new Error("Missing 'targetLang'");
    }

    // Call Google Translate API
    const response = await fetch(
      `https://translation.googleapis.com/language/translate/v2?key=${GOOGLE_TRANSLATE_API_KEY}`,
      {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          q: texts,
          target: targetLang,
          source: sourceLang,
        }),
      }
    );

    const data = await response.json();

    if (!response.ok) {
      throw new Error(data.error?.message || "Translation API error");
    }

    return new Response(JSON.stringify(data), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (error) {
    console.error("Translation error:", error);
    return new Response(
      JSON.stringify({ error: error.message }),
      {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  }
});
