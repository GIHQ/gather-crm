import { Outlet, useLocation } from 'react-router-dom'
import { useAuth } from './contexts/AuthContext'
import AppShell from './components/layout/AppShell'
import LoginPage from './pages/LoginPage'

export default function App() {
  const { loading, user } = useAuth()
  const location = useLocation()

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-50">
        <div className="text-center">
          <div className="w-12 h-12 border-4 border-goldin border-t-transparent rounded-full animate-spin mx-auto" />
          <p className="mt-4 text-gray-500 font-sans">Loading GATHER...</p>
        </div>
      </div>
    )
  }

  if (!user) {
    return <LoginPage />
  }

  return (
    <AppShell>
      <div key={location.pathname}>
        <Outlet />
      </div>
    </AppShell>
  )
}
