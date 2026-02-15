import { useEffect, useState } from 'react'
import { useParams, Link } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { supabase } from '../lib/supabase'
import { programLabel, programColor } from '../lib/programs'
import Modal, { FormField, inputClass, selectClass, textareaClass } from '../components/ui/Modal'

const TABS = [
  { id: 'roster', label: 'Roster' },
  { id: 'attendance', label: 'Attendance' },
  { id: 'curriculum', label: 'Curriculum' },
  { id: 'events', label: 'Events' },
]

export default function CohortDetailPage() {
  const { id } = useParams()
  const { hasRole, isAdmin } = useAuth()
  const [cohort, setCohort] = useState(null)
  const [tab, setTab] = useState('roster')
  const [loading, setLoading] = useState(true)
  const [editOpen, setEditOpen] = useState(false)

  async function fetchCohort() {
    const { data } = await supabase
      .from('cohorts')
      .select('*')
      .eq('id', id)
      .single()
    setCohort(data)
    setLoading(false)
  }

  useEffect(() => {
    fetchCohort()
  }, [id])

  if (!hasRole('team')) {
    return <div className="text-center py-20 text-gray-500">Access denied.</div>
  }

  if (loading) {
    return <div className="text-center py-20 text-gray-400">Loading cohort...</div>
  }

  if (!cohort) {
    return <div className="text-center py-20 text-gray-500">Cohort not found.</div>
  }

  return (
    <div>
      {/* Header */}
      <div className="flex items-center gap-3 mb-6">
        <Link to="/cohorts" className="text-gray-400 hover:text-gray-600 text-sm">&larr; Cohorts</Link>
        <span className={`px-2.5 py-0.5 rounded-full text-xs font-semibold text-white ${programColor(cohort.program)}`}>
          {programLabel(cohort.program, cohort.cohort_year)}
        </span>
        <h2 className="text-2xl font-bold text-gray-900">{cohort.name}</h2>
        {cohort.status === 'archived' && (
          <span className="px-2 py-0.5 rounded-full text-xs font-medium bg-gray-200 text-gray-600">Archived</span>
        )}
        {isAdmin && (
          <button
            onClick={() => setEditOpen(true)}
            className="ml-auto text-gray-400 hover:text-goldin p-1"
            title="Edit cohort settings"
          >
            <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M9.594 3.94c.09-.542.56-.94 1.11-.94h2.593c.55 0 1.02.398 1.11.94l.213 1.281c.063.374.313.686.645.87.074.04.147.083.22.127.325.196.72.257 1.075.124l1.217-.456a1.125 1.125 0 011.37.49l1.296 2.247a1.125 1.125 0 01-.26 1.431l-1.003.827c-.293.241-.438.613-.431.992a7.723 7.723 0 010 .255c-.007.378.138.75.43.991l1.004.827c.424.35.534.955.26 1.43l-1.298 2.247a1.125 1.125 0 01-1.369.491l-1.217-.456c-.355-.133-.75-.072-1.076.124a6.47 6.47 0 01-.22.128c-.331.183-.581.495-.644.869l-.213 1.281c-.09.543-.56.941-1.11.941h-2.594c-.55 0-1.019-.398-1.11-.94l-.213-1.281c-.062-.374-.312-.686-.644-.87a6.52 6.52 0 01-.22-.127c-.325-.196-.72-.257-1.076-.124l-1.217.456a1.125 1.125 0 01-1.369-.49l-1.297-2.247a1.125 1.125 0 01.26-1.431l1.004-.827c.292-.24.437-.613.43-.991a6.932 6.932 0 010-.255c.007-.38-.138-.751-.43-.992l-1.004-.827a1.125 1.125 0 01-.26-1.43l1.297-2.247a1.125 1.125 0 011.37-.491l1.216.456c.356.133.751.072 1.076-.124.072-.044.146-.086.22-.128.332-.183.582-.495.644-.869l.214-1.28z" />
              <path strokeLinecap="round" strokeLinejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
            </svg>
          </button>
        )}
      </div>

      {/* Tabs */}
      <div className="flex gap-1 mb-6 border-b border-gray-200">
        {TABS.map(t => (
          <button
            key={t.id}
            onClick={() => setTab(t.id)}
            className={`px-4 py-2.5 text-sm font-medium border-b-2 transition-colors ${
              tab === t.id
                ? 'border-goldin text-goldin'
                : 'border-transparent text-gray-500 hover:text-gray-700'
            }`}
          >
            {t.label}
          </button>
        ))}
      </div>

      {/* Tab content */}
      {tab === 'roster' && <RosterTab cohortId={id} />}
      {tab === 'attendance' && <AttendanceTab cohortId={id} program={cohort.program} />}
      {tab === 'curriculum' && <CurriculumTab cohortId={id} />}
      {tab === 'events' && <EventsTab cohortId={id} />}

      {/* Edit Cohort Modal */}
      {editOpen && (
        <EditCohortModal
          cohort={cohort}
          onClose={() => setEditOpen(false)}
          onSaved={() => fetchCohort()}
        />
      )}
    </div>
  )
}


