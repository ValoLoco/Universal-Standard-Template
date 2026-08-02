#!/usr/bin/env bash
set -euo pipefail

echo "=== Bootstrap: Universal Standard Template ==="

# 1. GitHub CLI
if ! command -v gh >/dev/null 2>&1; then
  echo "[install] GitHub CLI..."
  sudo apt-get update -qq
  sudo apt-get install -y gh
fi

# 2. Install Hermes Agent (Nous Research)
if ! command -v hermes >/dev/null 2>&1; then
  echo "[install] Hermes Agent..."
  curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash -s -- --skip-browser
  # Reload PATH so hermes is available immediately
  export PATH="$HOME/.hermes/bin:$PATH"
  echo 'export PATH="$HOME/.hermes/bin:$PATH"' >> "$HOME/.bashrc"
else
  echo "[ok] Hermes Agent already installed."
fi

# 3. Make scripts executable
chmod +x scripts/heartbeat.sh scripts/start-heartbeat.sh

# 4. Scaffold Hermes config placeholder if missing
if [ ! -f "$HOME/.hermes/config.yaml" ]; then
  echo "[info] Hermes config not found. Run 'hermes setup' to configure your model provider."
fi

# 5. Create today's status file scaffold
STATUS_DIR="brain/00-09 SYSTEM/status"
DATE_TAG=$(date +%m%d%y)
STATUS_FILE="$STATUS_DIR/${DATE_TAG}-status.md"
mkdir -p "$STATUS_DIR"
if [ ! -f "$STATUS_FILE" ]; then
  sed "s/MMDDYY/$DATE_TAG/g; s/YYYY-MM-DD/$(date +%Y-%m-%d)/g" templates/MMDDYY-status.md > "$STATUS_FILE"
  echo "[created] $STATUS_FILE"
fi

echo "=== Bootstrap complete. Run 'hermes setup' to connect your model provider. ==="
