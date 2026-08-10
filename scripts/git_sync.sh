#!/usr/bin/env bash
set -euo pipefail

# ── Config ────────────────────────────────────────────────────────────
REPO_ROOT="$(git rev-parse --show-toplevel)"
BRANCH="${GIT_SYNC_BRANCH:-main}"
COMMIT_MSG="sync: $(date -u '+%Y-%m-%d %H:%M UTC')"

cd "$REPO_ROOT"

# ── Pull latest before pushing ────────────────────────────────────────
git pull --rebase origin "$BRANCH"

# ── Stage all changes ─────────────────────────────────────────────────
git add -A

# ── Only commit if there is something to commit ───────────────────────
if git diff --cached --quiet; then
  echo "[git_sync] Nothing to commit. Brain is already in sync."
  exit 0
fi

# ── Commit and push ───────────────────────────────────────────────────
git commit -m "$COMMIT_MSG"
git push origin "$BRANCH"

echo "[git_sync] Sync complete: $COMMIT_MSG"