// ---------------------------------------------------------------------------
// Edit Cohort Modal
// ---------------------------------------------------------------------------

function EditCohortModal({ cohort, onClose, onSaved }) {
  const [form, setForm] = useState({
    name: cohort.name || '',
    program: cohort.program || '',
    city: cohort.city || '',
    country: cohort.country || '',
    cohort_year: cohort.cohort_year || new Date().getFullYear(),
    status: cohort.status || 'live',
  })
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState(null)

  function handleChange(field) {
    return (e) => setForm(prev => ({ ...prev, [field]: e.target.value }))
  }

  async function handleSubmit(e) {
    e.preventDefault()
    setSaving(true)
    setError(null)

    const { error: err } = await supabase
      .from('cohorts')
      .update({
        name: form.name,
        program: form.program,
        city: form.city || null,
        country: form.country || null,
        cohort_year: parseInt(form.cohort_year),
        status: form.status,
        updated_at: new Date().toISOString(),
      })
      .eq('id', cohort.id)

    setSaving(false)

    if (err) {
      setError(err.message)
    } else {
      onSaved()
      onClose()
    }
  }

  return (
    <Modal open={true} onClose={onClose} title="Edit Cohort Settings">
      <form onSubmit={handleSubmit} className="space-y-4">
        {error && (
          <div className="text-sm text-red-600 bg-red-50 px-3 py-2 rounded-lg">{error}</div>
        )}

        <FormField label="Cohort Name">
          <input className={inputClass} value={form.name} onChange={handleChange('name')} required />
        </FormField>

        <div className="grid grid-cols-2 gap-3">
          <FormField label="Program">
            <select className={selectClass} value={form.program} onChange={handleChange('program')} required>
              <option value="CPF">CPF (Chicago)</option>
              <option value="GGF">GGF (Global)</option>
              <option value="ESP">ESP (Spanish)</option>
              <option value="DAR">DAR (Tanzania)</option>
              <option value="MOS">MOS (Colombia)</option>
            </select>
          </FormField>
          <FormField label="Year">
            <input type="number" className={inputClass} value={form.cohort_year} onChange={handleChange('cohort_year')} min={2000} max={2100} required />
          </FormField>
        </div>

        <div className="grid grid-cols-2 gap-3">
          <FormField label="City">
            <input className={inputClass} value={form.city} onChange={handleChange('city')} />
          </FormField>
          <FormField label="Country">
            <input className={inputClass} value={form.country} onChange={handleChange('country')} />
          </FormField>
        </div>

        <FormField label="Status">
          <select className={selectClass} value={form.status} onChange={handleChange('status')}>
            <option value="live">Live</option>
            <option value="archived">Archived</option>
          </select>
        </FormField>

        <div className="flex justify-end gap-3 pt-4 border-t border-gray-200">
          <button type="button" onClick={onClose} className="px-4 py-2 text-sm text-gray-600 hover:text-gray-800">Cancel</button>
          <button type="submit" disabled={saving} className="px-5 py-2 bg-goldin text-white text-sm font-medium rounded-lg hover:bg-goldin-dark disabled:opacity-50 transition-colors">
            {saving ? 'Saving...' : 'Save Changes'}
          </button>
        </div>
      </form>
    </Modal>
  )
}


// ---------------------------------------------------------------------------
// Roster Tab (with add/remove members)
// ---------------------------------------------------------------------------

