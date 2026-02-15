import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { supabase } from '../lib/supabase'

const ROLE_ORDER = { super_admin: 0, admin: 1, manager: 2, team: 3 }

export default function TeamPage() {
  const { hasRole } = useAuth()
  const [members, setMembers] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function fetchTeam() {
      const { data } = await supabase
        .from('contact_roles')
        .select('role, contacts (id, first_name, last_name, email, photo_url, job_title, phone)')
        .in('role', ['super_admin', 'admin', 'manager', 'team'])

      // Deduplicate by contact id, keeping highest role
      const contactMap = new Map()
      for (const row of (data || [])) {
        if (!row.contacts?.id) continue
        const existing = contactMap.get(row.contacts.id)
        if (!existing || (ROLE_ORDER[row.role] ?? 99) < (ROLE_ORDER[existing.role] ?? 99)) {
          contactMap.set(row.contacts.id, { ...row.contacts, role: row.role })
        }
      }

      const sorted = [...contactMap.values()].sort((a, b) => {
        const ra = ROLE_ORDER[a.role] ?? 99
        const rb = ROLE_ORDER[b.role] ?? 99
        if (ra !== rb) return ra - rb
        return (a.first_name || '').localeCompare(b.first_name || '')
      })

      setMembers(sorted)
      setLoading(false)
    }
    fetchTeam()
  }, [])

  if (!hasRole('admin')) {
    return <div className="text-center py-20 text-gray-500">Access denied.</div>
  }

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <h2 className="text-2xl font-bold text-gray-900">Team Management</h2>
        <span className="text-sm text-gray-400">{members.length} members</span>
      </div>

      {loading ? (
        <div className="text-gray-400 py-8">Loading team...</div>
      ) : members.length === 0 ? (
        <div className="text-gray-400 py-8 text-center">No team members found.</div>
      ) : (
        <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
          {members.map(member => (
            <Link
              key={member.id}
              to={`/contacts/${member.id}`}
              className="bg-white rounded-2xl border border-gray-200 p-5 hover:shadow-md transition-shadow"
            >
              <div className="flex items-center gap-3 mb-3">
                <div className="w-12 h-12 rounded-full bg-gray-200 overflow-hidden flex-shrink-0">
                  {member.photo_url ? (
                    <img src={member.photo_url} alt="" className="w-full h-full object-cover" />
                  ) : (
                    <div className="w-full h-full flex items-center justify-center text-gray-400 text-sm font-semibold">
                      {member.first_name?.[0]}{member.last_name?.[0]}
                    </div>
                  )}
                </div>
                <div className="min-w-0">
                  <p className="font-semibold text-gray-900 text-sm truncate">
                    {member.first_name} {member.last_name}
                  </p>
                  <span className="px-2 py-0.5 rounded-full text-xs font-medium bg-goldin/10 text-goldin capitalize">
                    {member.role.replace('_', ' ')}
                  </span>
                </div>
              </div>
              {member.job_title && (
                <p className="text-xs text-gray-500 mb-1">{member.job_title}</p>
              )}
              {member.email && (
                <p className="text-xs text-gray-400 truncate">{member.email}</p>
              )}
              {member.phone && (
                <p className="text-xs text-gray-400">{member.phone}</p>
              )}
            </Link>
          ))}
        </div>
      )}
    </div>
  )
}
