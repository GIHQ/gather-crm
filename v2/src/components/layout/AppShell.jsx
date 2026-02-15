import { NavLink } from 'react-router-dom'
import { useAuth } from '../../contexts/AuthContext'

export default function AppShell({ children }) {
  const { contact, role, signOut, isTeam } = useAuth()

  return (
    <div className="min-h-screen bg-gray-50 font-sans">
      {/* Top nav */}
      <header className="bg-white border-b border-gray-200 sticky top-0 z-50">
        <div className="max-w-7xl mx-auto px-4 h-14 flex items-center justify-between">
          <div className="flex items-center gap-6">
            <h1 className="text-xl font-bold text-goldin">GATHER</h1>
            <nav className="flex gap-1">
              {isTeam && (
                <NavLink
                  to="/cohorts"
                  className={({ isActive }) =>
                    `px-3 py-1.5 rounded-lg text-sm font-medium transition-colors ${
                      isActive
                        ? 'bg-goldin/10 text-goldin'
                        : 'text-gray-600 hover:bg-gray-100'
                    }`
                  }
                >
                  Cohorts
                </NavLink>
              )}
              <NavLink
                to="/alumni"
                className={({ isActive }) =>
                  `px-3 py-1.5 rounded-lg text-sm font-medium transition-colors ${
                    isActive
                      ? 'bg-goldin/10 text-goldin'
                      : 'text-gray-600 hover:bg-gray-100'
                  }`
                }
              >
                Alumni
              </NavLink>
            </nav>
          </div>

          <div className="flex items-center gap-3">
            <span className="text-xs text-gray-400 capitalize">{role}</span>
            {contact && (
              <span className="text-sm text-gray-700">
                {contact.first_name}
              </span>
            )}
            <button
              onClick={signOut}
              className="text-xs text-gray-400 hover:text-gray-600"
            >
              Sign out
            </button>
          </div>
        </div>
      </header>

      {/* Main content */}
      <main className="max-w-7xl mx-auto px-4 py-6">
        {children}
      </main>
    </div>
  )
}