function RosterTab({ cohortId }) {
  const { isAdmin } = useAuth()
  const [members, setMembers] = useState([])
  const [loading, setLoading] = useState(true)
  const [addOpen, setAddOpen] = useState(false)

  async function fetchMembers() {
    const { data } = await supabase
      .from('cohort_members')
      .select(`
        id, role,
        contacts (
          id, first_name, last_name, email, photo_url,
          organization, city, country, phone
        )
      `)
      .eq('cohort_id', cohortId)
      .order('role')

    if (data) setMembers(data)
    setLoading(false)
  }

  useEffect(() => {
    fetchMembers()
  }, [cohortId])

  async function handleRemove(membershipId, contactName) {
    if (!confirm(`Remove ${contactName} from this cohort?`)) return
    const { error } = await supabase
      .from('cohort_members')
      .delete()
      .eq('id', membershipId)
    if (!error) fetchMembers()
  }

  if (loading) return <div className="text-gray-400 py-8">Loading roster...</div>

  const fellows = members.filter(m => m.role === 'fellow')
  const staff = members.filter(m => m.role !== 'fellow')

  return (
    <div>
      <div className="flex items-center justify-between mb-4">
        <span className="text-sm text-gray-500">{fellows.length} fellows, {staff.length} staff</span>
        {isAdmin && (
          <button
            onClick={() => setAddOpen(true)}
            className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-goldin text-white text-xs font-medium hover:bg-goldin-dark transition-colors"
          >
            <svg className="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
            </svg>
            Add Member
          </button>
        )}
      </div>

      {staff.length > 0 && (
        <div className="mb-6">
          <h3 className="text-xs font-semibold text-gray-400 uppercase tracking-wider mb-2">Staff</h3>
          <div className="grid gap-2 sm:grid-cols-2 lg:grid-cols-3">
            {staff.map(m => (
              <MemberCard
                key={m.contacts.id}
                contact={m.contacts}
                role={m.role}
                membershipId={m.id}
                canRemove={isAdmin}
                onRemove={handleRemove}
              />
            ))}
          </div>
        </div>
      )}

      <h3 className="text-xs font-semibold text-gray-400 uppercase tracking-wider mb-2">Fellows</h3>
      {fellows.length === 0 ? (
        <div className="text-gray-400 py-8 text-center">No fellows assigned to this cohort yet.</div>
      ) : (
        <div className="grid gap-2 sm:grid-cols-2 lg:grid-cols-3">
          {fellows.map(m => (
            <MemberCard
              key={m.contacts.id}
              contact={m.contacts}
              role={m.role}
              membershipId={m.id}
              canRemove={isAdmin}
              onRemove={handleRemove}
            />
          ))}
        </div>
      )}

      {/* Add Member Modal */}
      {addOpen && (
        <AddMemberModal
          cohortId={cohortId}
          existingMemberIds={members.map(m => m.contacts.id)}
          onClose={() => setAddOpen(false)}
          onSaved={() => fetchMembers()}
        />
      )}
    </div>
  )
}

function MemberCard({ contact, role, membershipId, canRemove, onRemove }) {
  return (
    <div className="bg-white rounded-xl border border-gray-200 p-3 hover:shadow-md transition-shadow flex items-center gap-3 group">
      <Link to={`/contacts/${contact.id}`} className="flex items-center gap-3 flex-1 min-w-0">
        <div className="w-9 h-9 rounded-full bg-gray-200 overflow-hidden flex-shrink-0">
          {contact.photo_url ? (
            <img src={contact.photo_url} alt="" className="w-full h-full object-cover" />
          ) : (
            <div className="w-full h-full flex items-center justify-center text-gray-400 text-xs font-semibold">
              {contact.first_name?.[0]}{contact.last_name?.[0]}
            </div>
          )}
        </div>
        <div className="min-w-0 flex-1">
          <div className="flex items-center gap-2">
            <span className="font-medium text-gray-900 text-sm truncate hover:text-goldin">
              {contact.first_name} {contact.last_name}
            </span>
            {role !== 'fellow' && (
              <span className="px-1.5 py-0.5 rounded text-[10px] font-medium bg-gray-100 text-gray-600 capitalize">{role}</span>
            )}
          </div>
          {contact.organization && (
            <p className="text-xs text-gray-500 truncate">{contact.organization}</p>
          )}
        </div>
      </Link>
      {canRemove && (
        <button
          onClick={() => onRemove(membershipId, `${contact.first_name} ${contact.last_name}`)}
          className="opacity-0 group-hover:opacity-100 text-gray-300 hover:text-red-500 p-1 transition-all"
          title="Remove from cohort"
        >
          <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>
      )}
    </div>
  )
}


// ---------------------------------------------------------------------------
// Add Member Modal
// ---------------------------------------------------------------------------

