#!/usr/bin/env bash
set -euo pipefail

# Install GitHub CLI if missing
if ! command -v gh >/dev/null 2>&1; then
  sudo apt-get update -qq
  sudo apt-get install -y gh
fi

# Opencode placeholder: add your preferred install command here
if ! command -v opencode >/dev/null 2>&1; then
  echo "[placeholder] opencode not found. Add install command to this script."
fi

# Create Hermes virtual environment if missing
if [ ! -d "$HOME/.venvs/hermes" ]; then
  python3 -m venv "$HOME/.venvs/hermes"
fi
"$HOME/.venvs/hermes/bin/pip" install --upgrade pip --quiet

# Scaffold Hermes config placeholder
if [ ! -f ".config/hermes.yaml" ]; then
  mkdir -p .config
  cat > .config/hermes.yaml <<'EOF'
# Hermes placeholder config
backend: local
models: []
routes: []
EOF
fi

echo "Bootstrap complete."
