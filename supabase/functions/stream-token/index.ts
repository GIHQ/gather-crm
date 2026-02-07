// GATHER CRM - GetStream Token Minting Edge Function
// Mints GetStream user tokens for authenticated Supabase users.
// Also syncs the user to GetStream if they don't exist there yet.

import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";
import { create, getNumericDate } from "https://deno.land/x/djwt@v3.0.1/mod.ts";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers":
    "authorization, x-client-info, apikey, content-type",
};

/**
 * Sign a GetStream JWT token.
 * GetStream tokens are HS256 JWTs with payload: { user_id: string }
 */
async function mintStreamToken(
  userId: string,
  secret: string
): Promise<string> {
  const encoder = new TextEncoder();
  const keyData = encoder.encode(secret);
  const key = await crypto.subtle.importKey(
    "raw",
    keyData,
    { name: "HMAC", hash: "SHA-256" },
    false,
    ["sign", "verify"]
  );

  const token = await create(
    { alg: "HS256", typ: "JWT" },
    { user_id: userId },
    key
  );

  return token;
}

serve(async (req) => {
  // Handle CORS preflight
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    const GETSTREAM_API_KEY = Deno.env.get("GETSTREAM_API_KEY");
    const GETSTREAM_SECRET = Deno.env.get("GETSTREAM_SECRET");
    const SUPABASE_URL = Deno.env.get("SUPABASE_URL");
    const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

    if (!GETSTREAM_API_KEY || !GETSTREAM_SECRET) {
      throw new Error("Missing GetStream credentials");
    }
    if (!SUPABASE_URL || !SUPABASE_SERVICE_ROLE_KEY) {
      throw new Error("Missing Supabase credentials");
    }

    // Verify the user is authenticated via the Authorization header
    const authHeader = req.headers.get("Authorization");
    if (!authHeader) {
      return new Response(
        JSON.stringify({ error: "Missing Authorization header" }),
        {
          status: 401,
          headers: { ...corsHeaders, "Content-Type": "application/json" },
        }
      );
    }

    // Create a Supabase client scoped to the user to verify auth
    const supabaseUser = createClient(
      SUPABASE_URL,
      Deno.env.get("SUPABASE_ANON_KEY") || SUPABASE_SERVICE_ROLE_KEY,
      {
        global: { headers: { Authorization: authHeader } },
      }
    );

    const {
      data: { user },
      error: authError,
    } = await supabaseUser.auth.getUser();

    if (authError || !user) {
      return new Response(
        JSON.stringify({ error: "Invalid or expired token" }),
        {
          status: 401,
          headers: { ...corsHeaders, "Content-Type": "application/json" },
        }
      );
    }

    const userId = user.id;

    // Service-role client for DB operations (bypasses RLS)
    const supabaseAdmin = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY);

    // Check for a cached, non-expired token
    const { data: cached } = await supabaseAdmin
      .from("stream_tokens")
      .select("token, expires_at")
      .eq("user_id", userId)
      .single();

    if (cached && new Date(cached.expires_at) > new Date()) {
      return new Response(
        JSON.stringify({
          token: cached.token,
          api_key: GETSTREAM_API_KEY,
          user_id: userId,
        }),
        {
          headers: { ...corsHeaders, "Content-Type": "application/json" },
        }
      );
    }

    // Mint a new token
    const token = await mintStreamToken(userId, GETSTREAM_SECRET);

    // Upsert the user in GetStream via REST API
    // This ensures the user exists as a Stream user
    const streamBaseUrl = `https://chat.stream-io-api.com`;
    const upsertResponse = await fetch(
      `${streamBaseUrl}/users?api_key=${GETSTREAM_API_KEY}`,
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: token,
          "stream-auth-type": "jwt",
        },
        body: JSON.stringify({
          users: {
            [userId]: {
              id: userId,
              name: user.user_metadata?.full_name || user.email || userId,
              image: user.user_metadata?.avatar_url || "",
            },
          },
        }),
      }
    );

    if (!upsertResponse.ok) {
      const errBody = await upsertResponse.text();
      console.error("GetStream user upsert failed:", errBody);
      // Non-fatal: token is still valid even if user sync fails
      // The user will be auto-created on first connection
    }

    // Cache the token with 24-hour expiry
    const expiresAt = new Date(Date.now() + 24 * 60 * 60 * 1000).toISOString();

    await supabaseAdmin.from("stream_tokens").upsert(
      {
        user_id: userId,
        token,
        expires_at: expiresAt,
        created_at: new Date().toISOString(),
      },
      { onConflict: "user_id" }
    );

    return new Response(
      JSON.stringify({
        token,
        api_key: GETSTREAM_API_KEY,
        user_id: userId,
      }),
      {
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  } catch (error) {
    console.error("stream-token error:", error);
    return new Response(JSON.stringify({ error: error.message }), {
      status: 500,
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }
});
