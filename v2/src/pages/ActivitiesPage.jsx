import { useAuth } from '../contexts/AuthContext'

export default function ActivitiesPage() {
  const { hasRole } = useAuth()

  if (!hasRole('team')) {
    return <div className="text-center py-20 text-gray-500">Access denied.</div>
  }

  return (
    <div>
      <h2 className="text-2xl font-bold text-gray-900 mb-6">Activities</h2>
      <div className="bg-white rounded-2xl border border-gray-200 p-8 text-center">
        <p className="text-gray-400">Activity tracking coming soon.</p>
        <p className="text-sm text-gray-300 mt-2">News mentions, social media activity, and other notable updates.</p>
      </div>
    </div>
  )
}