function AddMemberModal({ cohortId, existingMemberIds, onClose, onSaved }) {
  const [contacts, setContacts] = useState([])
  const [contactSearch, setContactSearch] = useState('')
  const [selectedContact, setSelectedContact] = useState(null)
  const [role, setRole] = useState('fellow')
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState(null)

  useEffect(() => {
    async function fetch() {
      const { data } = await supabase
        .from('contacts')
        .select('id, first_name, last_name, photo_url')
        .order('first_name')
        .limit(500)
      // Exclude already-assigned members
      setContacts((data || []).filter(c => !existingMemberIds.includes(c.id)))
    }
    fetch()
  }, [])

  const filteredContacts = contactSearch
    ? contacts.filter(c => {
        const q = contactSearch.toLowerCase()
        return `${c.first_name} ${c.last_name}`.toLowerCase().includes(q)
      }).slice(0, 8)
    : []

  async function handleSubmit(e) {
    e.preventDefault()
    if (!selectedContact) {
      setError('Please select a contact')
      return
    }
    setSaving(true)
    setError(null)

    const { error: err } = await supabase
      .from('cohort_members')
      .insert({
        cohort_id: cohortId,
        contact_id: selectedContact.id,
        role,
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
    <Modal open={true} onClose={onClose} title="Add Cohort Member">
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

        <FormField label="Role">
          <select className={selectClass} value={role} onChange={(e) => setRole(e.target.value)}>
            <option value="fellow">Fellow</option>
            <option value="facilitator">Facilitator</option>
            <option value="mentor">Mentor</option>
            <option value="coordinator">Coordinator</option>
          </select>
        </FormField>

        <div className="flex justify-end gap-3 pt-4 border-t border-gray-200">
          <button type="button" onClick={onClose} className="px-4 py-2 text-sm text-gray-600 hover:text-gray-800">Cancel</button>
          <button type="submit" disabled={saving} className="px-5 py-2 bg-goldin text-white text-sm font-medium rounded-lg hover:bg-goldin-dark disabled:opacity-50 transition-colors">
            {saving ? 'Adding...' : 'Add Member'}
          </button>
        </div>
      </form>
    </Modal>
  )
}


// ---------------------------------------------------------------------------
// Attendance Tab
// ---------------------------------------------------------------------------

function AttendanceTab({ cohortId, program }) {
  const [events, setEvents] = useState([])
  const [attendance, setAttendance] = useState([])
  const [members, setMembers] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function fetch() {
      const [eventsRes, membersRes] = await Promise.all([
        supabase
          .from('events')
          .select('id, title, start_time, is_required')
          .eq('cohort_id', cohortId)
          .order('start_time'),
        supabase
          .from('cohort_members')
          .select('contacts (id, first_name, last_name)')
          .eq('cohort_id', cohortId)
          .eq('role', 'fellow'),
      ])

      const evts = eventsRes.data || []
      const mems = membersRes.data || []
      setEvents(evts)
      setMembers(mems.map(m => m.contacts))

      if (evts.length > 0) {
        const eventIds = evts.map(e => e.id)
        const { data: att } = await supabase
          .from('event_attendance')
          .select('event_id, contact_id, status')
          .in('event_id', eventIds)
        setAttendance(att || [])
      }

      setLoading(false)
    }
    fetch()
  }, [cohortId])

  if (loading) return <div className="text-gray-400 py-8">Loading attendance...</div>

  if (events.length === 0) {
    return <div className="text-gray-400 py-8 text-center">No events yet.</div>
  }

  // Build lookup: {contactId-eventId: status}
  const attMap = {}
  for (const a of attendance) {
    attMap[`${a.contact_id}-${a.event_id}`] = a.status
  }

  // Compute totals per fellow
  const requiredEvents = events.filter(e => e.is_required)

  return (
    <div className="overflow-x-auto">
      <table className="min-w-full text-xs">
        <thead>
          <tr className="border-b border-gray-200">
            <th className="text-left py-2 px-2 font-semibold text-gray-700 sticky left-0 bg-gray-50 min-w-[140px]">Fellow</th>
            <th className="py-2 px-1 font-semibold text-gray-700 text-center">%</th>
            {events.map(e => {
              const d = new Date(e.start_time)
              return (
                <th key={e.id} className="py-2 px-1 font-normal text-gray-500 text-center whitespace-nowrap" title={e.title}>
                  {d.toLocaleDateString('en-US', { month: 'short', day: 'numeric' })}
                </th>
              )
            })}
          </tr>
        </thead>
        <tbody>
          {members.map(contact => {
            const presentCount = requiredEvents.filter(e =>
              attMap[`${contact.id}-${e.id}`] === 'present' || attMap[`${contact.id}-${e.id}`] === 'late'
            ).length
            const pct = requiredEvents.length > 0
              ? Math.round((presentCount / requiredEvents.length) * 100)
              : 0

            return (
              <tr key={contact.id} className="border-b border-gray-100 hover:bg-gray-50">
                <td className="py-1.5 px-2 sticky left-0 bg-white font-medium text-gray-900">
                  <Link to={`/contacts/${contact.id}`} className="hover:text-goldin">
                    {contact.first_name} {contact.last_name}
                  </Link>
                </td>
                <td className="py-1.5 px-1 text-center">
                  <span className={`font-semibold ${pct >= 80 ? 'text-status-green' : pct >= 50 ? 'text-status-yellow' : 'text-status-red'}`}>
                    {pct}%
                  </span>
                </td>
                {events.map(e => {
                  const status = attMap[`${contact.id}-${e.id}`]
                  return (
                    <td key={e.id} className="py-1.5 px-1 text-center">
                      <AttendanceDot status={status} />
                    </td>
                  )
                })}
              </tr>
            )
          })}
        </tbody>
      </table>
    </div>
  )
}

