import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { supabase } from '../lib/supabase'

export default function DashboardPage() {
  const { contact, role, isTeam } = useAuth()
  const [stats, setStats] = useState({ contacts: 0, cohorts: 0, liveCohorts: 0 })
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function fetchStats() {
      const [contactsRes, cohortsRes] = await Promise.all([
        supabase.from('contacts').select('id', { count: 'exact', head: true }),
        supabase.from('cohorts').select('id, status'),
      ])

      const cohorts = cohortsRes.data || []
      setStats({
        contacts: contactsRes.count || 0,
        cohorts: cohorts.length,
        liveCohorts: cohorts.filter(c => c.status === 'live').length,
      })
      setLoading(false)
    }
    fetchStats()
  }, [])

  return (
    <div>
      <div className="mb-6">
        <h2 className="text-2xl font-bold text-gray-900">
          Welcome back{contact ? `, ${contact.first_name}` : ''}
        </h2>
        <p className="text-sm text-gray-500 mt-1 capitalize">{role}</p>
      </div>

      {loading ? (
        <div className="text-gray-400 py-8">Loading...</div>
      ) : (
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          <StatCard
            label="Total Contacts"
            value={stats.contacts}
            to="/alumni"
          />
          {isTeam && (
            <>
              <StatCard
                label="Live Cohorts"
                value={stats.liveCohorts}
                to="/cohorts"
              />
              <StatCard
                label="All Cohorts"
                value={stats.cohorts}
                to="/cohorts"
              />
            </>
          )}
        </div>
      )}
    </div>
  )
}

function StatCard({ label, value, to }) {
  return (
    <Link
      to={to}
      className="bg-white rounded-2xl border border-gray-200 p-5 hover:shadow-md transition-shadow"
    >
      <p className="text-xs font-medium text-gray-400 uppercase tracking-wider">{label}</p>
      <p className="text-3xl font-bold text-gray-900 mt-1">{value}</p>
    </Link>
  )
}
