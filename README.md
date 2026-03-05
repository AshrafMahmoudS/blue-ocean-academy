# 🌊 Blue Ocean Academy

> A modern, redesigned web platform for Blue Ocean Academy — built with performance, accessibility, and scalability at its core.

---

## 🎯 Project Mission

Blue Ocean Academy's website redesign aims to deliver a fast, accessible, and visually compelling digital presence that reflects the institution's values and serves its students, staff, and prospective community members effectively.

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Framework | Next.js (App Router) |
| Language | TypeScript |
| Styling | Tailwind CSS |
| CMS | Sanity v3 |
| Hosting | Vercel |
| CI/CD | GitHub Actions |

> See full decision rationale in [`docs/tech-stack.md`](./docs/tech-stack.md)

---

## 👥 Team

| Role | Name |
|---|---|
| Lead Engineer | Ashraf M. Saad |

---

## 🗂️ Project Structure

```
blue-ocean-academy/
├── app/                    # Next.js App Router pages & layouts
├── components/             # Shared UI components
├── sanity/                 # Sanity Studio + schemas
├── lib/                    # Shared utilities
├── public/                 # Static assets
├── docs/                   # Project documentation
└── .github/workflows/      # GitHub Actions CI/CD pipelines
```

---

## 🚀 Getting Started

```bash
# Clone the repository
git clone https://github.com/AshrafMahmoudS/blue-ocean-academy.git

# Navigate into the project
cd blue-ocean-academy

# Install dependencies
npm install

# Start dev server
npm run dev
```

---

## 🤝 Contributing

1. Branch off `develop` using the convention `feature/BOA-XXX-short-description`
2. Commit using clear, descriptive messages referencing the task ID (e.g. `BOA-001: Initial README`)
3. Open a PR into `develop` — no direct pushes to `main`
4. PRs require at least one review before merge

### Branch Strategy

| Branch | Purpose |
|---|---|
| `main` | Production-ready code only. Protected. |
| `develop` | Active development branch. All PRs merge here first. |
| `feature/BOA-XXX-desc` | Feature branches cut from `develop` |
| `fix/BOA-XXX-desc` | Bug fix branches cut from `develop` |

---

## 📅 Sprint Updates

> This README is a living document updated at the close of each sprint.

| Sprint | Update |
|---|---|
| Sprint 1 | Repository initialized, branch strategy established, tech stack finalized |

---

## 📄 License

MIT © 2026 Blue Ocean Academy
