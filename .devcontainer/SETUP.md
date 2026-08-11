# Codespaces Setup Guide

This document explains what the bootstrap does, how to finish configuration, and how to use Hermes once you are set up.

---

## What the bootstrap does automatically

When you open this repository in GitHub Codespaces, `.devcontainer/post-create.sh` runs once and:

1. Installs system dependencies: `curl`, `git`, `wget`, `jq`, `ripgrep`, `ffmpeg`, `python3`, `build-essential`.
2. Installs **Hermes Agent** via the official Nous Research installer, using `--skip-setup` so the unattended bootstrap does not hang on the interactive wizard.
3. Makes all `scripts/*.sh` files executable.
4. Ensures all `brain/` placeholder folders exist.

GitHub CLI (`gh`) is pre-installed via the devcontainer feature.

---

## First thing to do after the Codespace opens

Run the Hermes setup wizard:

```bash
hermes setup
```

Or use the Portal OAuth flow — recommended for most users. This logs you in, sets Nous as your provider, and enables the Tool Gateway (web search, image generation, TTS, browser) in one step:

```bash
hermes setup --portal
```

The wizard will guide you through:
- Choosing a model provider (Nous Portal, OpenAI, Anthropic, Ollama, or custom endpoint)
- Adding your API key or completing OAuth
- Configuring which tools are enabled

---

## Configuring individual settings later

```bash
hermes model          # Change LLM provider or model
hermes tools          # Enable or disable tools
hermes gateway setup  # Configure messaging platforms (Telegram, Discord, etc.)
hermes config set     # Set individual config values
hermes config get     # Inspect current config
hermes portal info    # Verify your Nous Portal connection
hermes portal tools   # Check which Tool Gateway tools are active
```

---

## Starting Hermes

```bash
hermes
```

---

## Using the heartbeat (autonomous agent loop)

```bash
bash scripts/start-heartbeat.sh
```

The heartbeat runs Hermes on a loop using `scripts/heartbeat-prompt.md` as its standing instructions. Each cycle it checks active projects, advances work, self-critiques new goals, and writes a dated status file to `brain/00-09 SYSTEM/status/`.

---

## Nightly sync to GitHub

```bash
bash scripts/git_sync.sh
```

Or configure the systemd timer in `systemd/brain-sync.timer` to run it automatically.

---

## API keys and secrets

Do **not** commit credentials to the repository.

Use one of these approaches instead:
- **Codespaces secrets** (recommended): GitHub account or org Settings → Secrets → Codespaces.
- **Environment variable**: `export HERMES_API_KEY=sk-...` in your shell profile (`~/.bashrc` or `~/.zshrc`).
- **hermes.toml**: Fill in the commented fields in the root `hermes.toml`. This file is gitignored.

---

## Verifying the install

```bash
hermes --version
which hermes
```

If `hermes` is not found after bootstrap, reload your shell:

```bash
source ~/.bashrc
```

If it is still not found, check these locations manually:

```bash
ls ~/.local/bin/hermes
ls ~/.hermes/bin/hermes
```

Then add the correct directory to your PATH.

---

## Adding Opencode

When the confirmed install command for Opencode is available, add it to the system dependencies section of `.devcontainer/post-create.sh`.