function AttendanceDot({ status }) {
  if (!status) return <span className="text-gray-200">-</span>
  const styles = {
    present: 'bg-status-green',
    late: 'bg-status-yellow',
    excused: 'bg-blue-400',
    absent: 'bg-status-red',
  }
  return (
    <span
      className={`inline-block w-3 h-3 rounded-full ${styles[status] || 'bg-gray-300'}`}
      title={status}
    />
  )
}


// ---------------------------------------------------------------------------
// Curriculum Tab
// ---------------------------------------------------------------------------

function CurriculumTab({ cohortId }) {
  const [chapters, setChapters] = useState([])
  const [items, setItems] = useState([])
  const [progress, setProgress] = useState([])
  const [members, setMembers] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function fetch() {
      // Get curriculum for this cohort
      const { data: curricula } = await supabase
        .from('curricula')
        .select('id')
        .eq('cohort_id', cohortId)

      if (!curricula || curricula.length === 0) {
        setLoading(false)
        return
      }

      const curriculumId = curricula[0].id

      const [chRes, itemsRes, membersRes] = await Promise.all([
        supabase
          .from('curriculum_chapters')
          .select('*')
          .eq('curriculum_id', curriculumId)
          .order('order_num'),
        supabase
          .from('curriculum_items')
          .select('*, curriculum_chapters!inner(curriculum_id)')
          .eq('curriculum_chapters.curriculum_id', curriculumId),
        supabase
          .from('cohort_members')
          .select('contacts (id, first_name, last_name)')
          .eq('cohort_id', cohortId)
          .eq('role', 'fellow'),
      ])

      const chs = chRes.data || []
      const itms = itemsRes.data || []
      const mems = (membersRes.data || []).map(m => m.contacts)

      setChapters(chs)
      setItems(itms)
      setMembers(mems)

      // Fetch progress for all items
      if (itms.length > 0) {
        const itemIds = itms.map(i => i.id)
        const { data: prog } = await supabase
          .from('contact_curriculum_progress')
          .select('contact_id, item_id, completed')
          .in('item_id', itemIds)
        setProgress(prog || [])
      }

      setLoading(false)
    }
    fetch()
  }, [cohortId])

  if (loading) return <div className="text-gray-400 py-8">Loading curriculum...</div>
  if (chapters.length === 0) return <div className="text-gray-400 py-8 text-center">No curriculum set up yet.</div>

  // Progress lookup
  const progMap = {}
  for (const p of progress) {
    if (p.completed) {
      progMap[`${p.contact_id}-${p.item_id}`] = true
    }
  }

  return (
    <div>
      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        {chapters.map(ch => {
          const chapterItems = items.filter(i => i.chapter_id === ch.id)
          const totalItems = chapterItems.length

          return (
            <div key={ch.id} className="bg-white rounded-xl border border-gray-200 p-4">
              <h3 className="font-semibold text-gray-900 mb-1">{ch.title}</h3>
              <p className="text-xs text-gray-400 mb-3">{totalItems} items</p>

              <div className="space-y-1.5">
                {members.map(contact => {
                  const completed = chapterItems.filter(i => progMap[`${contact.id}-${i.id}`]).length
                  const pct = totalItems > 0 ? Math.round((completed / totalItems) * 100) : 0

                  return (
                    <div key={contact.id} className="flex items-center gap-2">
                      <span className="text-xs text-gray-700 w-24 truncate">{contact.first_name}</span>
                      <div className="flex-1 h-2 bg-gray-100 rounded-full overflow-hidden">
                        <div
                          className={`h-full rounded-full transition-all ${pct >= 80 ? 'bg-status-green' : pct >= 50 ? 'bg-status-yellow' : 'bg-status-red'}`}
                          style={{ width: `${pct}%` }}
                        />
                      </div>
                      <span className="text-xs text-gray-400 w-10 text-right">{completed}/{totalItems}</span>
                    </div>
                  )
                })}
              </div>
            </div>
          )
        })}
      </div>
    </div>
  )
}


