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
1. Install GitHub CLI and Node.js.
2. Install Hermes Agent automatically.
3. Install default skills: Agent-Reach, oh-my-hermes, and optionally SkillClaw.
4. Run a smoke test to verify the environment.
5. Start the heartbeat loop every 15 minutes.
6. Scaffold today's status file.

Run `hermes setup` once to connect your model provider.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/ValoLoco/Universal-Standard-Template)

## How to use

1. Create a new repository from this template.
2. Point Obsidian to the `brain/` folder.
3. Configure the systemd timers or cron jobs.
4. Adapt the templates to your own use case.

## Top-level layout

- `.devcontainer/` — Codespaces bootstrap config
- `brain/` — the living workspace
- `templates/` — core operating templates
- `scripts/` — automation scripts
- `skills/` — local Hermes Agent skills
- `systemd/` — service and timer files

## Core files

- `templates/Universal-Intent-Template.md`
- `templates/Goal-Template.md`
- `templates/Subagent-Contract-Template.md`
- `templates/Truth-Retention-Policy.md`
- `templates/Weekly-AAR-Template.md`

## Heartbeat system

The heartbeat loop (`scripts/start-heartbeat.sh`) runs every 15 minutes and:
1. Continues any unfinished goal or task.
2. If all work is done: drafts a new goal, runs `grill-me`, and only creates agents/tasks if the goal passes.
3. Updates `brain/00-09 SYSTEM/status/MMDDYY-status.md` with cycle progress.
4. Keeps the Codespace alive via terminal output and file activity.

## Recommended Skills

### ✅ Installed by default

| Skill | What it does | Security | Install |
|-------|-------------|----------|---------|
| [Agent-Reach](https://github.com/Panniantong/Agent-Reach) | Gives Hermes internet access: web, YouTube, Twitter, Reddit, GitHub, RSS — zero API fees | Read-only. Low risk. | `npx skills add Panniantong/Agent-Reach@agent-reach` |
| [oh-my-hermes](https://github.com/witt3rd/oh-my-hermes) | Multi-agent orchestration: consensus planning (`omh-ralplan`), deep research, verified execution (`omh-ralph`) | Spawns subagents. Executes code. Well-documented. | `hermes skills tap add witt3rd/oh-my-hermes` |
| [SkillClaw](https://github.com/AMAP-ML/SkillClaw) | Collective skill evolution layer — tracks, evolves, and manages skills across sessions | ⚠️ Rewrites `~/.hermes/config.yaml` and proxies all model calls. Opt-in during setup. | `npx skills add AMAP-ML/SkillClaw` |

### 📋 Opt-in — ask Hermes to install

| # | Skill | What it does | Security | Install |
|---|-------|-------------|----------|---------|
| 4 | [Anthropic Cybersecurity Skills](https://github.com/mukul975/Anthropic-Cybersecurity-Skills) | 817 skills across 29 security domains, MITRE ATT&CK mapped | ⚠️ Contains offensive/red-team workflows. Install only for active security work. | `hermes skills install mukul975/Anthropic-Cybersecurity-Skills` |
| 5 | [OpenMontage](https://github.com/calesthio/OpenMontage) | Video/content montage creation | Low risk. Requires local media tools. | `npx skills add calesthio/OpenMontage` |
| 6 | [Mission-Control / Minions](https://github.com/agent37-platform/minions) | Spawns and coordinates multiple AI minion agents | Elevated execution. Scope carefully. | See repo |
| 7 | [Resemble AI Detect](https://github.com/resemble-ai/detect-skill) | AI-generated audio and deepfake detection | Requires Resemble API key. Low harm risk. | See repo |
| 8 | [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills) | Web performance, Lighthouse, accessibility audits | No system access. Clean. | See repo |
| 9 | [Composio](https://github.com/ComposioHQ/skills) | 250+ integrations: Gmail, Slack, Notion, GitHub, and more | ⚠️ Writes to external services. Requires explicit per-tool authorization. | See repo |
| 10 | [youtube-full](https://github.com/ZeroPointRepo/youtube-skills) | Full YouTube interaction: transcripts, search, channels | Read-only. Low risk. | See repo |
| 12 | [Matt Pocock Skills](https://github.com/mattpocock/skills) | TypeScript and developer workflow skills | No system access. Clean. | See repo |
| 13 | [Defuddle](https://github.com/kepano/defuddle) | Strips web clutter for cleaner AI input | Read-only utility. Low risk. | See repo |
| 14 | [Humanizer](https://github.com/blader/humanizer) | Makes AI output sound more human | Output filter. No system access. | See repo |
| 2 | [make-interfaces-feel-better](https://github.com/jakubkrehel/make-interfaces-feel-better) | UI/UX review and improvement skill | No system access. Benign. | See repo |

> To install any opt-in skill, tell Hermes: *"Install the [skill name] skill from [URL]"* and it will handle the setup.

## Built-in skills (this repo)

| Skill | When to use |
|-------|-------------|
| `grill-me` | Before any new goal is accepted — human or agent-generated. Forces specificity, measurable outcomes, and failure analysis. |
| `plan` | Turn a passed goal into a clean, bite-sized execution plan before writing any code or files. |
| `hermes-agent-setup` | Configure providers, tools, and gateways. Run this first on a fresh install. |

## Design rules

- Maximum 2 levels deep for active organization.
- Numbers encode location.
- Actionability decides placement.
- Raw evidence stays intact.
- Human approval gates all external actions.
- No goal enters the brain without passing `grill-me`.
