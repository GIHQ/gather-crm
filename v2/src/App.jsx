import { Routes, Route, Navigate } from 'react-router-dom'
import { useAuth } from './contexts/AuthContext'
import AppShell from './components/layout/AppShell'
import LoginPage from './pages/LoginPage'
import CohortsPage from './pages/CohortsPage'
import AlumniPage from './pages/AlumniPage'

export default function App() {
  const { loading, user } = useAuth()

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
      <Routes>
        <Route path="/" element={<Navigate to="/cohorts" replace />} />
        <Route path="/cohorts" element={<CohortsPage />} />
        <Route path="/alumni" element={<AlumniPage />} />
      </Routes>
    </AppShell>
  )
}
