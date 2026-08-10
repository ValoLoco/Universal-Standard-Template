#!/usr/bin/env bash
set -euo pipefail

VENV_DIR="$HOME/.venvs/hermes"
CONFIG_DIR=".config"
CONFIG_FILE="$CONFIG_DIR/hermes.yaml"

if [ ! -d "$VENV_DIR" ]; then
  python3 -m venv "$VENV_DIR"
fi

"$VENV_DIR/bin/pip" install --upgrade pip >/dev/null

mkdir -p "$CONFIG_DIR"

if [ ! -f "$CONFIG_FILE" ]; then
  cat > "$CONFIG_FILE" <<'EOF'
backend: local
models: []
routes: []
EOF
fi

echo "Bootstrap complete."
echo "gh is available through the devcontainer feature."
echo "Add Opencode install steps manually when the preferred install command is confirmed."
