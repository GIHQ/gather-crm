import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { supabase } from '../lib/supabase'
import Modal, { FormField, inputClass, selectClass, textareaClass } from '../components/ui/Modal'

const INTERACTION_TYPES = ['email', 'call', 'meeting', 'text', 'social_media', 'note', 'other']

const TYPE_COLORS = {
  email: 'bg-blue-50 text-blue-700',
  call: 'bg-green-50 text-green-700',
  meeting: 'bg-purple-50 text-purple-700',
  text: 'bg-yellow-50 text-yellow-700',
  social_media: 'bg-pink-50 text-pink-700',
  note: 'bg-gray-100 text-gray-600',
  other: 'bg-gray-100 text-gray-600',
}

export default function InteractionsPage() {
  const { hasRole } = useAuth()
  const [interactions, setInteractions] = useState([])
  const [search, setSearch] = useState('')
  const [typeFilter, setTypeFilter] = useState('')
  const [loading, setLoading] = useState(true)
  const [addOpen, setAddOpen] = useState(false)

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

  useEffect(() => {
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
        <div className="flex items-center gap-3">
          <span className="text-sm text-gray-400">{filtered.length} interactions</span>
          <button
            onClick={() => setAddOpen(true)}
            className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-goldin text-white text-sm font-medium hover:bg-goldin-dark transition-colors"
          >
            <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
            </svg>
            Log Interaction
          </button>
        </div>
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

      {/* Add Interaction Modal */}
      {addOpen && (
        <AddInteractionFromListModal
          onClose={() => setAddOpen(false)}
          onSaved={() => { fetchInteractions() }}
        />
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


// ---------------------------------------------------------------------------
// Add Interaction Modal (from list page — includes contact picker)
// ---------------------------------------------------------------------------

function AddInteractionFromListModal({ onClose, onSaved }) {
  const [contacts, setContacts] = useState([])
  const [contactSearch, setContactSearch] = useState('')
  const [selectedContact, setSelectedContact] = useState(null)
  const [form, setForm] = useState({
    interaction_type: 'note',
    interaction_date: new Date().toISOString().split('T')[0],
    title: '',
    notes: '',
  })
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState(null)

  // Fetch contacts for picker
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
    setSaving(true)
    setError(null)

    const { error: err } = await supabase
      .from('interactions')
      .insert({
        contact_id: selectedContact.id,
        interaction_type: form.interaction_type,
        interaction_date: form.interaction_date,
        title: form.title || null,
        notes: form.notes || null,
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
    <Modal open={true} onClose={onClose} title="Log Interaction">
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
            <select className={selectClass} value={form.interaction_type} onChange={handleChange('interaction_type')} required>
              {INTERACTION_TYPES.map(t => (
                <option key={t} value={t}>{t.replace('_', ' ')}</option>
              ))}
            </select>
          </FormField>
          <FormField label="Date">
            <input type="date" className={inputClass} value={form.interaction_date} onChange={handleChange('interaction_date')} required />
          </FormField>
        </div>

        <FormField label="Title" hint="Brief summary, e.g. 'Checked in about job search'">
          <input className={inputClass} value={form.title} onChange={handleChange('title')} />
        </FormField>

        <FormField label="Notes">
          <textarea className={textareaClass} rows={4} value={form.notes} onChange={handleChange('notes')} placeholder="Details about the interaction..." />
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
            {saving ? 'Saving...' : 'Log Interaction'}
          </button>
        </div>
      </form>
    </Modal>
  )
}
