# Universal Standard Template

A clean, agent-ready second brain starter kit for humans and AI workers.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=1320298690)

## What this is

This repository is a template for a personal or organizational operating system built around:
- clear intent
- bounded goals
- subagent contracts
- truth retention
- weekly AAR review
- simple numbered folder structure
- safe approval gates
- reliable automation

## How to use

1. Create a new repository from this template.
2. Open it in GitHub Codespaces. The devcontainer bootstraps the environment automatically.
3. Point Obsidian to the `brain/` folder.
4. Adapt the templates to your own use case.

## Codespaces bootstrap

Opening the repository in GitHub Codespaces triggers `.devcontainer/post-create.sh` automatically. It creates the Hermes Python venv and a placeholder config. GitHub CLI is installed via the devcontainer feature. See `.devcontainer/SETUP.md` for details on adding Opencode and Hermes dependencies.

## Top-level layout

- `brain/` - the living workspace
- `templates/` - core operating templates
- `scripts/` - automation scripts
- `systemd/` - service and timer files
- `.devcontainer/` - Codespaces setup and bootstrap

## Core files

- `templates/Universal-Intent-Template.md`
- `templates/Goal-Template.md`
- `templates/Subagent-Contract-Template.md`
- `templates/Truth-Retention-Policy.md`
- `templates/Weekly-AAR-Template.md`

## Design rules

- Maximum 2 levels deep for active organization.
- Numbers encode location.
- Actionability decides placement.
- Raw evidence stays intact.
- Human approval gates all external actions.
