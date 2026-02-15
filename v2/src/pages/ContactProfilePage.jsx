import { useEffect, useState } from 'react'
import { useParams, Link } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { supabase } from '../lib/supabase'

export default function ContactProfilePage() {
  const { id } = useParams()
  const { hasRole, isTeam } = useAuth()
  const [contact, setContact] = useState(null)
  const [cohorts, setCohorts] = useState([])
  const [interactions, setInteractions] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function fetch() {
      const [contactRes, cohortsRes, interactionsRes] = await Promise.all([
        supabase.from('contacts').select('*').eq('id', id).single(),
        supabase
          .from('cohort_members')
          .select('role, cohorts (id, name, program, cohort_year, status)')
          .eq('contact_id', id),
        isTeam
          ? supabase
              .from('interactions')
              .select('*')
              .eq('contact_id', id)
              .order('interaction_date', { ascending: false })
              .limit(20)
          : Promise.resolve({ data: [] }),
      ])

      setContact(contactRes.data)
      setCohorts((cohortsRes.data || []).map(r => ({ ...r.cohorts, role: r.role })))
      setInteractions(interactionsRes.data || [])
      setLoading(false)
    }
    fetch()
  }, [id, isTeam])

  if (loading) return <div className="text-center py-20 text-gray-400">Loading...</div>
  if (!contact) return <div className="text-center py-20 text-gray-500">Contact not found.</div>

  return (
    <div className="max-w-3xl mx-auto">
      {/* Back nav */}
      <Link to="/alumni" className="text-sm text-gray-400 hover:text-gray-600 mb-4 inline-block">&larr; Back</Link>

      {/* Profile header */}
      <div className="bg-white rounded-2xl border border-gray-200 p-6 mb-6">
        <div className="flex items-start gap-4">
          <div className="w-16 h-16 rounded-full bg-gray-200 overflow-hidden flex-shrink-0">
            {contact.photo_url ? (
              <img src={contact.photo_url} alt="" className="w-full h-full object-cover" />
            ) : (
              <div className="w-full h-full flex items-center justify-center text-gray-400 text-xl font-semibold">
                {contact.first_name?.[0]}{contact.last_name?.[0]}
              </div>
            )}
          </div>
          <div className="flex-1 min-w-0">
            <h1 className="text-xl font-bold text-gray-900">
              {contact.first_name} {contact.last_name}
            </h1>
            {contact.job_title && contact.organization && (
              <p className="text-sm text-gray-600">{contact.job_title} at {contact.organization}</p>
            )}
            {!contact.job_title && contact.organization && (
              <p className="text-sm text-gray-600">{contact.organization}</p>
            )}
            {(contact.city || contact.country) && (
              <p className="text-sm text-gray-400 mt-1">
                {[contact.city, contact.country].filter(Boolean).join(', ')}
              </p>
            )}

            {/* Program badges */}
            <div className="flex gap-1.5 mt-2">
              {cohorts.map(c => (
                <Link
                  key={c.id}
                  to={`/cohorts/${c.id}`}
                  className={`px-2 py-0.5 rounded-full text-xs font-semibold text-white ${PROGRAM_COLORS[c.program] || 'bg-gray-500'}`}
                >
                  {c.program} {c.cohort_year}
                </Link>
              ))}
              <span className={`px-2 py-0.5 rounded-full text-xs font-medium ${
                contact.status === 'Current' ? 'bg-green-100 text-green-700' : 'bg-gray-100 text-gray-600'
              }`}>
                {contact.status || 'Alumni'}
              </span>
            </div>
          </div>
        </div>

        {/* Bio */}
        {contact.biography && (
          <p className="text-sm text-gray-600 mt-4 leading-relaxed">{contact.biography}</p>
        )}
      </div>

      <div className="grid gap-6 md:grid-cols-2">
        {/* Contact info */}
        <div className="bg-white rounded-2xl border border-gray-200 p-5">
          <h3 className="text-sm font-semibold text-gray-900 mb-3">Contact</h3>
          <div className="space-y-2">
            {contact.email && <InfoRow label="Email" value={contact.email} href={`mailto:${contact.email}`} />}
            {contact.work_email && <InfoRow label="Work Email" value={contact.work_email} href={`mailto:${contact.work_email}`} />}
            {contact.phone && <InfoRow label="Phone" value={contact.phone} href={`tel:${contact.phone}`} />}
            {contact.community_area && <InfoRow label="Community" value={contact.community_area} />}
            {contact.languages && <InfoRow label="Languages" value={contact.languages} />}
          </div>
        </div>

        {/* Social links */}
        <div className="bg-white rounded-2xl border border-gray-200 p-5">
          <h3 className="text-sm font-semibold text-gray-900 mb-3">Social</h3>
          <div className="space-y-2">
            <SocialSection label="Personal" contact={contact} fields={['linkedin', 'twitter', 'instagram', 'facebook', 'website', 'tiktok']} />
            <SocialSection label="Organization" contact={contact} fields={['linkedin_org', 'twitter_org', 'instagram_org', 'facebook_org', 'website_org']} />
          </div>
        </div>

        {/* CRM (staff only) */}
        {isTeam && (
          <div className="bg-white rounded-2xl border border-gray-200 p-5">
            <h3 className="text-sm font-semibold text-gray-900 mb-3">CRM</h3>
            <div className="space-y-2">
              {contact.working_on && (
                <div>
                  <span className="text-xs text-gray-400">Working on</span>
                  <p className="text-sm text-gray-700">{contact.working_on}</p>
                </div>
              )}
              {contact.staff_notes && (
                <div>
                  <span className="text-xs text-gray-400">Staff notes</span>
                  <p className="text-sm text-gray-700">{contact.staff_notes}</p>
                </div>
              )}
              {contact.last_contact && (
                <InfoRow label="Last contact" value={new Date(contact.last_contact).toLocaleDateString()} />
              )}
            </div>
          </div>
        )}

        {/* Interactions (staff only) */}
        {isTeam && interactions.length > 0 && (
          <div className="bg-white rounded-2xl border border-gray-200 p-5">
            <h3 className="text-sm font-semibold text-gray-900 mb-3">Recent Interactions</h3>
            <div className="space-y-2">
              {interactions.map(i => (
                <div key={i.id} className="border-l-2 border-gray-200 pl-3 py-1">
                  <div className="flex items-center gap-2">
                    <span className="text-xs font-medium text-gray-600">{i.interaction_type}</span>
                    <span className="text-xs text-gray-400">{new Date(i.interaction_date).toLocaleDateString()}</span>
                  </div>
                  {i.title && <p className="text-sm text-gray-700">{i.title}</p>}
                  {i.notes && <p className="text-xs text-gray-500 mt-0.5">{i.notes}</p>}
                </div>
              ))}
            </div>
          </div>
        )}

        {/* Cohort history */}
        {cohorts.length > 0 && (
          <div className="bg-white rounded-2xl border border-gray-200 p-5">
            <h3 className="text-sm font-semibold text-gray-900 mb-3">Cohort History</h3>
            <div className="space-y-2">
              {cohorts.sort((a, b) => b.cohort_year - a.cohort_year).map(c => (
                <Link
                  key={c.id}
                  to={`/cohorts/${c.id}`}
                  className="flex items-center justify-between p-2 rounded-lg hover:bg-gray-50"
                >
                  <div className="flex items-center gap-2">
                    <span className={`w-2 h-2 rounded-full ${c.status === 'live' ? 'bg-status-green' : 'bg-gray-300'}`} />
                    <span className="text-sm text-gray-700">{c.name}</span>
                  </div>
                  <span className="text-xs text-gray-400 capitalize">{c.role}</span>
                </Link>
              ))}
            </div>
          </div>
        )}
      </div>
    </div>
  )
}

