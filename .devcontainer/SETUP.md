# Codespaces Setup

Open this repository in GitHub Codespaces. The devcontainer runs `.devcontainer/post-create.sh` automatically on first creation.

## What gets installed

- `gh` (GitHub CLI) via devcontainer feature
- `ollama` for local model inference
- `nous-hermes2` model pulled automatically via ollama
- Placeholder config at `.config/hermes.yaml`

## Running Hermes

```bash
ollama serve
ollama run nous-hermes2
```

## Adding Opencode

Add the confirmed install command for Opencode to `.devcontainer/post-create.sh` when ready.

## Secrets

Do not commit credentials. Use Codespaces secrets in repository settings.
