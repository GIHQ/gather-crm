# GATHER Style Guide

## Brand Colors

### Primary Palette
| Name | Hex | Tailwind Class | Usage |
|------|-----|----------------|-------|
| Goldin Orange | #E87722 | `bg-goldin-orange` | Primary buttons, accents, CTAs |
| Orange Dark | #D56A1C | `bg-goldin-orange-dark` | Hover states, active states |
| Gray | #6B7280 | `bg-gray-500` | Secondary text, icons |
| Gray Dark | #374151 | `bg-gray-dark` | Primary text, headers |

### Program Colors
| Program | Badge Color | Tailwind Class |
|---------|-------------|----------------|
| CPF (Chicago) | Blue | `bg-blue-700` |
| GGF (Global English) | Orange | `bg-orange-500` |
| ESP (Español) | Dark Orange | `bg-orange-700` |

### Status Colors
| Status | Color | Usage |
|--------|-------|-------|
| Green | `bg-green-500` | Active, healthy, recent contact |
| Yellow | `bg-yellow-500` | Warning, needs attention |
| Red | `bg-red-500` | Overdue, urgent, error |

---

## Typography

### Font Family
```css
font-family: 'DM Sans', system-ui, sans-serif;
```

Loaded from Google Fonts:
```html
<link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,400;0,9..40,500;0,9..40,600;0,9..40,700&display=swap" rel="stylesheet">
```

### Font Sizes
| Element | Size | Weight | Class |
|---------|------|--------|-------|
| Page Title | 24px | Bold | `text-2xl font-bold` |
| Section Header | 18px | Semibold | `text-lg font-semibold` |
| Card Title | 16px | Semibold | `text-base font-semibold` |
| Body Text | 14px | Normal | `text-sm` |
| Caption/Label | 12px | Medium | `text-xs font-medium` |

---

## Components

### Buttons

**Primary Button (Orange)**
```html
<button class="w-full py-4 bg-goldin-orange text-white font-semibold rounded-xl hover:bg-goldin-orange-dark transition">
  Button Text
</button>
```

**Secondary Button (Gray outline)**
```html
<button class="w-full py-3 border-2 border-gray-300 text-gray-700 font-medium rounded-xl hover:bg-gray-50 transition">
  Button Text
</button>
```

**Icon Button (Header)**
```html
<button class="w-10 h-10 bg-goldin-orange text-white rounded-full flex items-center justify-center">
  <svg>...</svg>
</button>
```

### Cards

**Fellow Card**
```html
<div class="bg-white rounded-xl shadow-sm border border-gray-100 p-4">
  <div class="flex items-center gap-3">
    <img class="w-12 h-12 rounded-full object-cover" src="..." alt="">
    <div>
      <h3 class="font-semibold text-gray-900">Fellow Name</h3>
      <p class="text-sm text-gray-500">Organization</p>
    </div>
    <span class="ml-auto px-2 py-1 text-xs font-medium rounded-full bg-blue-700 text-white">CPF</span>
  </div>
</div>
```

### Program Pills/Badges

```html
<!-- CPF - Blue -->
<span class="px-2 py-1 text-xs font-medium rounded-full bg-blue-700 text-white">CPF</span>

<!-- GGF - Orange -->
<span class="px-2 py-1 text-xs font-medium rounded-full bg-orange-500 text-white">GGF</span>

<!-- ESP - Dark Orange -->
<span class="px-2 py-1 text-xs font-medium rounded-full bg-orange-700 text-white">ESP</span>

<!-- With Year -->
<span class="px-2 py-1 text-xs font-medium rounded-full bg-blue-700 text-white">CPF '22</span>
```

### Toggle Switches

```html
<!-- Selected -->
<button class="relative w-12 h-7 rounded-full bg-orange-500">
  <span class="absolute top-1 w-5 h-5 bg-white rounded-full translate-x-6"></span>
</button>

<!-- Unselected -->
<button class="relative w-12 h-7 rounded-full bg-gray-300">
  <span class="absolute top-1 w-5 h-5 bg-white rounded-full translate-x-1"></span>
</button>
```

### Form Inputs

```html
<input 
  type="text" 
  class="w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-orange-500 focus:border-orange-500 outline-none"
  placeholder="Search..."
/>
```

---

## Layout Patterns

### Mobile Header
```html
<header class="sticky top-0 z-50 bg-white border-b border-gray-100 px-4 py-3">
  <div class="flex items-center justify-between">
    <button class="p-2"><!-- Menu icon --></button>
    <div class="flex items-center gap-2">
      <img src="logo.png" class="w-8 h-8" />
      <span class="font-semibold">Page Title</span>
    </div>
    <button class="w-10 h-10 bg-goldin-orange text-white rounded-full">+</button>
  </div>
</header>
```

### Page Container
```html
<main class="min-h-screen bg-gray-50 pb-20">
  <!-- Content -->
</main>
```

### Bottom Navigation (if used)
```html
<nav class="fixed bottom-0 left-0 right-0 bg-white border-t border-gray-200 px-4 py-2">
  <div class="flex justify-around">
    <!-- Nav items -->
  </div>
</nav>
```

---

## Spacing

| Size | Value | Usage |
|------|-------|-------|
| xs | 4px (1) | Icon padding, tight spacing |
| sm | 8px (2) | Between related elements |
| md | 16px (4) | Card padding, section gaps |
| lg | 24px (6) | Between sections |
| xl | 32px (8) | Major section separation |

---

## Icons

Using inline SVGs or Heroicons (outline style preferred).

Common icons:
- Menu: hamburger (3 lines)
- Plus: add interaction
- Search: magnifying glass
- Filter: funnel
- Back: left arrow
- Close: X
- Edit: pencil
- Phone: phone receiver
- Email: envelope
- Message: chat bubble

---

## Responsive Breakpoints

| Breakpoint | Width | Usage |
|------------|-------|-------|
| Mobile | < 640px | Default, single column |
| Tablet | 640-1024px | `sm:` and `md:` prefixes |
| Desktop | > 1024px | `lg:` prefix, multi-column |

Mobile-first approach: design for mobile, then add breakpoints for larger screens.

---

## Animation & Transitions

Standard transition:
```css
transition-all duration-200
```

Button hover:
```css
hover:bg-goldin-orange-dark transition
```

Modal/overlay fade:
```css
transition-opacity duration-300
```
