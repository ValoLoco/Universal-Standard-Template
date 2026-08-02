# Universal Standard Template

A clean, agent-ready second brain starter kit for humans and AI workers.

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

## Codespaces bootstrap

Open the repository in GitHub Codespaces and the devcontainer will run `.devcontainer/post-create.sh` automatically during container creation.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/ValoLoco/Universal-Standard-Template)

## How to use

1. Create a new repository from this template.
2. Point Obsidian to the `brain/` folder.
3. Configure the systemd timers or cron jobs.
4. Adapt the templates to your own use case.

## Top-level layout

- `.devcontainer/` - Codespaces bootstrap config
- `brain/` - the living workspace
- `templates/` - core operating templates
- `scripts/` - automation scripts
- `systemd/` - service and timer files

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
