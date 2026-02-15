import { useEffect, useState } from 'react'
import { supabase } from '../lib/supabase'

export default function AlumniPage() {
  const [contacts, setContacts] = useState([])
  const [search, setSearch] = useState('')
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function fetchAlumni() {
      const { data, error } = await supabase
        .from('contacts')
        .select('id, first_name, last_name, email, photo_url, program, cohort, organization, city, country')
        .eq('status', 'Alumni')
        .eq('is_active', true)
        .order('last_name')

      if (!error && data) {
        setContacts(data)
      }
      setLoading(false)
    }
    fetchAlumni()
  }, [])

  const filtered = search
    ? contacts.filter(c => {
        const q = search.toLowerCase()
        return (
          c.first_name?.toLowerCase().includes(q) ||
          c.last_name?.toLowerCase().includes(q) ||
          c.organization?.toLowerCase().includes(q) ||
          c.city?.toLowerCase().includes(q)
        )
      })
    : contacts

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <h2 className="text-2xl font-bold text-gray-900">Alumni Directory</h2>
        <span className="text-sm text-gray-400">{contacts.length} contacts</span>
      </div>

      <input
        type="text"
        value={search}
        onChange={(e) => setSearch(e.target.value)}
        placeholder="Search by name, organization, or city..."
        className="w-full px-4 py-2.5 border border-gray-300 rounded-xl text-sm mb-6 focus:outline-none focus:ring-2 focus:ring-goldin/50 focus:border-goldin"
      />

      {loading ? (
        <div className="text-center py-20 text-gray-400">Loading alumni...</div>
      ) : filtered.length === 0 ? (
        <div className="text-center py-20 text-gray-400">
          {search ? 'No matches found.' : 'No alumni yet.'}
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

const PROGRAM_COLORS = {
  CPF: 'bg-blue-500',
  GGF: 'bg-orange-500',
  ESP: 'bg-purple-500',
}

function ContactCard({ contact }) {
  return (
    <div className="bg-white rounded-xl border border-gray-200 p-4 hover:shadow-md transition-shadow cursor-pointer flex items-center gap-3">
      <div className="w-10 h-10 rounded-full bg-gray-200 overflow-hidden flex-shrink-0">
        {contact.photo_url ? (
          <img src={contact.photo_url} alt="" className="w-full h-full object-cover" />
        ) : (
          <div className="w-full h-full flex items-center justify-center text-gray-400 text-sm font-semibold">
            {contact.first_name?.[0]}{contact.last_name?.[0]}
          </div>
        )}
      </div>
      <div className="min-w-0">
        <div className="flex items-center gap-2">
          <span className="font-medium text-gray-900 text-sm truncate">
            {contact.first_name} {contact.last_name}
          </span>
          {contact.program && (
            <span className={`px-1.5 py-0.5 rounded-full text-[10px] font-semibold text-white flex-shrink-0 ${PROGRAM_COLORS[contact.program] || 'bg-gray-500'}`}>
              {contact.program}
            </span>
          )}
        </div>
        {contact.organization && (
          <p className="text-xs text-gray-500 truncate">{contact.organization}</p>
        )}
        {contact.city && (
          <p className="text-xs text-gray-400 truncate">{contact.city}{contact.country ? `, ${contact.country}` : ''}</p>
        )}
      </div>
    </div>
  )
}
