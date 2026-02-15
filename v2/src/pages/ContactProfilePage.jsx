import { useEffect, useState } from 'react'
import { useParams, Link } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { supabase } from '../lib/supabase'
import { programLabel, programColor } from '../lib/programs'
import Modal, { FormField, inputClass, selectClass, textareaClass } from '../components/ui/Modal'

export default function ContactProfilePage() {
  const { id } = useParams()
  const { hasRole, isTeam, contact: authContact } = useAuth()
  const [contact, setContact] = useState(null)
  const [cohorts, setCohorts] = useState([])
  const [interactions, setInteractions] = useState([])
  const [focusTags, setFocusTags] = useState([])
  const [loading, setLoading] = useState(true)
  const [editOpen, setEditOpen] = useState(false)
  const [interactionOpen, setInteractionOpen] = useState(false)

  async function fetchData() {
    const [contactRes, cohortsRes, interactionsRes, tagsRes] = await Promise.all([
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
      supabase
        .from('contact_focus_tags')
        .select('focus_tags (id, name, focus_categories (id, name))')
        .eq('contact_id', id),
    ])

    setContact(contactRes.data)
    setCohorts((cohortsRes.data || []).map(r => ({ ...r.cohorts, role: r.role })))
    setInteractions(interactionsRes.data || [])

    const tags = (tagsRes.data || [])
      .map(t => t.focus_tags)
      .filter(Boolean)
    setFocusTags(tags)

    setLoading(false)
  }

  useEffect(() => {
    fetchData()
  }, [id, isTeam])

  if (loading) return <div className="text-center py-20 text-gray-400">Loading...</div>
  if (!contact) return <div className="text-center py-20 text-gray-500">Contact not found.</div>

  // Group focus tags by category name
  const tagsByCategory = {}
  for (const tag of focusTags) {
    const catName = tag.focus_categories?.name || 'Other'
    if (!tagsByCategory[catName]) tagsByCategory[catName] = []
    tagsByCategory[catName].push(tag.name)
  }

  // Collect legacy focus areas as fallback
  const legacyFocusAreas = [contact.focus_area_1, contact.focus_area_2, contact.focus_area_3].filter(Boolean)

  function handleSaved() {
    fetchData()
  }

  return (
    <div className="max-w-3xl mx-auto">
      {/* Back nav */}
      <Link to="/alumni" className="text-sm text-gray-400 hover:text-gray-600 mb-4 inline-block">&larr; Back to directory</Link>

      {/* Profile header */}
      <div className="bg-white rounded-2xl border border-gray-200 p-6 mb-6">
        <div className="flex items-start gap-4">
          <div className="w-20 h-20 rounded-full bg-gray-200 overflow-hidden flex-shrink-0">
            {contact.photo_url ? (
              <img src={contact.photo_url} alt="" className="w-full h-full object-cover" />
            ) : (
              <div className="w-full h-full flex items-center justify-center text-gray-400 text-2xl font-semibold">
                {contact.first_name?.[0]}{contact.last_name?.[0]}
              </div>
            )}
          </div>
          <div className="flex-1 min-w-0">
            <div className="flex items-center gap-2">
              <h1 className="text-xl font-bold text-gray-900">
                {contact.first_name} {contact.last_name}
              </h1>
              {isTeam && (
                <button
                  onClick={() => setEditOpen(true)}
                  className="text-gray-400 hover:text-goldin p-1"
                  title="Edit contact"
                >
                  <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                    <path strokeLinecap="round" strokeLinejoin="round" d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0115.75 21H5.25A2.25 2.25 0 013 18.75V8.25A2.25 2.25 0 015.25 6H10" />
                  </svg>
                </button>
              )}
            </div>
            {contact.job_title && contact.organization && (
              <p className="text-sm text-gray-600">{contact.job_title} at {contact.organization}</p>
            )}
            {!contact.job_title && contact.organization && (
              <p className="text-sm text-gray-600">{contact.organization}</p>
            )}
            {(contact.city || contact.country) && (
              <p className="text-sm text-gray-400 mt-0.5">
                {[contact.city, contact.region, contact.country].filter(Boolean).join(', ')}
              </p>
            )}

            {/* Program badges + status */}
            <div className="flex flex-wrap gap-1.5 mt-2">
              {cohorts.map(c => (
                <Link
                  key={c.id}
                  to={`/cohorts/${c.id}`}
                  className={`px-2 py-0.5 rounded-full text-xs font-semibold text-white ${programColor(c.program)}`}
                >
                  {programLabel(c.program, c.cohort_year)}
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

        {/* Quick actions */}
        <div className="flex flex-wrap gap-2 mt-4 pt-4 border-t border-gray-100">
          {contact.email && (
            <a href={`mailto:${contact.email}`} className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-blue-50 text-blue-700 text-xs font-medium hover:bg-blue-100 transition-colors">
              <svg className="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}><path strokeLinecap="round" strokeLinejoin="round" d="M21.75 6.75v10.5a2.25 2.25 0 01-2.25 2.25h-15a2.25 2.25 0 01-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25m19.5 0v.243a2.25 2.25 0 01-1.07 1.916l-7.5 4.615a2.25 2.25 0 01-2.36 0L3.32 8.91a2.25 2.25 0 01-1.07-1.916V6.75" /></svg>
              Email
            </a>
          )}
          {contact.phone && (
            <>
              <a href={`tel:${contact.phone}`} className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-green-50 text-green-700 text-xs font-medium hover:bg-green-100 transition-colors">
                <svg className="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}><path strokeLinecap="round" strokeLinejoin="round" d="M2.25 6.75c0 8.284 6.716 15 15 15h2.25a2.25 2.25 0 002.25-2.25v-1.372c0-.516-.351-.966-.852-1.091l-4.423-1.106c-.44-.11-.902.055-1.173.417l-.97 1.293c-.282.376-.769.542-1.21.38a12.035 12.035 0 01-7.143-7.143c-.162-.441.004-.928.38-1.21l1.293-.97c.363-.271.527-.734.417-1.173L6.963 3.102a1.125 1.125 0 00-1.091-.852H4.5A2.25 2.25 0 002.25 4.5v2.25z" /></svg>
                Call
              </a>
              <a href={`sms:${contact.phone}`} className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-purple-50 text-purple-700 text-xs font-medium hover:bg-purple-100 transition-colors">
                <svg className="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}><path strokeLinecap="round" strokeLinejoin="round" d="M8.625 12a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0H8.25m4.125 0a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0H12m4.125 0a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0h-.375M21 12c0 4.556-4.03 8.25-9 8.25a9.764 9.764 0 01-2.555-.337A5.972 5.972 0 015.41 20.97a5.969 5.969 0 01-.474-.065 4.48 4.48 0 00.978-2.025c.09-.457-.133-.901-.467-1.226C3.93 16.178 3 14.189 3 12c0-4.556 4.03-8.25 9-8.25s9 3.694 9 8.25z" /></svg>
                Text
              </a>
            </>
          )}
          {contact.linkedin && (
            <a href={contact.linkedin.startsWith('http') ? contact.linkedin : `https://${contact.linkedin}`} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-sky-50 text-sky-700 text-xs font-medium hover:bg-sky-100 transition-colors">
              LinkedIn
            </a>
          )}
          {contact.whatsapp && (
            <a href={`https://wa.me/${contact.whatsapp.replace(/\D/g, '')}`} target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-emerald-50 text-emerald-700 text-xs font-medium hover:bg-emerald-100 transition-colors">
              WhatsApp
            </a>
          )}

          {/* Log interaction button for staff */}
          {isTeam && (
            <button
              onClick={() => setInteractionOpen(true)}
              className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-goldin/10 text-goldin text-xs font-medium hover:bg-goldin/20 transition-colors ml-auto"
            >
              <svg className="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                <path strokeLinecap="round" strokeLinejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
              </svg>
              Log Interaction
            </button>
          )}
        </div>

        {/* Bio */}
        {contact.biography && (
          <p className="text-sm text-gray-600 mt-4 leading-relaxed">{contact.biography}</p>
        )}
      </div>

      {/* Focus tags */}
      {(Object.keys(tagsByCategory).length > 0 || legacyFocusAreas.length > 0) && (
        <div className="bg-white rounded-2xl border border-gray-200 p-5 mb-6">
          <h3 className="text-sm font-semibold text-gray-900 mb-3">Focus Areas & Skills</h3>
          {Object.entries(tagsByCategory).map(([category, tags]) => (
            <div key={category} className="mb-3 last:mb-0">
              <span className="text-xs font-medium text-gray-400 uppercase tracking-wider">{category}</span>
              <div className="flex flex-wrap gap-1.5 mt-1">
                {tags.map(tag => (
                  <span key={tag} className="px-2.5 py-1 rounded-lg bg-goldin/10 text-goldin text-xs font-medium">
                    {tag}
                  </span>
                ))}
              </div>
            </div>
          ))}
          {legacyFocusAreas.length > 0 && Object.keys(tagsByCategory).length === 0 && (
            <div className="flex flex-wrap gap-1.5">
              {legacyFocusAreas.map(area => (
                <span key={area} className="px-2.5 py-1 rounded-lg bg-goldin/10 text-goldin text-xs font-medium">
                  {area}
                </span>
              ))}
            </div>
          )}
        </div>
      )}

      <div className="grid gap-6 md:grid-cols-2">
        {/* Contact info */}
        <div className="bg-white rounded-2xl border border-gray-200 p-5">
          <h3 className="text-sm font-semibold text-gray-900 mb-3">Contact Info</h3>
          <div className="space-y-2">
            {contact.email && <InfoRow label="Email" value={contact.email} href={`mailto:${contact.email}`} />}
            {contact.work_email && <InfoRow label="Work Email" value={contact.work_email} href={`mailto:${contact.work_email}`} />}
            {contact.alternate_emails?.length > 0 && (
              <InfoRow label="Alt Emails" value={contact.alternate_emails.join(', ')} />
            )}
            {contact.phone && <InfoRow label="Phone" value={contact.phone} href={`tel:${contact.phone}`} />}
            {contact.birthday && <InfoRow label="Birthday" value={formatBirthday(contact.birthday)} />}
            {contact.gender && <InfoRow label="Gender" value={contact.gender} />}
            {contact.community_area && <InfoRow label="Community" value={contact.community_area} />}
            {contact.languages && <InfoRow label="Languages" value={contact.languages} />}
          </div>
        </div>

        {/* Social links */}
        <div className="bg-white rounded-2xl border border-gray-200 p-5">
          <h3 className="text-sm font-semibold text-gray-900 mb-3">Social</h3>
          <div className="space-y-3">
            <SocialSection label="Personal" contact={contact} fields={['linkedin', 'twitter', 'instagram', 'facebook', 'website', 'tiktok']} />
            <SocialSection label="Organization" contact={contact} fields={['linkedin_org', 'twitter_org', 'instagram_org', 'facebook_org', 'website_org']} />
            {!hasAnySocial(contact) && (
              <p className="text-xs text-gray-400">No social links added.</p>
            )}
          </div>
        </div>

        {/* Staff notes (staff only) */}
        {isTeam && (
          <div className="bg-white rounded-2xl border border-gray-200 p-5">
            <h3 className="text-sm font-semibold text-gray-900 mb-3">Staff Notes</h3>
            <p className="text-[10px] text-gray-400 -mt-2 mb-3">Internal notes visible only to staff</p>
            <div className="space-y-2">
              {contact.working_on && (
                <div>
                  <span className="text-xs text-gray-400">Currently working on</span>
                  <p className="text-sm text-gray-700">{contact.working_on}</p>
                </div>
              )}
              {contact.staff_notes && (
                <div>
                  <span className="text-xs text-gray-400">Notes</span>
                  <p className="text-sm text-gray-700">{contact.staff_notes}</p>
                </div>
              )}
              {contact.last_contact && (
                <InfoRow label="Last contact" value={new Date(contact.last_contact).toLocaleDateString()} />
              )}
              {!contact.working_on && !contact.staff_notes && !contact.last_contact && (
                <p className="text-xs text-gray-400">No staff notes yet.</p>
              )}
            </div>
          </div>
        )}

        {/* Interactions (staff only) */}
        {isTeam && (
          <div className="bg-white rounded-2xl border border-gray-200 p-5">
            <div className="flex items-center justify-between mb-3">
              <h3 className="text-sm font-semibold text-gray-900">Recent Interactions</h3>
              <button
                onClick={() => setInteractionOpen(true)}
                className="text-xs text-goldin hover:underline"
              >
                + Add
              </button>
            </div>
            {interactions.length > 0 ? (
              <div className="space-y-2">
                {interactions.map(i => (
                  <div key={i.id} className="border-l-2 border-gray-200 pl-3 py-1">
                    <div className="flex items-center gap-2">
                      <span className={`text-xs font-medium px-1.5 py-0.5 rounded ${INTERACTION_COLORS[i.interaction_type] || 'bg-gray-100 text-gray-600'}`}>
                        {i.interaction_type}
                      </span>
                      <span className="text-xs text-gray-400">{new Date(i.interaction_date).toLocaleDateString()}</span>
                    </div>
                    {i.title && <p className="text-sm text-gray-700 mt-0.5">{i.title}</p>}
                    {i.notes && <p className="text-xs text-gray-500 mt-0.5 line-clamp-2">{i.notes}</p>}
                  </div>
                ))}
              </div>
            ) : (
              <p className="text-xs text-gray-400">No interactions logged yet.</p>
            )}
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

      {/* Edit Contact Modal */}
      {editOpen && (
        <EditContactModal
          contact={contact}
          onClose={() => setEditOpen(false)}
          onSaved={handleSaved}
        />
      )}

      {/* Add Interaction Modal */}
      {interactionOpen && (
        <AddInteractionModal
          contactId={id}
          contactName={`${contact.first_name} ${contact.last_name}`}
          onClose={() => setInteractionOpen(false)}
          onSaved={handleSaved}
        />
      )}
    </div>
  )
}


// ---------------------------------------------------------------------------
// Edit Contact Modal
// ---------------------------------------------------------------------------

function EditContactModal({ contact, onClose, onSaved }) {
  const [form, setForm] = useState({
    first_name: contact.first_name || '',
    last_name: contact.last_name || '',
    email: contact.email || '',
    work_email: contact.work_email || '',
    phone: contact.phone || '',
    birthday: contact.birthday || '',
    gender: contact.gender || '',
    photo_url: contact.photo_url || '',
    biography: contact.biography || '',
    organization: contact.organization || '',
    job_title: contact.job_title || '',
    city: contact.city || '',
    country: contact.country || '',
    region: contact.region || '',
    community_area: contact.community_area || '',
    languages: contact.languages || '',
    status: contact.status || 'Alumni',
    linkedin: contact.linkedin || '',
    twitter: contact.twitter || '',
    instagram: contact.instagram || '',
    facebook: contact.facebook || '',
    website: contact.website || '',
    tiktok: contact.tiktok || '',
    linkedin_org: contact.linkedin_org || '',
    twitter_org: contact.twitter_org || '',
    instagram_org: contact.instagram_org || '',
    facebook_org: contact.facebook_org || '',
    website_org: contact.website_org || '',
    working_on: contact.working_on || '',
    staff_notes: contact.staff_notes || '',
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

    // Only send changed fields
    const updates = {}
    for (const [key, value] of Object.entries(form)) {
      if (value !== (contact[key] || '')) {
        updates[key] = value || null
      }
    }

    if (Object.keys(updates).length === 0) {
      onClose()
      return
    }

    updates.updated_at = new Date().toISOString()

    const { error: err } = await supabase
      .from('contacts')
      .update(updates)
      .eq('id', contact.id)

    setSaving(false)

    if (err) {
      setError(err.message)
    } else {
      onSaved()
      onClose()
    }
  }

  return (
    <Modal open={true} onClose={onClose} title="Edit Contact" wide>
      <form onSubmit={handleSubmit} className="space-y-4">
        {error && (
          <div className="text-sm text-red-600 bg-red-50 px-3 py-2 rounded-lg">{error}</div>
        )}

        {/* Identity */}
        <div className="text-xs font-semibold text-gray-400 uppercase tracking-wider">Identity</div>
        <div className="grid grid-cols-2 gap-3">
          <FormField label="First Name">
            <input className={inputClass} value={form.first_name} onChange={handleChange('first_name')} required />
          </FormField>
          <FormField label="Last Name">
            <input className={inputClass} value={form.last_name} onChange={handleChange('last_name')} required />
          </FormField>
        </div>
        <div className="grid grid-cols-2 gap-3">
          <FormField label="Email">
            <input type="email" className={inputClass} value={form.email} onChange={handleChange('email')} />
          </FormField>
          <FormField label="Work Email">
            <input type="email" className={inputClass} value={form.work_email} onChange={handleChange('work_email')} />
          </FormField>
        </div>
        <div className="grid grid-cols-2 gap-3">
          <FormField label="Phone">
            <input className={inputClass} value={form.phone} onChange={handleChange('phone')} />
          </FormField>
          <FormField label="Birthday">
            <input type="date" className={inputClass} value={form.birthday} onChange={handleChange('birthday')} />
          </FormField>
        </div>
        <div className="grid grid-cols-2 gap-3">
          <FormField label="Gender">
            <input className={inputClass} value={form.gender} onChange={handleChange('gender')} />
          </FormField>
          <FormField label="Status">
            <select className={selectClass} value={form.status} onChange={handleChange('status')}>
              <option value="Alumni">Alumni</option>
              <option value="Current">Current</option>
              <option value="Staff">Staff</option>
            </select>
          </FormField>
        </div>
        <FormField label="Photo URL">
          <input type="url" className={inputClass} value={form.photo_url} onChange={handleChange('photo_url')} placeholder="https://..." />
        </FormField>
        <FormField label="Biography">
          <textarea className={textareaClass} rows={3} value={form.biography} onChange={handleChange('biography')} />
        </FormField>

        {/* Professional */}
        <div className="text-xs font-semibold text-gray-400 uppercase tracking-wider pt-2">Professional</div>
        <div className="grid grid-cols-2 gap-3">
          <FormField label="Organization">
            <input className={inputClass} value={form.organization} onChange={handleChange('organization')} />
          </FormField>
          <FormField label="Job Title">
            <input className={inputClass} value={form.job_title} onChange={handleChange('job_title')} />
          </FormField>
        </div>

        {/* Location */}
        <div className="text-xs font-semibold text-gray-400 uppercase tracking-wider pt-2">Location</div>
        <div className="grid grid-cols-3 gap-3">
          <FormField label="City">
            <input className={inputClass} value={form.city} onChange={handleChange('city')} />
          </FormField>
          <FormField label="Region">
            <input className={inputClass} value={form.region} onChange={handleChange('region')} />
          </FormField>
          <FormField label="Country">
            <input className={inputClass} value={form.country} onChange={handleChange('country')} />
          </FormField>
        </div>
        <div className="grid grid-cols-2 gap-3">
          <FormField label="Community Area">
            <input className={inputClass} value={form.community_area} onChange={handleChange('community_area')} />
          </FormField>
          <FormField label="Languages">
            <input className={inputClass} value={form.languages} onChange={handleChange('languages')} />
          </FormField>
        </div>

        {/* Social */}
        <div className="text-xs font-semibold text-gray-400 uppercase tracking-wider pt-2">Social Links (Personal)</div>
        <div className="grid grid-cols-2 gap-3">
          <FormField label="LinkedIn"><input className={inputClass} value={form.linkedin} onChange={handleChange('linkedin')} /></FormField>
          <FormField label="Twitter"><input className={inputClass} value={form.twitter} onChange={handleChange('twitter')} /></FormField>
          <FormField label="Instagram"><input className={inputClass} value={form.instagram} onChange={handleChange('instagram')} /></FormField>
          <FormField label="Facebook"><input className={inputClass} value={form.facebook} onChange={handleChange('facebook')} /></FormField>
          <FormField label="Website"><input className={inputClass} value={form.website} onChange={handleChange('website')} /></FormField>
          <FormField label="TikTok"><input className={inputClass} value={form.tiktok} onChange={handleChange('tiktok')} /></FormField>
        </div>

        <div className="text-xs font-semibold text-gray-400 uppercase tracking-wider pt-2">Social Links (Organization)</div>
        <div className="grid grid-cols-2 gap-3">
          <FormField label="LinkedIn (Org)"><input className={inputClass} value={form.linkedin_org} onChange={handleChange('linkedin_org')} /></FormField>
          <FormField label="Twitter (Org)"><input className={inputClass} value={form.twitter_org} onChange={handleChange('twitter_org')} /></FormField>
          <FormField label="Instagram (Org)"><input className={inputClass} value={form.instagram_org} onChange={handleChange('instagram_org')} /></FormField>
          <FormField label="Facebook (Org)"><input className={inputClass} value={form.facebook_org} onChange={handleChange('facebook_org')} /></FormField>
          <FormField label="Website (Org)"><input className={inputClass} value={form.website_org} onChange={handleChange('website_org')} /></FormField>
        </div>

        {/* Staff Notes */}
        <div className="text-xs font-semibold text-gray-400 uppercase tracking-wider pt-2">Staff Notes</div>
        <FormField label="Currently Working On">
          <textarea className={textareaClass} rows={2} value={form.working_on} onChange={handleChange('working_on')} />
        </FormField>
        <FormField label="Internal Notes">
          <textarea className={textareaClass} rows={3} value={form.staff_notes} onChange={handleChange('staff_notes')} />
        </FormField>

        {/* Actions */}
        <div className="flex justify-end gap-3 pt-4 border-t border-gray-200">
          <button type="button" onClick={onClose} className="px-4 py-2 text-sm text-gray-600 hover:text-gray-800">
            Cancel
          </button>
          <button
            type="submit"
            disabled={saving}
            className="px-5 py-2 bg-goldin text-white text-sm font-medium rounded-lg hover:bg-goldin-dark disabled:opacity-50 transition-colors"
          >
            {saving ? 'Saving...' : 'Save Changes'}
          </button>
        </div>
      </form>
    </Modal>
  )
}


// ---------------------------------------------------------------------------
// Add Interaction Modal
// ---------------------------------------------------------------------------

const INTERACTION_TYPES = ['email', 'call', 'meeting', 'text', 'social_media', 'note', 'other']

function AddInteractionModal({ contactId, contactName, onClose, onSaved }) {
  const [form, setForm] = useState({
    interaction_type: 'note',
    interaction_date: new Date().toISOString().split('T')[0],
    title: '',
    notes: '',
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
      .from('interactions')
      .insert({
        contact_id: contactId,
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
    <Modal open={true} onClose={onClose} title={`Log Interaction — ${contactName}`}>
      <form onSubmit={handleSubmit} className="space-y-4">
        {error && (
          <div className="text-sm text-red-600 bg-red-50 px-3 py-2 rounded-lg">{error}</div>
        )}

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


// ---------------------------------------------------------------------------
// Shared constants & helpers
// ---------------------------------------------------------------------------

const INTERACTION_COLORS = {
  email: 'bg-blue-50 text-blue-700',
  call: 'bg-green-50 text-green-700',
  meeting: 'bg-purple-50 text-purple-700',
  text: 'bg-yellow-50 text-yellow-700',
  social_media: 'bg-pink-50 text-pink-700',
  other: 'bg-gray-100 text-gray-600',
}

function formatBirthday(dateStr) {
  if (!dateStr) return ''
  const d = new Date(dateStr + 'T00:00:00')
  return d.toLocaleDateString('en-US', { month: 'long', day: 'numeric', year: 'numeric' })
}

function hasAnySocial(contact) {
  const fields = ['linkedin', 'twitter', 'instagram', 'facebook', 'website', 'tiktok',
    'linkedin_org', 'twitter_org', 'instagram_org', 'facebook_org', 'website_org']
  return fields.some(f => contact[f])
}

function InfoRow({ label, value, href }) {
  return (
    <div className="flex justify-between items-start gap-2">
      <span className="text-xs text-gray-400 flex-shrink-0">{label}</span>
      {href ? (
        <a href={href} className="text-sm text-goldin hover:underline truncate text-right">{value}</a>
      ) : (
        <span className="text-sm text-gray-700 truncate text-right">{value}</span>
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
