import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { supabase } from '../lib/supabase'
import DOMPurify from 'dompurify'
import Modal, { FormField, inputClass, selectClass, textareaClass } from '../components/ui/Modal'

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
  const [addOpen, setAddOpen] = useState(false)

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

  useEffect(() => {
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
        <div className="flex items-center gap-3">
          <span className="text-sm text-gray-400">{filtered.length} activities</span>
          <button
            onClick={() => setAddOpen(true)}
            className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-goldin text-white text-sm font-medium hover:bg-goldin-dark transition-colors"
          >
            <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
            </svg>
            Add Activity
          </button>
        </div>
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

      {/* Add Activity Modal */}
      {addOpen && (
        <AddActivityModal
          onClose={() => setAddOpen(false)}
          onSaved={() => { fetchActivities() }}
        />
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


// ---------------------------------------------------------------------------
// Add Activity Modal
// ---------------------------------------------------------------------------

function AddActivityModal({ onClose, onSaved }) {
  const [contacts, setContacts] = useState([])
  const [contactSearch, setContactSearch] = useState('')
  const [selectedContact, setSelectedContact] = useState(null)
  const [form, setForm] = useState({
    activity_type: 'news_mention',
    activity_date: new Date().toISOString().split('T')[0],
    title: '',
    source_url: '',
    source_name: '',
    snippet: '',
  })
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState(null)

  useEffect(() => {
    async function fetch() {
      const { data } = await supabase
        .from('contacts')
        .select('id, first_name, last_name, photo_url')
        .order('first_name')
        .limit(500)
      setContacts(data || [])
    }
    fetch()
  }, [])

  const filteredContacts = contactSearch
    ? contacts.filter(c => {
        const q = contactSearch.toLowerCase()
        return `${c.first_name} ${c.last_name}`.toLowerCase().includes(q)
      }).slice(0, 8)
    : []

  function handleChange(field) {
    return (e) => setForm(prev => ({ ...prev, [field]: e.target.value }))
  }

  async function handleSubmit(e) {
    e.preventDefault()
    if (!selectedContact) {
      setError('Please select a contact')
      return
    }
    if (!form.title) {
      setError('Please enter a title')
      return
    }
    setSaving(true)
    setError(null)

    const { error: err } = await supabase
      .from('activities')
      .insert({
        contact_id: selectedContact.id,
        activity_type: form.activity_type,
        activity_date: form.activity_date,
        title: form.title,
        source_url: form.source_url || null,
        source_name: form.source_name || null,
        snippet: form.snippet || null,
      })

    setSaving(false)

    if (err) {
      setError(err.message)
    } else {
      onSaved()
      onClose()
    }
  }

  return (
    <Modal open={true} onClose={onClose} title="Add Activity">
      <form onSubmit={handleSubmit} className="space-y-4">
        {error && (
          <div className="text-sm text-red-600 bg-red-50 px-3 py-2 rounded-lg">{error}</div>
        )}

        {/* Contact picker */}
        <FormField label="Contact">
          {selectedContact ? (
            <div className="flex items-center gap-2 p-2 bg-gray-50 rounded-lg">
              <div className="w-7 h-7 rounded-full bg-gray-200 overflow-hidden flex-shrink-0">
                {selectedContact.photo_url ? (
                  <img src={selectedContact.photo_url} alt="" className="w-full h-full object-cover" />
                ) : (
                  <div className="w-full h-full flex items-center justify-center text-gray-400 text-[10px] font-semibold">
                    {selectedContact.first_name?.[0]}{selectedContact.last_name?.[0]}
                  </div>
                )}
              </div>
              <span className="text-sm font-medium text-gray-900">{selectedContact.first_name} {selectedContact.last_name}</span>
              <button type="button" onClick={() => setSelectedContact(null)} className="ml-auto text-gray-400 hover:text-gray-600 text-xs">Change</button>
            </div>
          ) : (
            <div className="relative">
              <input
                className={inputClass}
                value={contactSearch}
                onChange={(e) => setContactSearch(e.target.value)}
                placeholder="Start typing a name..."
                autoFocus
              />
              {filteredContacts.length > 0 && (
                <div className="absolute top-full left-0 right-0 mt-1 bg-white border border-gray-200 rounded-lg shadow-lg z-10 max-h-48 overflow-y-auto">
                  {filteredContacts.map(c => (
                    <button
                      key={c.id}
                      type="button"
                      onClick={() => { setSelectedContact(c); setContactSearch('') }}
                      className="w-full flex items-center gap-2 px-3 py-2 hover:bg-gray-50 text-left"
                    >
                      <div className="w-6 h-6 rounded-full bg-gray-200 overflow-hidden flex-shrink-0">
                        {c.photo_url ? (
                          <img src={c.photo_url} alt="" className="w-full h-full object-cover" />
                        ) : (
                          <div className="w-full h-full flex items-center justify-center text-gray-400 text-[10px] font-semibold">
                            {c.first_name?.[0]}{c.last_name?.[0]}
                          </div>
                        )}
                      </div>
                      <span className="text-sm text-gray-900">{c.first_name} {c.last_name}</span>
                    </button>
                  ))}
                </div>
              )}
            </div>
          )}
        </FormField>

        <div className="grid grid-cols-2 gap-3">
          <FormField label="Type">
            <select className={selectClass} value={form.activity_type} onChange={handleChange('activity_type')} required>
              {ACTIVITY_TYPES.map(t => (
                <option key={t} value={t}>{TYPE_LABELS[t] || t}</option>
              ))}
            </select>
          </FormField>
          <FormField label="Date">
            <input type="date" className={inputClass} value={form.activity_date} onChange={handleChange('activity_date')} required />
          </FormField>
        </div>

        <FormField label="Title">
          <input className={inputClass} value={form.title} onChange={handleChange('title')} required placeholder="e.g. Featured in Chicago Tribune article" />
        </FormField>

        <FormField label="Source URL" hint="Link to the article, post, or mention">
          <input type="url" className={inputClass} value={form.source_url} onChange={handleChange('source_url')} placeholder="https://..." />
        </FormField>

        <FormField label="Source Name" hint="e.g. Chicago Tribune, LinkedIn, Twitter">
          <input className={inputClass} value={form.source_name} onChange={handleChange('source_name')} />
        </FormField>

        <FormField label="Snippet / Summary">
          <textarea className={textareaClass} rows={3} value={form.snippet} onChange={handleChange('snippet')} placeholder="Brief excerpt or summary..." />
        </FormField>

        <div className="flex justify-end gap-3 pt-4 border-t border-gray-200">
          <button type="button" onClick={onClose} className="px-4 py-2 text-sm text-gray-600 hover:text-gray-800">
            Cancel
          </button>
          <button
            type="submit"
            disabled={saving}
            className="px-5 py-2 bg-goldin text-white text-sm font-medium rounded-lg hover:bg-goldin-dark disabled:opacity-50 transition-colors"
          >
            {saving ? 'Saving...' : 'Add Activity'}
          </button>
        </div>
      </form>
    </Modal>
  )
}
