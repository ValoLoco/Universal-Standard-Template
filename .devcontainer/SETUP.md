# Codespaces Setup

Open this repository in GitHub Codespaces. The devcontainer runs `.devcontainer/post-create.sh` automatically on first creation.

## What gets installed

- `gh` (GitHub CLI) via devcontainer feature
- `hermes` (Hermes Agent by Nous Research)

## First run

After the Codespace starts, complete setup:

```bash
hermes setup --portal
```

One OAuth step covers the model and all Tool Gateway tools (web search, image generation, TTS, browser).

## Running Hermes

```bash
hermes
```

## Adding Opencode

Add the confirmed install command for Opencode to `.devcontainer/post-create.sh` when ready.

## Secrets

Do not commit credentials. Use Codespaces secrets in repository settings.
