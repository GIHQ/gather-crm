import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { supabase } from '../lib/supabase'

const INTERACTION_TYPES = ['email', 'call', 'meeting', 'text', 'social_media', 'other']

const TYPE_COLORS = {
  email: 'bg-blue-50 text-blue-700',
  call: 'bg-green-50 text-green-700',
  meeting: 'bg-purple-50 text-purple-700',
  text: 'bg-yellow-50 text-yellow-700',
  social_media: 'bg-pink-50 text-pink-700',
  other: 'bg-gray-100 text-gray-600',
}

export default function InteractionsPage() {
  const { hasRole } = useAuth()
  const [interactions, setInteractions] = useState([])
  const [search, setSearch] = useState('')
  const [typeFilter, setTypeFilter] = useState('')
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function fetchInteractions() {
      const { data, error } = await supabase
        .from('interactions')
        .select(`
          id, interaction_type, interaction_date, title, notes, is_private,
          contacts!interactions_contact_id_fkey (id, first_name, last_name, photo_url),
          team_member:contacts!interactions_team_member_id_fkey (id, first_name, last_name)
        `)
        .order('interaction_date', { ascending: false })
        .limit(200)

      if (!error && data) {
        setInteractions(data)
      }
      setLoading(false)
    }
    if (hasRole('team')) {
      fetchInteractions()
    } else {
      setLoading(false)
    }
  }, [])

  if (!hasRole('team')) {
    return <div className="text-center py-20 text-gray-500">Access denied.</div>
  }

  const filtered = interactions.filter(i => {
    if (typeFilter && i.interaction_type !== typeFilter) return false
    if (search) {
      const q = search.toLowerCase()
      const contactName = `${i.contacts?.first_name || ''} ${i.contacts?.last_name || ''}`.toLowerCase()
      return (
        contactName.includes(q) ||
        i.title?.toLowerCase().includes(q) ||
        i.notes?.toLowerCase().includes(q)
      )
    }
    return true
  })

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <h2 className="text-2xl font-bold text-gray-900">Interactions</h2>
        <span className="text-sm text-gray-400">{filtered.length} interactions</span>
      </div>

      {/* Filters */}
      <div className="flex flex-col sm:flex-row gap-3 mb-6">
        <input
          type="text"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          placeholder="Search by contact name, title, or notes..."
          className="flex-1 px-4 py-2.5 border border-gray-300 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-goldin/50 focus:border-goldin"
        />
        <select
          value={typeFilter}
          onChange={(e) => setTypeFilter(e.target.value)}
          className="px-3 py-2.5 border border-gray-300 rounded-xl text-sm bg-white focus:outline-none focus:ring-2 focus:ring-goldin/50 focus:border-goldin"
        >
          <option value="">All Types</option>
          {INTERACTION_TYPES.map(t => (
            <option key={t} value={t}>{t.replace('_', ' ')}</option>
          ))}
        </select>
      </div>

      {loading ? (
        <div className="text-center py-20 text-gray-400">Loading interactions...</div>
      ) : filtered.length === 0 ? (
        <div className="text-center py-20 text-gray-400">
          {search || typeFilter ? 'No matching interactions.' : 'No interactions logged yet.'}
        </div>
      ) : (
        <div className="space-y-2">
          {filtered.map(interaction => (
            <InteractionRow key={interaction.id} interaction={interaction} />
          ))}
        </div>
      )}
    </div>
  )
}

function InteractionRow({ interaction }) {
  const contact = interaction.contacts
  const teamMember = interaction.team_member
  const date = new Date(interaction.interaction_date)

  return (
    <div className="bg-white rounded-xl border border-gray-200 p-4 hover:shadow-sm transition-shadow">
      <div className="flex items-start gap-3">
        {/* Contact avatar */}
        <Link to={`/contacts/${contact?.id}`} className="flex-shrink-0">
          <div className="w-10 h-10 rounded-full bg-gray-200 overflow-hidden">
            {contact?.photo_url ? (
              <img src={contact.photo_url} alt="" className="w-full h-full object-cover" />
            ) : (
              <div className="w-full h-full flex items-center justify-center text-gray-400 text-xs font-semibold">
                {contact?.first_name?.[0]}{contact?.last_name?.[0]}
              </div>
            )}
          </div>
        </Link>

        <div className="flex-1 min-w-0">
          <div className="flex items-center gap-2 flex-wrap">
            <Link to={`/contacts/${contact?.id}`} className="font-medium text-sm text-gray-900 hover:text-goldin">
              {contact?.first_name} {contact?.last_name}
            </Link>
            <span className={`text-xs font-medium px-2 py-0.5 rounded-full ${TYPE_COLORS[interaction.interaction_type] || TYPE_COLORS.other}`}>
              {interaction.interaction_type?.replace('_', ' ')}
            </span>
            {interaction.is_private && (
              <span className="text-[10px] font-medium px-1.5 py-0.5 rounded bg-red-50 text-red-600">Private</span>
            )}
          </div>

          {interaction.title && (
            <p className="text-sm text-gray-700 mt-0.5">{interaction.title}</p>
          )}
          {interaction.notes && (
            <p className="text-xs text-gray-500 mt-1 line-clamp-2">{interaction.notes}</p>
          )}

          <div className="flex items-center gap-3 mt-2 text-xs text-gray-400">
            <span>{date.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })}</span>
            {teamMember && (
              <span>by {teamMember.first_name} {teamMember.last_name}</span>
            )}
          </div>
        </div>
      </div>
    </div>
  )
}
