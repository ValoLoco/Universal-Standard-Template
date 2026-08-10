#!/usr/bin/env bash
set -euo pipefail

CONFIG_DIR=".config"
CONFIG_FILE="$CONFIG_DIR/hermes.yaml"

# Install ollama if not present
if ! command -v ollama >/dev/null 2>&1; then
  curl -fsSL https://ollama.com/install.sh | sh
fi

# Start ollama server in background
ollama serve &
OLLAMA_PID=$!

# Wait for server to be ready
sleep 3

# Pull Nous Research Hermes model
ollama pull nous-hermes2

# Kill background server (Codespaces will manage it separately)
kill $OLLAMA_PID 2>/dev/null || true

# Scaffold config
mkdir -p "$CONFIG_DIR"

if [ ! -f "$CONFIG_FILE" ]; then
  cat > "$CONFIG_FILE" <<'EOF'
backend: ollama
model: nous-hermes2
host: http://localhost:11434
EOF
fi

echo "Bootstrap complete. Hermes (Nous Research) ready via ollama."
echo "Run: ollama serve  then  ollama run nous-hermes2"
