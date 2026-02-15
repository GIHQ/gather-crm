import { useState } from 'react'
import { useAuth } from '../contexts/AuthContext'

export default function LoginPage() {
  const { signIn, verifyOtp } = useAuth()
  const [email, setEmail] = useState('')
  const [otpCode, setOtpCode] = useState('')
  const [step, setStep] = useState('email') // email | otp
  const [error, setError] = useState(null)
  const [sending, setSending] = useState(false)

  async function handleSendOtp(e) {
    e.preventDefault()
    setError(null)
    setSending(true)

    const { error } = await signIn(email)

    setSending(false)
    if (error) {
      setError(error.message)
    } else {
      setStep('otp')
    }
  }

  async function handleVerifyOtp(e) {
    e.preventDefault()
    setError(null)
    setSending(true)

    const { error } = await verifyOtp(email, otpCode)

    setSending(false)
    if (error) {
      setError(error.message)
    }
    // On success, onAuthStateChange fires and App re-renders
  }

  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-50 px-4 font-sans">
      <div className="w-full max-w-sm">
        <div className="text-center mb-8">
          <h1 className="text-3xl font-bold text-goldin">GATHER</h1>
          <p className="text-gray-500 mt-2">Goldin Institute Fellowship Platform</p>
        </div>

        <div className="bg-white rounded-2xl shadow-sm border border-gray-200 p-6">
          {step === 'email' ? (
            <form onSubmit={handleSendOtp}>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                Email address
              </label>
              <input
                type="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                placeholder="you@example.com"
                required
                className="w-full px-3 py-2.5 border border-gray-300 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-goldin/50 focus:border-goldin"
              />
              <button
                type="submit"
                disabled={sending}
                className="w-full mt-4 py-3 bg-goldin text-white rounded-xl font-semibold text-sm hover:bg-goldin-dark transition-colors disabled:opacity-50"
              >
                {sending ? 'Sending code...' : 'Send verification code'}
              </button>
            </form>
          ) : (
            <form onSubmit={handleVerifyOtp}>
              <p className="text-sm text-gray-600 mb-4">
                Enter the 6-digit code sent to <strong>{email}</strong>
              </p>
              <input
                type="text"
                value={otpCode}
                onChange={(e) => setOtpCode(e.target.value.replace(/\D/g, '').slice(0, 6))}
                placeholder="000000"
                maxLength={6}
                required
                className="w-full px-3 py-2.5 border border-gray-300 rounded-xl text-sm text-center tracking-widest text-lg font-mono focus:outline-none focus:ring-2 focus:ring-goldin/50 focus:border-goldin"
              />
              <button
                type="submit"
                disabled={sending || otpCode.length !== 6}
                className="w-full mt-4 py-3 bg-goldin text-white rounded-xl font-semibold text-sm hover:bg-goldin-dark transition-colors disabled:opacity-50"
              >
                {sending ? 'Verifying...' : 'Verify code'}
              </button>
              <button
                type="button"
                onClick={() => { setStep('email'); setOtpCode(''); setError(null) }}
                className="w-full mt-2 py-2 text-sm text-gray-500 hover:text-gray-700"
              >
                Use a different email
              </button>
            </form>
          )}

          {error && (
            <p className="mt-3 text-sm text-red-600 text-center">{error}</p>
          )}
        </div>
      </div>
    </div>
  )
}
