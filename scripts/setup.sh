#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────
# Blue Ocean Academy — Local Dev Onboarding Script
# BOA-003
#
# Usage:
#   chmod +x scripts/setup.sh
#   ./scripts/setup.sh
#
# What this does:
#   1. Checks required tools are installed
#   2. Copies .env.local.example → .env.local (if not exists)
#   3. Installs dependencies via pnpm
#   4. Starts the local dev environment via Docker Compose
# ─────────────────────────────────────────────────────────────

set -e

# ── Colours ──────────────────────────────────────────────────
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
RESET='\033[0m'

print_step()  { echo -e "\n${CYAN}▶ $1${RESET}"; }
print_ok()    { echo -e "${GREEN}✔ $1${RESET}"; }
print_warn()  { echo -e "${YELLOW}⚠ $1${RESET}"; }
print_error() { echo -e "${RED}✘ $1${RESET}"; exit 1; }

echo -e "\n${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "  🌊 Blue Ocean Academy — Dev Setup"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}\n"

# ── 1. Check required tools ───────────────────────────────────
print_step "Checking required tools..."

command -v node >/dev/null 2>&1   || print_error "Node.js is not installed. Install from https://nodejs.org"
command -v pnpm >/dev/null 2>&1   || print_error "pnpm is not installed. Run: npm install -g pnpm"
command -v docker >/dev/null 2>&1 || print_error "Docker is not installed. Install from https://docs.docker.com/get-docker/"
command -v git >/dev/null 2>&1    || print_error "Git is not installed."

print_ok "Node.js  → $(node -v)"
print_ok "pnpm     → $(pnpm -v)"
print_ok "Docker   → $(docker -v)"
print_ok "Git      → $(git --version)"

# ── 2. Environment variables ──────────────────────────────────
print_step "Setting up environment variables..."

if [ ! -f ".env.local" ]; then
  cp .env.local.example .env.local
  print_ok ".env.local created from template"
  print_warn "Open .env.local and fill in your Sanity credentials before running the app."
else
  print_ok ".env.local already exists — skipping"
fi

# ── 3. Install dependencies ───────────────────────────────────
print_step "Installing dependencies..."

pnpm install
print_ok "Dependencies installed"

# ── 4. Start Docker dev environment ──────────────────────────
print_step "Starting Docker Compose dev environment..."

if ! docker info >/dev/null 2>&1; then
  print_error "Docker daemon is not running. Please start Docker Desktop and try again."
fi

docker compose up --build -d
print_ok "Containers started"

# ── Done ──────────────────────────────────────────────────────
echo -e "\n${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "  ✅ Setup complete!"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e ""
echo -e "  Next.js app  →  ${CYAN}http://localhost:3000${RESET}"
echo -e "  Sanity Studio →  ${CYAN}http://localhost:3333${RESET}"
echo -e ""
echo -e "  ${YELLOW}Remember: fill in .env.local with your Sanity credentials!${RESET}\n"
