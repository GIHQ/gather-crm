import { useEffect, useState } from 'react'
import { useAuth } from '../contexts/AuthContext'
import { supabase } from '../lib/supabase'

export default function TeamPage() {
  const { hasRole } = useAuth()
  const [members, setMembers] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function fetchTeam() {
      const { data } = await supabase
        .from('contact_roles')
        .select('role, contacts (id, first_name, last_name, email, photo_url)')
        .in('role', ['super_admin', 'admin', 'manager', 'team'])

      setMembers(data || [])
      setLoading(false)
    }
    fetchTeam()
  }, [])

  if (!hasRole('admin')) {
    return <div className="text-center py-20 text-gray-500">Access denied.</div>
  }

  return (
    <div>
      <h2 className="text-2xl font-bold text-gray-900 mb-6">Team Management</h2>

      {loading ? (
        <div className="text-gray-400 py-8">Loading team...</div>
      ) : members.length === 0 ? (
        <div className="text-gray-400 py-8 text-center">No team members found.</div>
      ) : (
        <div className="bg-white rounded-2xl border border-gray-200 overflow-hidden">
          <table className="w-full text-sm">
            <thead className="bg-gray-50 border-b border-gray-200">
              <tr>
                <th className="text-left px-4 py-3 font-medium text-gray-700">Name</th>
                <th className="text-left px-4 py-3 font-medium text-gray-700">Email</th>
                <th className="text-left px-4 py-3 font-medium text-gray-700">Role</th>
              </tr>
            </thead>
            <tbody>
              {members.map((m, i) => (
                <tr key={i} className="border-b border-gray-100 last:border-0">
                  <td className="px-4 py-3 font-medium text-gray-900">
                    {m.contacts?.first_name} {m.contacts?.last_name}
                  </td>
                  <td className="px-4 py-3 text-gray-500">{m.contacts?.email}</td>
                  <td className="px-4 py-3">
                    <span className="px-2 py-0.5 rounded-full text-xs font-medium bg-goldin/10 text-goldin capitalize">
                      {m.role.replace('_', ' ')}
                    </span>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      )}
    </div>
  )
}
