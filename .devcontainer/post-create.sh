#!/usr/bin/env bash
set -euo pipefail

echo "=== Bootstrap: Universal Standard Template ==="

# 1. GitHub CLI
if ! command -v gh >/dev/null 2>&1; then
  echo "[install] GitHub CLI..."
  sudo apt-get update -qq
  sudo apt-get install -y gh
fi

# 2. Node.js (required for npx skills installer)
if ! command -v node >/dev/null 2>&1; then
  echo "[install] Node.js..."
  curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
  sudo apt-get install -y nodejs
fi

# 3. Install Hermes Agent (Nous Research)
if ! command -v hermes >/dev/null 2>&1; then
  echo "[install] Hermes Agent..."
  curl -fsSL https://hermes-agent.nousresearch.com/install.sh | bash -s -- --skip-browser
  export PATH="$HOME/.hermes/bin:$PATH"
  echo 'export PATH="$HOME/.hermes/bin:$PATH"' >> "$HOME/.bashrc"
else
  echo "[ok] Hermes Agent already installed."
fi

# 4. Make scripts executable
chmod +x scripts/heartbeat.sh scripts/start-heartbeat.sh

# 5. Install default skills
echo ""
echo "=== Installing default skills ==="

# Agent-Reach: gives Hermes web browsing (Twitter, Reddit, YouTube, GitHub, RSS)
echo "[skill] Installing Agent-Reach..."
npx skills add Panniantong/Agent-Reach@agent-reach || echo "[warn] Agent-Reach install failed. Install manually: npx skills add Panniantong/Agent-Reach@agent-reach"

# oh-my-hermes: multi-agent orchestration (planning, deep research, verified execution)
echo "[skill] Installing oh-my-hermes..."
hermes skills tap add witt3rd/oh-my-hermes 2>/dev/null && \
  hermes skills install omh-deep-research omh-ralplan omh-ralph omh-autopilot || \
  echo "[warn] oh-my-hermes install failed. Install manually: hermes skills tap add witt3rd/oh-my-hermes"

# SkillClaw: collective skill evolution layer (rewrites ~/.hermes/config.yaml to proxy model calls)
echo ""
echo "[skill] SkillClaw rewrites ~/.hermes/config.yaml to proxy all Hermes model calls."
echo "        This enables collective skill evolution but changes how Hermes connects to your model."
read -r -p "        Install SkillClaw? [y/N]: " install_skillclaw
if [[ "$install_skillclaw" =~ ^[Yy]$ ]]; then
  npx skills add AMAP-ML/SkillClaw || echo "[warn] SkillClaw install failed. See: https://github.com/AMAP-ML/SkillClaw"
else
  echo "[skip] SkillClaw skipped. Install later: npx skills add AMAP-ML/SkillClaw"
fi

# 6. Scaffold Hermes config placeholder if missing
if [ ! -f "$HOME/.hermes/config.yaml" ]; then
  echo ""
  echo "[info] Hermes config not found. Run 'hermes setup' to configure your model provider."
fi

# 7. Create today's status file scaffold
STATUS_DIR="brain/00-09 SYSTEM/status"
DATE_TAG=$(date +%m%d%y)
STATUS_FILE="$STATUS_DIR/${DATE_TAG}-status.md"
mkdir -p "$STATUS_DIR"
if [ ! -f "$STATUS_FILE" ]; then
  sed "s/MMDDYY/$DATE_TAG/g; s/YYYY-MM-DD/$(date +%Y-%m-%d)/g" templates/MMDDYY-status.md > "$STATUS_FILE"
  echo "[created] $STATUS_FILE"
fi

# 8. Smoke test
echo ""
echo "=== Smoke test ==="
command -v hermes >/dev/null 2>&1 && echo "[ok] hermes" || echo "[FAIL] hermes not found"
command -v gh >/dev/null 2>&1    && echo "[ok] gh" || echo "[FAIL] gh not found"
[ -x scripts/heartbeat.sh ]      && echo "[ok] scripts/heartbeat.sh" || echo "[FAIL] heartbeat.sh not executable"
[ -x scripts/start-heartbeat.sh ] && echo "[ok] scripts/start-heartbeat.sh" || echo "[FAIL] start-heartbeat.sh not executable"
[ -f "$STATUS_FILE" ]             && echo "[ok] today's status file" || echo "[FAIL] status file missing"

echo ""
echo "=== Bootstrap complete ==="
echo "Next: run 'hermes setup' to connect your model provider."
echo "Optional skills: see README.md > Recommended Skills"
