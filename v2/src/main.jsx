import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { createBrowserRouter, RouterProvider } from 'react-router-dom'
import { AuthProvider } from './contexts/AuthContext'
import App from './App'
import DashboardPage from './pages/DashboardPage'
import CohortsPage from './pages/CohortsPage'
import CohortDetailPage from './pages/CohortDetailPage'
import AlumniPage from './pages/AlumniPage'
import ContactProfilePage from './pages/ContactProfilePage'
import InteractionsPage from './pages/InteractionsPage'
import ActivitiesPage from './pages/ActivitiesPage'
import TeamPage from './pages/TeamPage'
import SettingsPage from './pages/SettingsPage'
import './index.css'

const router = createBrowserRouter([
  {
    element: <App />,
    children: [
      { index: true, element: <DashboardPage /> },
      { path: 'cohorts', element: <CohortsPage /> },
      { path: 'cohorts/:id', element: <CohortDetailPage /> },
      { path: 'alumni', element: <AlumniPage /> },
      { path: 'contacts/:id', element: <ContactProfilePage /> },
      { path: 'interactions', element: <InteractionsPage /> },
      { path: 'activities', element: <ActivitiesPage /> },
      { path: 'team', element: <TeamPage /> },
      { path: 'settings', element: <SettingsPage /> },
    ],
  },
])

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <AuthProvider>
      <RouterProvider router={router} />
    </AuthProvider>
  </StrictMode>,
)
