#!/usr/bin/env bash
set -euo pipefail

CONFIG_DIR=".config"
CONFIG_FILE="$CONFIG_DIR/hermes.yaml"

# Install Hermes Agent (Nous Research)
if ! command -v hermes >/dev/null 2>&1; then
  curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash
fi

# Scaffold config if not present
mkdir -p "$CONFIG_DIR"

if [ ! -f "$CONFIG_FILE" ]; then
  cat > "$CONFIG_FILE" <<'EOF'
# Hermes Agent config
# Run: hermes setup --portal
# to complete OAuth and model setup
EOF
fi

echo "Bootstrap complete."
echo "Hermes Agent installed. Run: hermes setup --portal"
echo "Add Opencode install steps to this script when confirmed."
