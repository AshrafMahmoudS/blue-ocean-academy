# 🛠️ Tech Stack Decision Document

**Task:** BOA-002  
**Sprint:** Sprint 1  
**Status:** ✅ Finalized  
**Date:** 2026-03-05  
**Author:** Ashraf M. Saad  

---

## Overview

This document captures the final technology decisions for the Blue Ocean Academy website redesign. Each choice is justified based on project requirements: performance, scalability, content management flexibility, and developer experience.

---

## Final Stack

| Layer | Technology | Version |
|---|---|---|
| Framework | Next.js | Latest (App Router) |
| Language | TypeScript | Latest |
| Styling | Tailwind CSS | v3+ |
| CMS | Sanity | v3 |
| Hosting | Vercel | — |
| CI/CD | GitHub Actions | — |
| Package Manager | npm | — |
| Linting | ESLint + Prettier | — |

---

## Decision Breakdown

### ⚛️ Framework — Next.js (App Router)

**Decision:** Next.js with the App Router (React Server Components)

**Rationale:**
- Best-in-class performance with server-side rendering (SSR), static site generation (SSG), and incremental static regeneration (ISR)
- App Router enables fine-grained control over rendering strategies per route
- First-class Vercel integration with zero-config deployment
- Large ecosystem, extensive documentation, and long-term support
- SEO-optimised by default — critical for an academy's public-facing website

**Rendering strategy:**
- Marketing/static pages → SSG
- Dynamic content (courses, news) → ISR with Sanity webhooks for on-demand revalidation
- User-specific pages → SSR or client-side

---

### 🎨 Styling — Tailwind CSS

**Decision:** Tailwind CSS v3

**Rationale:**
- Utility-first approach enables rapid UI development without context-switching to separate style files
- Built-in design system (spacing, typography, color scales) ensures visual consistency
- PurgeCSS built in — minimal CSS bundle in production
- Excellent Next.js integration with zero configuration
- JIT compiler ensures only used styles are shipped

**Conventions:**
- Custom design tokens defined in `tailwind.config.ts` (brand colors, fonts)
- Component-level class extraction using `@apply` for repeated patterns
- shadcn/ui as the component library base (built on Radix UI + Tailwind)

---

### 📝 CMS — Sanity v3

**Decision:** Sanity headless CMS

**Rationale:**
- Fully headless — content is decoupled from presentation, allowing front-end flexibility
- Real-time collaborative editing in Sanity Studio
- GROQ query language is powerful and flexible for complex content queries
- Structured content model prevents content drift over time
- On-demand ISR revalidation via Sanity webhooks keeps the site up to date without full rebuilds
- Generous free tier suitable for the project scale

**Content types planned:**
- Pages (Home, About, Courses, Contact)
- Courses
- Team members
- News / Blog posts
- Testimonials
- SEO metadata (per page)

**Studio location:** `/sanity` directory in the monorepo

---

### ☁️ Hosting — Vercel

**Decision:** Vercel

**Rationale:**
- Native Next.js hosting — built by the same team, zero-config deployment
- Edge Network (CDN) for global performance
- Automatic preview deployments on every PR — ideal for the Agile review process
- Built-in analytics and performance monitoring
- Serverless functions for API routes included
- Free tier sufficient for development; scales as needed

**Environment setup:**
- `production` → `main` branch auto-deploys
- `preview` → every PR to `develop` generates a preview URL
- Environment variables managed via Vercel dashboard

---

### ⚙️ CI/CD — GitHub Actions

**Decision:** GitHub Actions

**Rationale:**
- Native GitHub integration — no third-party service needed
- Runs on every PR: lint, type-check, build verification
- Free for public repositories
- Easily extensible for future test runners (Jest, Playwright)

**Pipelines planned:**
- `ci.yml` — lint + type-check + build on every PR
- `deploy-preview.yml` — trigger Vercel preview deploy
- `deploy-production.yml` — deploy to production on merge to `main`

---

## Project Toolchain

| Tool | Purpose |
|---|---|
| TypeScript | Type safety across the entire codebase |
| ESLint | Code quality and consistency |
| Prettier | Automatic code formatting |
| Husky | Pre-commit hooks (lint + format) |
| lint-staged | Run linters only on staged files |
| next/font | Optimised font loading (Google Fonts) |
| next/image | Optimised image delivery |
| Zod | Schema validation for forms and API responses |

---

## Repository Structure

```
blue-ocean-academy/
├── app/                    # Next.js App Router pages & layouts
│   ├── (marketing)/        # Public-facing routes
│   ├── api/                # API routes
│   └── layout.tsx          # Root layout
├── components/             # Shared UI components
│   ├── ui/                 # Base shadcn/ui components
│   └── sections/           # Page section components
├── sanity/                 # Sanity Studio + schemas
│   ├── schemas/            # Content type definitions
│   └── lib/                # Sanity client + GROQ queries
├── lib/                    # Shared utilities
├── public/                 # Static assets
├── docs/                   # Project documentation
│   └── tech-stack.md       # This document
├── .github/
│   └── workflows/          # GitHub Actions CI/CD pipelines
├── tailwind.config.ts      # Tailwind design tokens
├── sanity.config.ts        # Sanity Studio config
└── next.config.ts          # Next.js config
```

---

## Sprint Update Log

| Sprint | Update |
|---|---|
| Sprint 1 | Tech stack finalized and documented |
