import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { useAuth } from '../contexts/AuthContext'
import { supabase } from '../lib/supabase'
import { programLabel, programColor } from '../lib/programs'

export default function CohortsPage() {
  const { hasRole } = useAuth()
  const [cohorts, setCohorts] = useState([])
  const [showArchived, setShowArchived] = useState(false)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    async function fetchCohorts() {
      const { data, error } = await supabase
        .from('cohorts')
        .select('*')
        .order('cohort_year', { ascending: false })

      if (!error && data) {
        setCohorts(data)
      }
      setLoading(false)
    }
    fetchCohorts()
  }, [])

  if (!hasRole('team')) {
    return (
      <div className="text-center py-20 text-gray-500">
        You don't have access to cohort management.
      </div>
    )
  }

  const liveCohorts = cohorts.filter(c => c.status === 'live')
  const archivedCohorts = cohorts.filter(c => c.status === 'archived')
  const displayed = showArchived ? archivedCohorts : liveCohorts

  if (loading) {
    return <div className="text-center py-20 text-gray-400">Loading cohorts...</div>
  }

  return (
    <div>
      <div className="flex items-center justify-between mb-6">
        <h2 className="text-2xl font-bold text-gray-900">Cohorts</h2>
        <div className="flex items-center gap-2">
          <button
            onClick={() => setShowArchived(false)}
            className={`px-3 py-1.5 rounded-lg text-sm font-medium transition-colors ${
              !showArchived ? 'bg-goldin/10 text-goldin' : 'text-gray-500 hover:bg-gray-100'
            }`}
          >
            Live ({liveCohorts.length})
          </button>
          <button
            onClick={() => setShowArchived(true)}
            className={`px-3 py-1.5 rounded-lg text-sm font-medium transition-colors ${
              showArchived ? 'bg-goldin/10 text-goldin' : 'text-gray-500 hover:bg-gray-100'
            }`}
          >
            Archived ({archivedCohorts.length})
          </button>
        </div>
      </div>

      {displayed.length === 0 ? (
        <div className="text-center py-20 text-gray-400">
          {showArchived ? 'No archived cohorts yet.' : 'No live cohorts. Create one to get started.'}
        </div>
      ) : (
        <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
          {displayed.map(cohort => (
            <CohortCard key={cohort.id} cohort={cohort} />
          ))}
        </div>
      )}
    </div>
  )
}

function CohortCard({ cohort }) {
  return (
    <Link to={`/cohorts/${cohort.id}`} className="bg-white rounded-2xl border border-gray-200 p-5 hover:shadow-md transition-shadow">
      <div className="flex items-center gap-2 mb-3">
        <span className={`px-2.5 py-0.5 rounded-full text-xs font-semibold text-white ${programColor(cohort.program)}`}>
          {programLabel(cohort.program, cohort.cohort_year)}
        </span>
      </div>
      <h3 className="font-semibold text-gray-900">{cohort.name}</h3>
      <p className="text-sm text-gray-500 mt-1">
        {cohort.city}, {cohort.country}
      </p>
    </Link>
  )
}
