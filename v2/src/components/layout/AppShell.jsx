import { useState } from 'react'
import { useAuth } from '../../contexts/AuthContext'
import Sidebar, { icons } from './Sidebar'

export default function AppShell({ children }) {
  const { contact, signOut } = useAuth()
  const [sidebarOpen, setSidebarOpen] = useState(false)

  return (
    <div className="min-h-screen bg-gray-50 font-sans flex">
      {/* Sidebar */}
      <Sidebar open={sidebarOpen} onClose={() => setSidebarOpen(false)} />

      {/* Main area */}
      <div className="flex-1 flex flex-col min-w-0">
        {/* Top bar */}
        <header className="bg-white border-b border-gray-200 sticky top-0 z-30 h-14 flex items-center justify-between px-4">
          {/* Mobile menu button */}
          <button
            onClick={() => setSidebarOpen(true)}
            className="lg:hidden text-gray-500 hover:text-gray-700"
          >
            {icons.menu}
          </button>

          {/* Spacer for desktop (sidebar handles logo) */}
          <div className="hidden lg:block" />

          {/* User area */}
          <div className="flex items-center gap-3">
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
        </header>

        {/* Page content */}
        <main className="flex-1 max-w-7xl w-full mx-auto px-4 py-6">
          {children}
        </main>
      </div>
    </div>
  )
}
