# 🛠️ Tech Stack Decision Document

**Project:** Blue Ocean Academy — Website Redesign
**Task:** BOA-002
**Sprint:** Sprint 1
**Date:** 2026-03-05
**Author:** Ashraf M. Saad
**Status:** ✅ Finalized

---

## Overview

This document records the finalized technology decisions for the Blue Ocean Academy website redesign. All choices are made with performance, developer experience, scalability, and long-term maintainability in mind.

---

## Final Tech Stack

| Layer | Technology | Version |
|---|---|---|
| Framework | Next.js | Latest (App Router) |
| Language | TypeScript | Latest |
| Styling | Tailwind CSS | v3 |
| CMS | Sanity | v3 |
| Hosting | Vercel | — |
| CI/CD | GitHub Actions | — |
| Package Manager | pnpm | Latest |
| Linting | ESLint + Prettier | — |

---

## Decision Rationale

### ⚛️ Framework — Next.js (App Router)

**Decision:** Next.js with the App Router (React Server Components)

**Rationale:**
- Industry-standard React framework with first-class SSR, SSG, and ISR support
- App Router enables React Server Components for improved performance and reduced client-side JS
- Built-in image optimization, font optimization, and route-based code splitting
- Seamless integration with Vercel for zero-config deployment
- Strong TypeScript support out of the box
- Large ecosystem and long-term Vercel backing ensures stability

**Alternatives considered:**
- Astro — excellent for content-heavy static sites but less flexible for dynamic features
- Remix — strong data loading model but smaller ecosystem

---

### 🎨 Styling — Tailwind CSS

**Decision:** Tailwind CSS v3

**Rationale:**
- Utility-first approach enables rapid UI development without context switching
- No CSS-in-JS runtime overhead — all styles are purged at build time for minimal CSS bundle
- Excellent integration with Next.js and the broader React ecosystem
- Consistent design system enforcement through `tailwind.config.js`
- Strong community and plugin ecosystem (Typography, Forms, Animate)

**Alternatives considered:**
- CSS Modules — more verbose, slower iteration speed
- Styled Components — runtime CSS-in-JS adds unnecessary overhead for this use case

---

### 📝 CMS — Sanity v3

**Decision:** Sanity (Headless CMS)

**Rationale:**
- Fully headless, API-first CMS with real-time collaborative editing
- Sanity Studio (v3) is fully customizable and can be embedded directly in the Next.js project
- GROQ query language gives precise, efficient content fetching
- Excellent support for structured content, references, and portable text
- Free tier is sufficient for the project scope; scales well
- Live preview and on-demand ISR revalidation work seamlessly with Next.js

**Alternatives considered:**
- Contentful — higher cost, less flexibility in content modeling
- Strapi — requires self-hosting, more DevOps overhead

---

### 🚀 Hosting — Vercel

**Decision:** Vercel

**Rationale:**
- Native hosting platform for Next.js — zero-config deployment
- Automatic preview deployments for every PR (integrates directly with GitHub)
- Edge network for optimal global performance
- Built-in analytics, Web Vitals monitoring, and image CDN
- Free tier covers development and early production needs

**Alternatives considered:**
- Netlify — solid alternative but less optimized for Next.js App Router features
- AWS — overkill for this project scope; adds unnecessary infrastructure complexity

---

### ⚙️ CI/CD — GitHub Actions

**Decision:** GitHub Actions

**Rationale:**
- Native to the GitHub repository — no additional service needed
- Will handle: lint checks, type checks, build verification, and Vercel preview deployments on PRs
- Free for public repositories

---

### 📦 Package Manager — pnpm

**Decision:** pnpm

**Rationale:**
- Significantly faster installs and lower disk usage than npm or yarn
- Strict dependency resolution prevents phantom dependency bugs
- Full compatibility with the Next.js / Vercel ecosystem

---

## Project Structure (Planned)

```
blue-ocean-academy/
├── .github/
│   └── workflows/          # GitHub Actions CI/CD
├── docs/
│   └── tech-stack.md       # This document
├── public/                 # Static assets
├── sanity/                 # Sanity Studio (embedded)
│   ├── schemas/
│   └── sanity.config.ts
├── src/
│   ├── app/                # Next.js App Router
│   │   ├── (site)/         # Public-facing routes
│   │   └── layout.tsx
│   ├── components/
│   │   ├── ui/             # Reusable UI primitives
│   │   └── sections/       # Page sections
│   ├── lib/
│   │   ├── sanity/         # Sanity client & queries
│   │   └── utils/
│   └── types/              # Shared TypeScript types
├── .env.local.example
├── next.config.ts
├── tailwind.config.ts
├── tsconfig.json
├── pnpm-lock.yaml
└── README.md
```

---

## Environment Variables (Required)

```env
# Sanity
NEXT_PUBLIC_SANITY_PROJECT_ID=
NEXT_PUBLIC_SANITY_DATASET=production
SANITY_API_TOKEN=

# Vercel (auto-injected)
VERCEL_URL=
```

---

## Living Document

This document is updated as decisions evolve. Any changes to the tech stack must be:
1. Discussed and agreed upon by the team
2. Updated in this document with rationale
3. Reflected in the README.md tech stack table
