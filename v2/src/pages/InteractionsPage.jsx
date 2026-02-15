import { useAuth } from '../contexts/AuthContext'

export default function InteractionsPage() {
  const { hasRole } = useAuth()

  if (!hasRole('team')) {
    return <div className="text-center py-20 text-gray-500">Access denied.</div>
  }

  return (
    <div>
      <h2 className="text-2xl font-bold text-gray-900 mb-6">Interactions</h2>
      <div className="bg-white rounded-2xl border border-gray-200 p-8 text-center">
        <p className="text-gray-400">Interaction logging coming soon.</p>
        <p className="text-sm text-gray-300 mt-2">Log calls, emails, meetings, and other touchpoints with contacts.</p>
      </div>
    </div>
  )
}
