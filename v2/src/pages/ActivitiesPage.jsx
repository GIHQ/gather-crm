import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { supabase } from '../lib/supabase'
import DOMPurify from 'dompurify'

const ACTIVITY_TYPES = ['news_mention', 'social_media', 'publication', 'award', 'event', 'other']

const TYPE_LABELS = {
  news_mention: 'News',
  social_media: 'Social Media',
  publication: 'Publication',
  award: 'Award',
  event: 'Event',
  other: 'Other',
}

const TYPE_COLORS = {
  news_mention: 'bg-blue-50 text-blue-700',
  social_media: 'bg-pink-50 text-pink-700',
  publication: 'bg-purple-50 text-purple-700',
  award: 'bg-yellow-50 text-yellow-700',
  event: 'bg-green-50 text-green-700',
  other: 'bg-gray-100 text-gray-600',
}

export default function ActivitiesPage() {
  const { hasRole } = useAuth()
  const [activities, setActivities] = useState([])
  const [search, setSearch] = useState('')
  const [typeFilter, setTypeFilter] = useState('')
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function fetchActivities() {
      const { data, error } = await supabase
        .from('activities')
        .select(`
          id, activity_type, title, source_url, source_name, snippet, activity_date, created_at,
          contacts (id, first_name, last_name, photo_url)
        `)
        .order('activity_date', { ascending: false })
        .limit(200)

      if (!error && data) {
        setActivities(data)
      }
      setLoading(false)
    }
    if (hasRole('team')) {
      fetchActivities()
    } else {
      setLoading(false)
    }
  }, [])

  if (!hasRole('team')) {
    return <div className="text-center py-20 text-gray-500">Access denied.</div>
  }

  const filtered = activities.filter(a => {
    if (typeFilter && a.activity_type !== typeFilter) return false
    if (search) {
      const q = search.toLowerCase()
      const contactName = `${a.contacts?.first_name || ''} ${a.contacts?.last_name || ''}`.toLowerCase()
      return (
        contactName.includes(q) ||
        a.title?.toLowerCase().includes(q) ||
        a.source_name?.toLowerCase().includes(q) ||
        a.snippet?.toLowerCase().includes(q)
      )
    }
    return true
  })

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <h2 className="text-2xl font-bold text-gray-900">Activities</h2>
        <span className="text-sm text-gray-400">{filtered.length} activities</span>
      </div>

      {/* Filters */}
      <div className="flex flex-col sm:flex-row gap-3 mb-6">
        <input
          type="text"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          placeholder="Search by contact name, title, or source..."
          className="flex-1 px-4 py-2.5 border border-gray-300 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-goldin/50 focus:border-goldin"
        />
        <select
          value={typeFilter}
          onChange={(e) => setTypeFilter(e.target.value)}
          className="px-3 py-2.5 border border-gray-300 rounded-xl text-sm bg-white focus:outline-none focus:ring-2 focus:ring-goldin/50 focus:border-goldin"
        >
          <option value="">All Types</option>
          {ACTIVITY_TYPES.map(t => (
            <option key={t} value={t}>{TYPE_LABELS[t] || t}</option>
          ))}
        </select>
      </div>

      {loading ? (
        <div className="text-center py-20 text-gray-400">Loading activities...</div>
      ) : filtered.length === 0 ? (
        <div className="text-center py-20 text-gray-400">
          {search || typeFilter ? 'No matching activities.' : 'No activities tracked yet.'}
        </div>
      ) : (
        <div className="space-y-2">
          {filtered.map(activity => (
            <ActivityRow key={activity.id} activity={activity} />
          ))}
        </div>
      )}
    </div>
  )
}

function ActivityRow({ activity }) {
  const contact = activity.contacts
  const date = activity.activity_date ? new Date(activity.activity_date) : null

  return (
    <div className="bg-white rounded-xl border border-gray-200 p-4 hover:shadow-sm transition-shadow">
      <div className="flex items-start gap-3">
        {/* Contact avatar */}
        {contact && (
          <Link to={`/contacts/${contact.id}`} className="flex-shrink-0">
            <div className="w-10 h-10 rounded-full bg-gray-200 overflow-hidden">
              {contact.photo_url ? (
                <img src={contact.photo_url} alt="" className="w-full h-full object-cover" />
              ) : (
                <div className="w-full h-full flex items-center justify-center text-gray-400 text-xs font-semibold">
                  {contact.first_name?.[0]}{contact.last_name?.[0]}
                </div>
              )}
            </div>
          </Link>
        )}

        <div className="flex-1 min-w-0">
          <div className="flex items-center gap-2 flex-wrap">
            {contact && (
              <Link to={`/contacts/${contact.id}`} className="font-medium text-sm text-gray-900 hover:text-goldin">
                {contact.first_name} {contact.last_name}
              </Link>
            )}
            <span className={`text-xs font-medium px-2 py-0.5 rounded-full ${TYPE_COLORS[activity.activity_type] || TYPE_COLORS.other}`}>
              {TYPE_LABELS[activity.activity_type] || activity.activity_type}
            </span>
          </div>

          <p className="text-sm text-gray-700 mt-0.5 font-medium">
            {activity.source_url ? (
              <a href={activity.source_url} target="_blank" rel="noopener noreferrer" className="hover:text-goldin">
                {activity.title}
              </a>
            ) : (
              activity.title
            )}
          </p>

          {activity.snippet && (
            <p
              className="text-xs text-gray-500 mt-1 line-clamp-2"
              dangerouslySetInnerHTML={{ __html: DOMPurify.sanitize(activity.snippet) }}
            />
          )}

          <div className="flex items-center gap-3 mt-2 text-xs text-gray-400">
            {date && (
              <span>{date.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })}</span>
            )}
            {activity.source_name && (
              <span>{activity.source_name}</span>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}
