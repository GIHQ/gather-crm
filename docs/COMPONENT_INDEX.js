/*
 * ============================================================================
 * GATHER - Alumni Network CRM for Goldin Institute
 * ============================================================================
 * 
 * Single-file React application. Components listed below in order of appearance.
 * 
 * COMPONENT INDEX
 * ---------------
 * 
 * CORE / ROUTING
 *   App                          - Main app shell, routing, auth state
 *   ProtectedRoute               - Auth wrapper for protected pages
 * 
 * ONBOARDING
 *   LanguageSelector             - Initial language selection screen
 *   NotificationSetupScreen      - Push notification opt-in during onboarding
 * 
 * LAYOUT
 *   MobileNav                    - Bottom navigation bar
 *   Sidebar                      - Desktop sidebar / mobile drawer
 *   Header                       - Page headers with back button
 * 
 * PAGES
 *   Dashboard                    - Staff dashboard with health metrics
 *   Directory                    - Fellow listing with search/filter
 *   FellowProfile                - Individual fellow detail view
 *   ActivityPage                 - Interaction log / activity feed
 *   SearchPage                   - Global search
 *   SettingsPage                 - User settings hub
 *   CohortCommunication          - Bulk email composer
 * 
 * MODALS
 *   NotificationSettingsModal    - Notification preferences (FIXED Feb 5 2026)
 *   AddInteractionModal          - Log new interaction with fellow
 *   FocusAreaModal               - Edit fellow focus areas
 *   ContactModal                 - Quick contact options (call/email/etc)
 *   LanguageModal                - Change display language
 *   CreateProfileModal           - Staff self-registration
 * 
 * FEATURES
 *   NewsScannerCard              - News & social mention scanner
 *   HealthTrendChart             - Network health visualization
 *   ProgramBadge                 - CPF/GGF/ESP colored badges
 *   FellowCard                   - Fellow list item component
 *   InteractionCard              - Activity/interaction list item
 *   Toggle                       - Reusable toggle switch
 * 
 * UTILITIES
 *   useLocalStorage              - Persistent state hook
 *   useSupabase                  - Supabase client hook
 *   formatDate                   - Date formatting helper
 *   translateText                - i18n translation helper
 * 
 * ============================================================================
 * STYLE REFERENCE
 * ============================================================================
 * 
 * Brand Orange:  #E87722 (tailwind: orange-500 or goldin-orange)
 * CPF Badge:     bg-blue-700
 * GGF Badge:     bg-orange-500  
 * ESP Badge:     bg-orange-700
 * 
 * ============================================================================
 */