// ---------------------------------------------------------------------------
// Events Tab
// ---------------------------------------------------------------------------

const TYPE_LABELS = {
  workshop: 'Workshop',
  social: 'Social',
  orientation: 'Orientation',
  field_trip: 'Field Trip',
  guest_speaker: 'Guest Speaker',
  other: 'Other',
}

function EventsTab({ cohortId }) {
  const { isAdmin } = useAuth()
  const [events, setEvents] = useState([])
  const [loading, setLoading] = useState(true)
  const [addOpen, setAddOpen] = useState(false)
  const [expandedEvent, setExpandedEvent] = useState(null)

  async function fetchEvents() {
    const { data } = await supabase
      .from('events')
      .select('*')
      .eq('cohort_id', cohortId)
      .order('start_time', { ascending: false })
    setEvents(data || [])
    setLoading(false)
  }

  useEffect(() => {
    fetchEvents()
  }, [cohortId])

  if (loading) return <div className="text-gray-400 py-8">Loading events...</div>

  return (
    <div>
      <div className="flex items-center justify-between mb-4">
        <span className="text-sm text-gray-500">{events.length} events</span>
        {isAdmin && (
          <button
            onClick={() => setAddOpen(true)}
            className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-goldin text-white text-xs font-medium hover:bg-goldin-dark transition-colors"
          >
            <svg className="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
              <path strokeLinecap="round" strokeLinejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
            </svg>
            Add Event
          </button>
        )}
      </div>

      {events.length === 0 ? (
        <div className="text-gray-400 py-8 text-center">No events yet.</div>
      ) : (
        <div className="space-y-2">
          {events.map(e => (
            <EventCard
              key={e.id}
              event={e}
              expanded={expandedEvent === e.id}
              onToggleExpand={() => setExpandedEvent(expandedEvent === e.id ? null : e.id)}
            />
          ))}
        </div>
      )}

      {/* Add Event Modal */}
      {addOpen && (
        <AddEventModal
          cohortId={cohortId}
          onClose={() => setAddOpen(false)}
          onSaved={() => fetchEvents()}
        />
      )}
    </div>
  )
}


// ---------------------------------------------------------------------------
// Event Card with expandable Planning checklist
// ---------------------------------------------------------------------------

function EventCard({ event: e, expanded, onToggleExpand }) {
  const d = new Date(e.start_time)
  const isPast = d < new Date()

  return (
    <div className={`bg-white rounded-xl border border-gray-200 ${isPast && !expanded ? 'opacity-60' : ''}`}>
      <div className="p-4">
        <div className="flex items-center justify-between">
          <div className="flex-1 min-w-0">
            <div className="flex items-center gap-2 mb-1">
              <span className="text-xs px-2 py-0.5 rounded-full bg-gray-100 text-gray-600">
                {TYPE_LABELS[e.event_type] || e.event_type}
              </span>
              {e.is_required && <span className="text-xs text-goldin font-medium">Required</span>}
            </div>
            <h4 className="font-medium text-gray-900">{e.title}</h4>
            {e.description && <p className="text-sm text-gray-500 mt-1">{e.description}</p>}
          </div>
          <div className="text-right text-sm text-gray-500 whitespace-nowrap ml-4">
            <div>{d.toLocaleDateString('en-US', { weekday: 'short', month: 'short', day: 'numeric' })}</div>
            {d.getHours() > 0 && (
              <div className="text-xs">{d.toLocaleTimeString('en-US', { hour: 'numeric', minute: '2-digit' })}</div>
            )}
          </div>
        </div>
        {(e.location || e.facilitator) && (
          <div className="flex gap-4 mt-2 text-xs text-gray-400">
            {e.location && <span>{e.location}</span>}
            {e.facilitator && <span>Facilitator: {e.facilitator}</span>}
          </div>
        )}

        {/* Planning toggle button */}
        <button
          onClick={onToggleExpand}
          className="mt-3 inline-flex items-center gap-1.5 text-xs text-gray-500 hover:text-goldin transition-colors"
        >
          <svg className={`w-3.5 h-3.5 transition-transform ${expanded ? 'rotate-90' : ''}`} fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
            <path strokeLinecap="round" strokeLinejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5" />
          </svg>
          Planning Checklist
        </button>
      </div>

      {/* Expanded planning checklist */}
      {expanded && (
        <div className="border-t border-gray-100">
          <EventPlanningChecklist eventId={e.id} />
        </div>
      )}
    </div>
  )
}


// ---------------------------------------------------------------------------
// Event Planning Checklist
// ---------------------------------------------------------------------------

