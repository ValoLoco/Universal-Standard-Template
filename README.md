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

Open the repository in GitHub Codespaces and the devcontainer will:
1. Install Hermes Agent automatically.
2. Start the heartbeat loop every 15 minutes.
3. Scaffold today's status file.

Run `hermes setup` once to connect your model provider.

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
- `skills/` - Hermes Agent skills
- `systemd/` - service and timer files

## Core files

- `templates/Universal-Intent-Template.md`
- `templates/Goal-Template.md`
- `templates/Subagent-Contract-Template.md`
- `templates/Truth-Retention-Policy.md`
- `templates/Weekly-AAR-Template.md`

## Recommended skills

| Skill | When to use |
|-------|-------------|
| `grill-me` | Before any new goal is accepted — human or agent-generated. Forces specificity, measurable outcomes, and failure analysis. |
| `agent-reach` | When a task falls outside this agent's scope. Decides: handle locally, delegate, escalate, or human-gate. |
| `plan` | Turn a passed goal into a clean, bite-sized execution plan before writing any code or files. |
| `hermes-agent-setup` | Configure providers, tools, and gateways. Run this first on a fresh install. |

All skills are in `skills/` and load automatically when Hermes detects they are relevant.

## Heartbeat system

The heartbeat loop (`scripts/start-heartbeat.sh`) runs every 15 minutes and:
1. Continues any unfinished goal or task.
2. If all work is done: drafts a new goal, runs `grill-me`, and only creates agents/tasks if the goal passes.
3. Updates `brain/00-09 SYSTEM/status/MMDDYY-status.md` with cycle progress.
4. Keeps the Codespace alive via terminal output and file activity.

## Design rules

- Maximum 2 levels deep for active organization.
- Numbers encode location.
- Actionability decides placement.
- Raw evidence stays intact.
- Human approval gates all external actions.
- No goal enters the brain without passing `grill-me`.
