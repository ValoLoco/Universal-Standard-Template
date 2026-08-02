#!/bin/bash
set -e

BRAIN="$(git rev-parse --show-toplevel)/brain"
STATUS_DIR="$BRAIN/00-09 SYSTEM/status"
DATE_TAG=$(date +%m%d%y)
STATUS_FILE="$STATUS_DIR/${DATE_TAG}-status.md"

mkdir -p "$STATUS_DIR"

echo "=== HEARTBEAT: $(date -Iseconds) ==="

# Run Hermes with heartbeat prompt
hermes --no-interactive --prompt "$(cat "$(git rev-parse --show-toplevel)/scripts/heartbeat-prompt.md")"

# Ensure status file is touched so Codespace sees activity
touch "$STATUS_FILE"
git add "$STATUS_FILE"
git diff --cached --stat