function EventPlanningChecklist({ eventId }) {
  const [items, setItems] = useState([])
  const [loading, setLoading] = useState(true)
  const [newItemText, setNewItemText] = useState('')
  const [adding, setAdding] = useState(false)

  async function fetchItems() {
    const { data } = await supabase
      .from('event_planning')
      .select('*')
      .eq('event_id', eventId)
      .order('sort_order')
      .order('created_at')
    setItems(data || [])
    setLoading(false)
  }

  useEffect(() => {
    fetchItems()
  }, [eventId])

  async function toggleItem(item) {
    const nowCompleted = !item.completed
    const { error } = await supabase
      .from('event_planning')
      .update({
        completed: nowCompleted,
        completed_at: nowCompleted ? new Date().toISOString() : null,
      })
      .eq('id', item.id)

    if (!error) {
      setItems(prev => prev.map(i =>
        i.id === item.id
          ? { ...i, completed: nowCompleted, completed_at: nowCompleted ? new Date().toISOString() : null }
          : i
      ))
    }
  }

  async function addItem(e) {
    e.preventDefault()
    if (!newItemText.trim()) return
    setAdding(true)

    const maxSort = items.reduce((max, i) => Math.max(max, i.sort_order || 0), 0)
    const { error } = await supabase
      .from('event_planning')
      .insert({
        event_id: eventId,
        item_text: newItemText.trim(),
        sort_order: maxSort + 1,
      })

    setAdding(false)
    if (!error) {
      setNewItemText('')
      fetchItems()
    }
  }

  async function deleteItem(itemId) {
    const { error } = await supabase
      .from('event_planning')
      .delete()
      .eq('id', itemId)
    if (!error) {
      setItems(prev => prev.filter(i => i.id !== itemId))
    }
  }

  if (loading) {
    return <div className="px-4 py-3 text-xs text-gray-400">Loading checklist...</div>
  }

  const completedCount = items.filter(i => i.completed).length
  const totalCount = items.length

  return (
    <div className="px-4 py-3">
      {totalCount > 0 && (
        <div className="flex items-center gap-2 mb-2">
          <div className="flex-1 h-1.5 bg-gray-100 rounded-full overflow-hidden">
            <div
              className={`h-full rounded-full transition-all ${completedCount === totalCount ? 'bg-status-green' : 'bg-goldin'}`}
              style={{ width: `${totalCount > 0 ? (completedCount / totalCount) * 100 : 0}%` }}
            />
          </div>
          <span className="text-[10px] text-gray-400 whitespace-nowrap">{completedCount}/{totalCount}</span>
        </div>
      )}

      {/* Checklist items */}
      <div className="space-y-1">
        {items.map(item => (
          <div key={item.id} className="flex items-center gap-2 group">
            <button
              onClick={() => toggleItem(item)}
              className={`w-4 h-4 rounded border flex-shrink-0 flex items-center justify-center transition-colors ${
                item.completed
                  ? 'bg-status-green border-status-green text-white'
                  : 'border-gray-300 hover:border-goldin'
              }`}
            >
              {item.completed && (
                <svg className="w-3 h-3" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={3}>
                  <path strokeLinecap="round" strokeLinejoin="round" d="M4.5 12.75l6 6 9-13.5" />
                </svg>
              )}
            </button>
            <span className={`text-sm flex-1 ${item.completed ? 'line-through text-gray-400' : 'text-gray-700'}`}>
              {item.item_text}
            </span>
            <button
              onClick={() => deleteItem(item.id)}
              className="opacity-0 group-hover:opacity-100 text-gray-300 hover:text-red-500 p-0.5 transition-all"
              title="Remove item"
            >
              <svg className="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                <path strokeLinecap="round" strokeLinejoin="round" d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>
        ))}
      </div>

      {/* Add new item */}
      <form onSubmit={addItem} className="flex items-center gap-2 mt-2">
        <input
          type="text"
          value={newItemText}
          onChange={(e) => setNewItemText(e.target.value)}
          placeholder="Add checklist item..."
          className="flex-1 px-2 py-1 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-1 focus:ring-goldin/50 focus:border-goldin"
        />
        <button
          type="submit"
          disabled={adding || !newItemText.trim()}
          className="px-2.5 py-1 text-xs font-medium text-goldin hover:bg-goldin/10 rounded-lg disabled:opacity-30 transition-colors"
        >
          Add
        </button>
      </form>

      {totalCount === 0 && (
        <p className="text-[11px] text-gray-400 mt-1">No planning items yet. Add items above or they'll be auto-created for new events.</p>
      )}
    </div>
  )
}


// ---------------------------------------------------------------------------
// Add Event Modal
// ---------------------------------------------------------------------------

