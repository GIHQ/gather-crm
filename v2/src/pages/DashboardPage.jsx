import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { supabase } from '../lib/supabase'

export default function DashboardPage() {
  const { contact, role, isTeam } = useAuth()
  const [stats, setStats] = useState({ contacts: 0, cohorts: 0, liveCohorts: 0, interactions: 0, activities: 0 })
  const [recentInteractions, setRecentInteractions] = useState([])
  const [recentActivities, setRecentActivities] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function fetchDashboard() {
      const queries = [
        supabase.from('contacts').select('id', { count: 'exact', head: true }),
        supabase.from('cohorts').select('id, status'),
      ]

      if (isTeam) {
        queries.push(
          supabase.from('interactions').select('id', { count: 'exact', head: true }),
          supabase.from('activities').select('id', { count: 'exact', head: true }),
          supabase
            .from('interactions')
            .select('id, interaction_type, interaction_date, title, contacts!interactions_contact_id_fkey (id, first_name, last_name)')
            .order('interaction_date', { ascending: false })
            .limit(5),
          supabase
            .from('activities')
            .select('id, activity_type, title, activity_date, contacts (id, first_name, last_name)')
            .order('activity_date', { ascending: false })
            .limit(5),
        )
      }

      const results = await Promise.all(queries)

      const cohorts = results[1].data || []
      setStats({
        contacts: results[0].count || 0,
        cohorts: cohorts.length,
        liveCohorts: cohorts.filter(c => c.status === 'live').length,
        interactions: isTeam ? (results[2].count || 0) : 0,
        activities: isTeam ? (results[3].count || 0) : 0,
      })

      if (isTeam) {
        setRecentInteractions(results[4].data || [])
        setRecentActivities(results[5].data || [])
      }

      setLoading(false)
    }
    fetchDashboard()
  }, [isTeam])

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
        <>
          {/* Stats */}
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-4 mb-8">
            <StatCard label="Total Contacts" value={stats.contacts} to="/alumni" />
            {isTeam && (
              <>
                <StatCard label="Live Cohorts" value={stats.liveCohorts} to="/cohorts" />
                <StatCard label="Interactions" value={stats.interactions} to="/interactions" />
                <StatCard label="Activities" value={stats.activities} to="/activities" />
              </>
            )}
          </div>

          {/* Recent activity feeds */}
          {isTeam && (
            <div className="grid gap-6 lg:grid-cols-2">
              {/* Recent interactions */}
              <div className="bg-white rounded-2xl border border-gray-200 p-5">
                <div className="flex items-center justify-between mb-4">
                  <h3 className="font-semibold text-gray-900">Recent Interactions</h3>
                  <Link to="/interactions" className="text-xs text-goldin hover:underline">View all</Link>
                </div>
                {recentInteractions.length === 0 ? (
                  <p className="text-sm text-gray-400 py-4 text-center">No interactions yet.</p>
                ) : (
                  <div className="space-y-3">
                    {recentInteractions.map(i => (
                      <div key={i.id} className="flex items-center gap-3">
                        <span className={`w-2 h-2 rounded-full flex-shrink-0 ${
                          i.interaction_type === 'email' ? 'bg-blue-400'
                          : i.interaction_type === 'call' ? 'bg-green-400'
                          : i.interaction_type === 'meeting' ? 'bg-purple-400'
                          : 'bg-gray-300'
                        }`} />
                        <div className="min-w-0 flex-1">
                          <div className="flex items-center gap-2">
                            <Link to={`/contacts/${i.contacts?.id}`} className="text-sm font-medium text-gray-900 hover:text-goldin truncate">
                              {i.contacts?.first_name} {i.contacts?.last_name}
                            </Link>
                            <span className="text-xs text-gray-400 flex-shrink-0">{i.interaction_type}</span>
                          </div>
                          {i.title && <p className="text-xs text-gray-500 truncate">{i.title}</p>}
                        </div>
                        <span className="text-xs text-gray-400 flex-shrink-0">
                          {new Date(i.interaction_date).toLocaleDateString('en-US', { month: 'short', day: 'numeric' })}
                        </span>
                      </div>
                    ))}
                  </div>
                )}
              </div>

              {/* Recent activities */}
              <div className="bg-white rounded-2xl border border-gray-200 p-5">
                <div className="flex items-center justify-between mb-4">
                  <h3 className="font-semibold text-gray-900">Recent Activities</h3>
                  <Link to="/activities" className="text-xs text-goldin hover:underline">View all</Link>
                </div>
                {recentActivities.length === 0 ? (
                  <p className="text-sm text-gray-400 py-4 text-center">No activities yet.</p>
                ) : (
                  <div className="space-y-3">
                    {recentActivities.map(a => (
                      <div key={a.id} className="flex items-center gap-3">
                        <span className={`w-2 h-2 rounded-full flex-shrink-0 ${
                          a.activity_type === 'news_mention' ? 'bg-blue-400'
                          : a.activity_type === 'social_media' ? 'bg-pink-400'
                          : a.activity_type === 'award' ? 'bg-yellow-400'
                          : 'bg-gray-300'
                        }`} />
                        <div className="min-w-0 flex-1">
                          <div className="flex items-center gap-2">
                            {a.contacts && (
                              <Link to={`/contacts/${a.contacts.id}`} className="text-sm font-medium text-gray-900 hover:text-goldin truncate">
                                {a.contacts.first_name} {a.contacts.last_name}
                              </Link>
                            )}
                            <span className="text-xs text-gray-400 flex-shrink-0">{a.activity_type?.replace('_', ' ')}</span>
                          </div>
                          {a.title && <p className="text-xs text-gray-500 truncate">{a.title}</p>}
                        </div>
                        {a.activity_date && (
                          <span className="text-xs text-gray-400 flex-shrink-0">
                            {new Date(a.activity_date).toLocaleDateString('en-US', { month: 'short', day: 'numeric' })}
                          </span>
                        )}
                      </div>
                    ))}
                  </div>
                )}
              </div>
            </div>
          )}
        </>
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
