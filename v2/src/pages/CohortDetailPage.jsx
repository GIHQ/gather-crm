import { useEffect, useState } from 'react'
import { useParams, Link } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { supabase } from '../lib/supabase'

const PROGRAM_COLORS = {
  CPF: 'bg-blue-500',
  DAR: 'bg-emerald-600',
  MOS: 'bg-violet-600',
  GGF: 'bg-orange-500',
  ESP: 'bg-purple-500',
}

const TABS = [
  { id: 'roster', label: 'Roster' },
  { id: 'attendance', label: 'Attendance' },
  { id: 'curriculum', label: 'Curriculum' },
  { id: 'events', label: 'Events' },
]

export default function CohortDetailPage() {
  const { id } = useParams()
  const { hasRole } = useAuth()
  const [cohort, setCohort] = useState(null)
  const [tab, setTab] = useState('roster')
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function fetchCohort() {
      const { data } = await supabase
        .from('cohorts')
        .select('*')
        .eq('id', id)
        .single()
      setCohort(data)
      setLoading(false)
    }
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
        <span className={`px-2.5 py-0.5 rounded-full text-xs font-semibold text-white ${PROGRAM_COLORS[cohort.program] || 'bg-gray-500'}`}>
          {cohort.program}
        </span>
        <h2 className="text-2xl font-bold text-gray-900">{cohort.name}</h2>
        {cohort.status === 'archived' && (
          <span className="px-2 py-0.5 rounded-full text-xs font-medium bg-gray-200 text-gray-600">Archived</span>
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
    </div>
  )
}


// ---------------------------------------------------------------------------
// Roster Tab
// ---------------------------------------------------------------------------

function RosterTab({ cohortId }) {
  const [members, setMembers] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function fetch() {
      const { data } = await supabase
        .from('cohort_members')
        .select(`
          role,
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
    fetch()
  }, [cohortId])

  if (loading) return <div className="text-gray-400 py-8">Loading roster...</div>

  const fellows = members.filter(m => m.role === 'fellow')
  const staff = members.filter(m => m.role !== 'fellow')

  return (
    <div>
      <div className="flex items-center justify-between mb-4">
        <span className="text-sm text-gray-500">{fellows.length} fellows, {staff.length} staff</span>
      </div>

      {staff.length > 0 && (
        <div className="mb-6">
          <h3 className="text-xs font-semibold text-gray-400 uppercase tracking-wider mb-2">Staff</h3>
          <div className="grid gap-2 sm:grid-cols-2 lg:grid-cols-3">
            {staff.map(m => (
              <MemberCard key={m.contacts.id} contact={m.contacts} role={m.role} />
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
            <MemberCard key={m.contacts.id} contact={m.contacts} role={m.role} />
          ))}
        </div>
      )}
    </div>
  )
}

function MemberCard({ contact, role }) {
  return (
    <Link
      to={`/contacts/${contact.id}`}
      className="bg-white rounded-xl border border-gray-200 p-3 hover:shadow-md transition-shadow flex items-center gap-3"
    >
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
          <span className="font-medium text-gray-900 text-sm truncate">
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

function EventsTab({ cohortId }) {
  const [events, setEvents] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function fetch() {
      const { data } = await supabase
        .from('events')
        .select('*')
        .eq('cohort_id', cohortId)
        .order('start_time', { ascending: false })
      setEvents(data || [])
      setLoading(false)
    }
    fetch()
  }, [cohortId])

  if (loading) return <div className="text-gray-400 py-8">Loading events...</div>
  if (events.length === 0) return <div className="text-gray-400 py-8 text-center">No events yet.</div>

  const TYPE_LABELS = {
    workshop: 'Workshop',
    social: 'Social',
    orientation: 'Orientation',
    field_trip: 'Field Trip',
    guest_speaker: 'Guest Speaker',
    other: 'Other',
  }

  return (
    <div className="space-y-2">
      {events.map(e => {
        const d = new Date(e.start_time)
        const isPast = d < new Date()
        return (
          <div key={e.id} className={`bg-white rounded-xl border border-gray-200 p-4 ${isPast ? 'opacity-60' : ''}`}>
            <div className="flex items-center justify-between">
              <div>
                <div className="flex items-center gap-2 mb-1">
                  <span className="text-xs px-2 py-0.5 rounded-full bg-gray-100 text-gray-600">
                    {TYPE_LABELS[e.event_type] || e.event_type}
                  </span>
                  {e.is_required && <span className="text-xs text-goldin font-medium">Required</span>}
                </div>
                <h4 className="font-medium text-gray-900">{e.title}</h4>
                {e.description && <p className="text-sm text-gray-500 mt-1">{e.description}</p>}
              </div>
              <div className="text-right text-sm text-gray-500 whitespace-nowrap">
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
          </div>
        )
      })}
    </div>
  )
}
