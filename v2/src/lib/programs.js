// Program badge colors and helpers — single source of truth
// Matches v1 color scheme: all 3-char codes with consistent colors

export const PROGRAM_COLORS = {
  CPF: 'bg-blue-700',
  GGF: 'bg-orange-500',
  ESP: 'bg-orange-700',
  DAR: 'bg-emerald-600',
  MOS: 'bg-violet-600',
}

export const PROGRAM_LABELS = {
  CPF: 'CPF',
  GGF: 'GGF',
  ESP: 'ESP',
  DAR: 'DAR',
  MOS: 'MOS',
}

// Format a program badge label with optional year: "CPF '24"
// Only appends year if the value is a 4-digit number (or coercible to one).
// The contacts.cohort field often has text like "English" or "Español" — skip those.
export function programLabel(program, year) {
  const label = PROGRAM_LABELS[program] || (program ? program.substring(0, 3).toUpperCase() : '???')
  const num = Number(year)
  if (num >= 2000 && num <= 2099) {
    return `${label} '${String(num).slice(-2)}`
  }
  return label
}

// Get the Tailwind bg class for a program
export function programColor(program) {
  return PROGRAM_COLORS[program] || 'bg-gray-500'
}