const PROGRAM_COLORS = {
  CPF: 'bg-blue-500',
  GGF: 'bg-orange-500',
  ESP: 'bg-purple-500',
  DAR: 'bg-emerald-600',
  MOS: 'bg-violet-600',
}

function InfoRow({ label, value, href }) {
  return (
    <div className="flex justify-between items-center">
      <span className="text-xs text-gray-400">{label}</span>
      {href ? (
        <a href={href} className="text-sm text-goldin hover:underline truncate ml-2">{value}</a>
      ) : (
        <span className="text-sm text-gray-700 truncate ml-2">{value}</span>
      )}
    </div>
  )
}

function SocialSection({ label, contact, fields }) {
  const links = fields
    .filter(f => contact[f])
    .map(f => ({ field: f, url: contact[f] }))

  if (links.length === 0) return null

  const platformName = (field) => {
    const base = field.replace('_org', '')
    return base.charAt(0).toUpperCase() + base.slice(1)
  }

  return (
    <div>
      <span className="text-xs text-gray-400">{label}</span>
      <div className="flex flex-wrap gap-1.5 mt-1">
        {links.map(({ field, url }) => (
          <a
            key={field}
            href={url.startsWith('http') ? url : `https://${url}`}
            target="_blank"
            rel="noopener noreferrer"
            className="text-xs px-2 py-1 rounded-lg bg-gray-100 text-gray-600 hover:bg-goldin/10 hover:text-goldin transition-colors"
          >
            {platformName(field)}
          </a>
        ))}
      </div>
    </div>
  )
}
