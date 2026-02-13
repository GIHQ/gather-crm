// GATHER CRM - Send Newsletter via Buttondown API
// Creates and sends a newsletter email to fellows through Buttondown.
// Supports targeting specific programs/cohorts via Buttondown tags.

import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "https://esm.sh/@supabase/supabase-js@2";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers":
    "authorization, x-client-info, apikey, content-type",
};

serve(async (req) => {
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  try {
    const BUTTONDOWN_API_KEY = Deno.env.get("BUTTONDOWN_API_KEY");
    const SUPABASE_URL = Deno.env.get("SUPABASE_URL");
    const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY");

    if (!BUTTONDOWN_API_KEY) {
      throw new Error("Missing BUTTONDOWN_API_KEY");
    }
    if (!SUPABASE_URL || !SUPABASE_SERVICE_ROLE_KEY) {
      throw new Error("Missing Supabase credentials");
    }

    // Verify the user is authenticated and is staff
    const authHeader = req.headers.get("Authorization");
    if (!authHeader) {
      return new Response(
        JSON.stringify({ error: "Missing Authorization header" }),
        { status: 401, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    const supabaseUser = createClient(
      SUPABASE_URL,
      Deno.env.get("SUPABASE_ANON_KEY") || SUPABASE_SERVICE_ROLE_KEY,
      { global: { headers: { Authorization: authHeader } } }
    );

    const { data: { user }, error: authError } = await supabaseUser.auth.getUser();
    if (authError || !user) {
      return new Response(
        JSON.stringify({ error: "Invalid or expired token" }),
        { status: 401, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    // Check staff role via team_members table
    const supabaseAdmin = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY);

    const { data: teamMember } = await supabaseAdmin
      .from("team_members")
      .select("role")
      .eq("user_id", user.id)
      .single();

    if (!teamMember) {
      return new Response(
        JSON.stringify({ error: "Only staff members can send newsletters" }),
        { status: 403, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    // Parse request body
    const { subject, body, target_programs, newsletter_send_id } = await req.json();

    if (!subject || !body) {
      return new Response(
        JSON.stringify({ error: "subject and body are required" }),
        { status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    // Build the Buttondown email payload
    const emailPayload: Record<string, unknown> = {
      subject,
      body,
      // Omitting status sends immediately to all subscribers
    };

    // If targeting specific programs/cohorts, create as draft first and
    // include tag filters. Buttondown auto-creates tags if they don't exist.
    if (target_programs && target_programs.length > 0) {
      // Use Buttondown's tag-based email type to restrict audience.
      // Tags in Gather map to cohort values (e.g., "2019", "CPF").
      // We tagged subscribers with program (CPF/GGF/ESP) and cohort-YYYY.
      // The target_programs array from the frontend contains cohort values.
      emailPayload.filters = {
        filters: target_programs.map((tag: string) => ({
          field: "tag",
          operator: "is",
          value: tag,
        })),
        groups: [],
        predicate: "or",
      };
    }

    // Send via Buttondown API
    const buttondownRes = await fetch("https://api.buttondown.com/v1/emails", {
      method: "POST",
      headers: {
        Authorization: `Token ${BUTTONDOWN_API_KEY}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify(emailPayload),
    });

    const buttondownData = await buttondownRes.json();

    if (!buttondownRes.ok) {
      console.error("Buttondown API error:", JSON.stringify(buttondownData));
      return new Response(
        JSON.stringify({
          error: "Failed to send via Buttondown",
          details: buttondownData,
        }),
        { status: 502, headers: { ...corsHeaders, "Content-Type": "application/json" } }
      );
    }

    // Update newsletter_sends record with Buttondown ID
    if (newsletter_send_id && buttondownData.id) {
      await supabaseAdmin
        .from("newsletter_sends")
        .update({ buttondown_id: buttondownData.id })
        .eq("id", newsletter_send_id);
    }

    return new Response(
      JSON.stringify({
        success: true,
        buttondown_id: buttondownData.id,
        status: buttondownData.status,
      }),
      { headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  } catch (error) {
    console.error("send-newsletter error:", error);
    return new Response(
      JSON.stringify({ error: error.message }),
      { status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" } }
    );
  }
});
