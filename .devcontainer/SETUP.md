# Codespaces Setup

Open this repository in GitHub Codespaces. The devcontainer runs `.devcontainer/post-create.sh` automatically on first creation.

## What gets installed

- `gh` (GitHub CLI) via devcontainer feature
- Python venv for Hermes at `~/.venvs/hermes`
- Placeholder config at `.config/hermes.yaml`

## Adding Opencode

Add the confirmed install command for Opencode to `.devcontainer/post-create.sh` when ready.

## Adding Hermes dependencies

Add packages to `.devcontainer/post-create.sh`:

```bash
"$HOME/.venvs/hermes/bin/pip" install <package>
```

## Secrets

Do not commit credentials. Use Codespaces secrets in repository settings.
