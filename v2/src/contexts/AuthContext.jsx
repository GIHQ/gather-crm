import { createContext, useContext, useEffect, useState } from 'react'
import { supabase } from '../lib/supabase'

const AuthContext = createContext(null)

const ROLE_LEVELS = {
  super_admin: 6,
  admin: 5,
  manager: 4,
  team: 3.5,
  fellow: 3,
  viewer: 2,
  guest: 1,
}

export function AuthProvider({ children }) {
  const [session, setSession] = useState(null)
  const [user, setUser] = useState(null)
  const [contact, setContact] = useState(null)
  const [role, setRole] = useState('guest')
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    const { data: { subscription } } = supabase.auth.onAuthStateChange(
      async (event, session) => {
        setSession(session)

        if (session?.user) {
          setUser(session.user)
          await resolveRole(session.user.email)
        } else {
          setUser(null)
          setContact(null)
          setRole('guest')
        }

        setLoading(false)
      }
    )

    return () => subscription.unsubscribe()
  }, [])

  async function resolveRole(email) {
    if (!email) {
      setRole('viewer')
      return
    }

    const lowerEmail = email.toLowerCase()

    // Look up contact by email or alternate_emails
    const { data: contactData } = await supabase
      .from('contacts')
      .select('id, first_name, last_name, email, photo_url')
      .or(`email.ilike.${lowerEmail},alternate_emails.cs.{${lowerEmail}}`)
      .limit(1)
      .single()

    if (!contactData) {
      setRole('viewer')
      return
    }

    setContact(contactData)

    // Get roles for this contact
    const { data: roles } = await supabase
      .from('contact_roles')
      .select('role')
      .eq('contact_id', contactData.id)

    if (!roles || roles.length === 0) {
      setRole('viewer')
      return
    }

    // Return highest role
    const highestRole = roles.reduce((best, r) =>
      (ROLE_LEVELS[r.role] || 0) > (ROLE_LEVELS[best] || 0) ? r.role : best
    , 'viewer')

    setRole(highestRole)
  }

  async function signIn(email) {
    const { error } = await supabase.auth.signInWithOtp({ email })
    return { error }
  }

  async function verifyOtp(email, token) {
    const { data, error } = await supabase.auth.verifyOtp({
      email,
      token,
      type: 'email',
    })
    return { data, error }
  }

  async function signOut() {
    await supabase.auth.signOut()
    setSession(null)
    setUser(null)
    setContact(null)
    setRole('guest')
  }

  function hasRole(minRole) {
    return (ROLE_LEVELS[role] || 0) >= (ROLE_LEVELS[minRole] || 0)
  }

  const value = {
    session,
    user,
    contact,
    role,
    loading,
    signIn,
    verifyOtp,
    signOut,
    hasRole,
    isTeam: hasRole('team'),
    isAdmin: hasRole('admin'),
  }

  return (
    <AuthContext.Provider value={value}>
      {children}
    </AuthContext.Provider>
  )
}

export function useAuth() {
  const context = useContext(AuthContext)
  if (!context) {
    throw new Error('useAuth must be used within an AuthProvider')
  }
  return context
}
