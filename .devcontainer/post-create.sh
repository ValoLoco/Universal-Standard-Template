#!/usr/bin/env bash
set -euo pipefail

VENV_DIR="$HOME/.venvs/hermes"
CONFIG_DIR=".config"
CONFIG_FILE="$CONFIG_DIR/hermes.yaml"

# Ensure python3-venv is available
if ! python3 -m venv --help >/dev/null 2>&1; then
  sudo apt-get update -qq
  sudo apt-get install -y -qq python3-venv
fi

# Create Hermes venv if not present
if [ ! -d "$VENV_DIR" ]; then
  python3 -m venv "$VENV_DIR"
fi

"$VENV_DIR/bin/pip" install --upgrade pip --quiet

# Scaffold Hermes config
mkdir -p "$CONFIG_DIR"

if [ ! -f "$CONFIG_FILE" ]; then
  cat > "$CONFIG_FILE" <<'EOF'
backend: local
models: []
routes: []
EOF
fi

echo "Bootstrap complete."
echo "gh available via devcontainer feature."
echo "Add Opencode install steps to this script when confirmed."