function AddEventModal({ cohortId, onClose, onSaved }) {
  const [form, setForm] = useState({
    title: '',
    description: '',
    event_type: 'workshop',
    start_time: '',
    end_time: '',
    location: '',
    facilitator: '',
    is_required: true,
  })
  const [saving, setSaving] = useState(false)
  const [error, setError] = useState(null)

  function handleChange(field) {
    return (e) => {
      const val = e.target.type === 'checkbox' ? e.target.checked : e.target.value
      setForm(prev => ({ ...prev, [field]: val }))
    }
  }

  async function handleSubmit(e) {
    e.preventDefault()
    if (!form.title || !form.start_time) {
      setError('Title and start time are required')
      return
    }
    setSaving(true)
    setError(null)

    const { data: inserted, error: err } = await supabase
      .from('events')
      .insert({
        cohort_id: cohortId,
        title: form.title,
        description: form.description || null,
        event_type: form.event_type,
        start_time: form.start_time,
        end_time: form.end_time || null,
        location: form.location || null,
        facilitator: form.facilitator || null,
        is_required: form.is_required,
      })
      .select('id')
      .single()

    if (err) {
      setSaving(false)
      setError(err.message)
      return
    }

    // Auto-seed planning checklist from template
    try {
      const { data: setting } = await supabase
        .from('app_settings')
        .select('value')
        .eq('key', 'event_planning_template')
        .single()

      if (setting?.value && Array.isArray(setting.value) && setting.value.length > 0) {
        const planningItems = setting.value.map(t => ({
          event_id: inserted.id,
          item_text: t.item_text,
          sort_order: t.sort_order || 0,
        }))
        await supabase.from('event_planning').insert(planningItems)
      }
    } catch {
      // Template seeding is best-effort — don't block event creation
    }

    setSaving(false)
    onSaved()
    onClose()
  }

  return (
    <Modal open={true} onClose={onClose} title="Add Event">
      <form onSubmit={handleSubmit} className="space-y-4">
        {error && (
          <div className="text-sm text-red-600 bg-red-50 px-3 py-2 rounded-lg">{error}</div>
        )}

        <FormField label="Title">
          <input className={inputClass} value={form.title} onChange={handleChange('title')} required placeholder="e.g. Week 3 Workshop" />
        </FormField>

        <div className="grid grid-cols-2 gap-3">
          <FormField label="Type">
            <select className={selectClass} value={form.event_type} onChange={handleChange('event_type')}>
              <option value="workshop">Workshop</option>
              <option value="social">Social</option>
              <option value="orientation">Orientation</option>
              <option value="field_trip">Field Trip</option>
              <option value="guest_speaker">Guest Speaker</option>
              <option value="other">Other</option>
            </select>
          </FormField>
          <FormField label="Required">
            <div className="flex items-center gap-2 h-[38px]">
              <input
                type="checkbox"
                checked={form.is_required}
                onChange={handleChange('is_required')}
                className="rounded border-gray-300 text-goldin focus:ring-goldin"
              />
              <span className="text-sm text-gray-700">Required for attendance</span>
            </div>
          </FormField>
        </div>

        <div className="grid grid-cols-2 gap-3">
          <FormField label="Start Time">
            <input type="datetime-local" className={inputClass} value={form.start_time} onChange={handleChange('start_time')} required />
          </FormField>
          <FormField label="End Time">
            <input type="datetime-local" className={inputClass} value={form.end_time} onChange={handleChange('end_time')} />
          </FormField>
        </div>

        <div className="grid grid-cols-2 gap-3">
          <FormField label="Location">
            <input className={inputClass} value={form.location} onChange={handleChange('location')} placeholder="e.g. Room 201, Main Building" />
          </FormField>
          <FormField label="Facilitator">
            <input className={inputClass} value={form.facilitator} onChange={handleChange('facilitator')} />
          </FormField>
        </div>

        <FormField label="Description">
          <textarea className={textareaClass} rows={3} value={form.description} onChange={handleChange('description')} placeholder="Event details..." />
        </FormField>

        <div className="flex justify-end gap-3 pt-4 border-t border-gray-200">
          <button type="button" onClick={onClose} className="px-4 py-2 text-sm text-gray-600 hover:text-gray-800">Cancel</button>
          <button type="submit" disabled={saving} className="px-5 py-2 bg-goldin text-white text-sm font-medium rounded-lg hover:bg-goldin-dark disabled:opacity-50 transition-colors">
            {saving ? 'Creating...' : 'Create Event'}
          </button>
        </div>
      </form>
    </Modal>
  )
}
