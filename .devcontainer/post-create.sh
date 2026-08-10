#!/usr/bin/env bash
set -euo pipefail

# ── System dependencies ──────────────────────────────────────────────
sudo apt-get update -qq
sudo apt-get install -y -qq \
  curl \
  git \
  wget \
  unzip \
  jq \
  build-essential \
  python3 \
  python3-pip \
  python3-venv

# ── Hermes Agent (Nous Research) ─────────────────────────────────────
if ! command -v hermes >/dev/null 2>&1; then
  echo "Installing Hermes Agent..."
  curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash
fi

# Reload PATH so hermes is immediately available
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo " Bootstrap complete."
echo " Launching Hermes setup..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# ── Launch Hermes setup ──────────────────────────────────────────────
hermes setup --portal
