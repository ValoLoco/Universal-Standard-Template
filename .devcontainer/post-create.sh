#!/usr/bin/env bash
set -euo pipefail

# ════════════════════════════════════════════════════════════════════
#  Universal Standard Template — Codespaces Bootstrap
#  Runs once automatically when the Codespace is first created.
#  GitHub CLI (gh) is pre-installed via the devcontainer feature.
# ════════════════════════════════════════════════════════════════════

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Universal Standard Template — Bootstrap starting"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# ── 1. System dependencies ───────────────────────────────────────────
echo "[1/4] Installing system dependencies..."
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
  python3-venv \
  ripgrep \
  ffmpeg
echo "      ✓ System dependencies installed."

# ── 2. Hermes Agent ──────────────────────────────────────────────────
echo ""
echo "[2/4] Installing Hermes Agent (Nous Research)..."

export PATH="$HOME/.local/bin:$HOME/.hermes/bin:$HOME/bin:$PATH"

if command -v hermes >/dev/null 2>&1; then
  echo "      ✓ Hermes already installed: $(hermes --version 2>/dev/null || echo 'version unknown')"
else
  # --skip-setup suppresses the interactive wizard during unattended bootstrap.
  # The user runs 'hermes setup' or 'hermes setup --portal' manually once
  # the Codespace is open and they are ready to add their API key.
  curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash -s -- --skip-setup

  # Reload PATH so the hermes binary is available immediately
  export PATH="$HOME/.local/bin:$HOME/.hermes/bin:$HOME/bin:$PATH"

  if command -v hermes >/dev/null 2>&1; then
    echo "      ✓ Hermes installed: $(hermes --version 2>/dev/null || echo 'ok')"
  else
    echo "      ⚠ hermes binary not found on PATH after install."
    echo "        Try: source ~/.bashrc && hermes --version"
    echo "        If still missing, check ~/.local/bin and ~/.hermes/bin."
  fi
fi

# ── 3. Make scripts executable ───────────────────────────────────────
echo ""
echo "[3/4] Setting script permissions..."
ROOT="$(git rev-parse --show-toplevel)"
chmod +x "$ROOT/scripts"/*.sh 2>/dev/null || true
echo "      ✓ Scripts are executable."

# ── 4. Ensure brain placeholders exist ───────────────────────────────
echo ""
echo "[4/4] Ensuring brain folder placeholders exist..."
BRAIN="$ROOT/brain"

declare -a DIRS=(
  "00-09 SYSTEM/Daily"
  "00-09 SYSTEM/AAR"
  "00-09 SYSTEM/Agent-Log"
  "00-09 SYSTEM/agents"
  "00-09 SYSTEM/status"
  "10-19 PROJECTS"
  "20-29 AREAS"
  "30-39 RESOURCES"
  "40-49 ARCHIVE"
  "90-99 INTAKE/90.01 Inbox"
  "90-99 INTAKE/90.02 Raw/images"
  "90-99 INTAKE/90.02 Raw/documents"
  "90-99 INTAKE/90.02 Raw/audio"
  "90-99 INTAKE/90.02 Raw/video"
  "90-99 INTAKE/90.03 Outbox/pending"
  "90-99 INTAKE/90.03 Outbox/approved"
  "90-99 INTAKE/90.04 Assets"
)

for d in "${DIRS[@]}"; do
  mkdir -p "$BRAIN/$d"
  touch "$BRAIN/$d/.gitkeep"
done
echo "      ✓ Brain structure verified."

# ════════════════════════════════════════════════════════════════════
#  Bootstrap complete — handoff to user
# ════════════════════════════════════════════════════════════════════
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  ✓ Bootstrap complete."
echo ""
echo "  NEXT STEP — configure Hermes:"
echo ""
echo "    hermes setup"
echo ""
echo "  Or use the Portal OAuth flow (recommended):"
echo "  Sets Nous as provider + enables Tool Gateway"
echo "  (web search, image gen, TTS, browser) in one step:"
echo ""
echo "    hermes setup --portal"
echo ""
echo "  After setup, start your first session:"
echo ""
echo "    hermes"
echo ""
echo "  See .devcontainer/SETUP.md for full details."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
