import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { supabase } from '../lib/supabase'

export default function AlumniPage() {
  const [contacts, setContacts] = useState([])
  const [search, setSearch] = useState('')
  const [programFilter, setProgramFilter] = useState('')
  const [countryFilter, setCountryFilter] = useState('')
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function fetchAlumni() {
      const { data, error } = await supabase
        .from('contacts')
        .select('id, first_name, last_name, email, photo_url, program, cohort, status, organization, city, country, job_title, biography')
        .eq('is_active', true)
        .order('last_name')

      if (!error && data) {
        setContacts(data)
      }
      setLoading(false)
    }
    fetchAlumni()
  }, [])

  // Derive filter options from data
  const programs = [...new Set(contacts.map(c => c.program).filter(Boolean))].sort()
  const countries = [...new Set(contacts.map(c => c.country).filter(Boolean))].sort()

  const filtered = contacts.filter(c => {
    if (programFilter && c.program !== programFilter) return false
    if (countryFilter && c.country !== countryFilter) return false
    if (search) {
      const q = search.toLowerCase()
      return (
        c.first_name?.toLowerCase().includes(q) ||
        c.last_name?.toLowerCase().includes(q) ||
        c.organization?.toLowerCase().includes(q) ||
        c.city?.toLowerCase().includes(q) ||
        c.country?.toLowerCase().includes(q)
      )
    }
    return true
  })

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <h2 className="text-2xl font-bold text-gray-900">Alumni Directory</h2>
        <span className="text-sm text-gray-400">{filtered.length} of {contacts.length} contacts</span>
      </div>

      {/* Search + filters */}
      <div className="flex flex-col sm:flex-row gap-3 mb-6">
        <input
          type="text"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          placeholder="Search by name, org, city, country, or focus area..."
          className="flex-1 px-4 py-2.5 border border-gray-300 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-goldin/50 focus:border-goldin"
        />
        <select
          value={programFilter}
          onChange={(e) => setProgramFilter(e.target.value)}
          className="px-3 py-2.5 border border-gray-300 rounded-xl text-sm bg-white focus:outline-none focus:ring-2 focus:ring-goldin/50 focus:border-goldin"
        >
          <option value="">All Programs</option>
          {programs.map(p => <option key={p} value={p}>{p}</option>)}
        </select>
        <select
          value={countryFilter}
          onChange={(e) => setCountryFilter(e.target.value)}
          className="px-3 py-2.5 border border-gray-300 rounded-xl text-sm bg-white focus:outline-none focus:ring-2 focus:ring-goldin/50 focus:border-goldin"
        >
          <option value="">All Countries</option>
          {countries.map(c => <option key={c} value={c}>{c}</option>)}
        </select>
      </div>

      {loading ? (
        <div className="text-center py-20 text-gray-400">Loading alumni...</div>
      ) : filtered.length === 0 ? (
        <div className="text-center py-20 text-gray-400">
          {search || programFilter || countryFilter ? 'No matches found.' : 'No alumni yet.'}
        </div>
      ) : (
        <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
          {filtered.map(contact => (
            <ContactCard key={contact.id} contact={contact} />
          ))}
        </div>
      )}
    </div>
  )
}

function ContactCard({ contact }) {
  return (
    <Link to={`/contacts/${contact.id}`} className="bg-white rounded-xl border border-gray-200 p-4 hover:shadow-md transition-shadow flex items-start gap-3">
      <div className="w-12 h-12 rounded-full bg-gray-200 overflow-hidden flex-shrink-0">
        {contact.photo_url ? (
          <img src={contact.photo_url} alt="" className="w-full h-full object-cover" />
        ) : (
          <div className="w-full h-full flex items-center justify-center text-gray-400 text-sm font-semibold">
            {contact.first_name?.[0]}{contact.last_name?.[0]}
          </div>
        )}
      </div>
      <div className="min-w-0 flex-1">
        <span className="font-medium text-gray-900 text-sm truncate">
          {contact.first_name} {contact.last_name}
        </span>
        {(contact.job_title || contact.organization) && (
          <p className="text-xs text-gray-500 truncate">
            {contact.job_title && contact.organization
              ? `${contact.job_title} at ${contact.organization}`
              : contact.organization || contact.job_title}
          </p>
        )}
        {contact.city && (
          <p className="text-xs text-gray-400 truncate">{contact.city}{contact.country ? `, ${contact.country}` : ''}</p>
        )}
      </div>
    </Link>
  )
}
