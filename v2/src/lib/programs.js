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
export function programLabel(program, year) {
  const label = PROGRAM_LABELS[program] || (program ? program.substring(0, 3).toUpperCase() : '???')
  if (year) {
    return `${label} '${String(year).slice(-2)}`
  }
  return label
}

// Get the Tailwind bg class for a program
export function programColor(program) {
  return PROGRAM_COLORS[program] || 'bg-gray-500'
}
