# Universal Standard Template

A clean, agent-ready second brain starter kit for humans and AI workers.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=1320298690)

---

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

---

## How to use

1. Click **Use this template** to create your own private repository.
2. Open it in GitHub Codespaces. The devcontainer bootstraps Hermes automatically.
3. Fill in `brain/00-09 SYSTEM/Intent.md` first — this is the system's compass.
4. Point Obsidian (or any markdown editor) to the `brain/` folder.
5. Adapt the templates in `templates/` to your use case.
6. Run `scripts/git_sync.sh` or configure the systemd timer for nightly sync.

---

## Codespaces bootstrap

Opening in GitHub Codespaces triggers `.devcontainer/post-create.sh` automatically.
It installs Hermes Agent and runs `hermes setup --portal` to configure your API key.
See `.devcontainer/SETUP.md` for full dependency details.

---

## Top-level layout

```
├── README.md
├── hermes.toml              ← Hermes config placeholder (add your API key)
├── .gitignore
├── brain/                   ← The living workspace
│   ├── 00-09 SYSTEM/        ← Intent, Index, Glossary, Daily, AAR, Agent-Log
│   ├── 10-19 PROJECTS/      ← Active work with a finish line
│   ├── 20-29 AREAS/         ← Ongoing responsibilities
│   ├── 30-39 RESOURCES/     ← Reference material
│   ├── 40-49 ARCHIVE/       ← Done or inactive, kept not deleted
│   └── 90-99 INTAKE/        ← Agent working zone and approval gate
│       ├── 90.01 Inbox/     ← Human capture, unprocessed
│       ├── 90.02 Raw/       ← Drop zone (images, documents, audio, video)
│       ├── 90.03 Outbox/    ← Agent drafts pending human approval
│       └── 90.04 Assets/    ← Final home for sorted media
├── templates/               ← Core operating templates
├── scripts/                 ← Automation scripts
├── systemd/                 ← Service and timer files
├── skills/                  ← Reusable Hermes skill files
└── .devcontainer/           ← Codespaces setup and bootstrap
```

---

## Core operating files

| File | Purpose |
|---|---|
| `brain/00-09 SYSTEM/Intent.md` | System compass. Fill this in first. |
| `brain/00-09 SYSTEM/Index.md` | Master map of everything. Update weekly. |
| `brain/00-09 SYSTEM/Glossary.md` | Key terms, people, project names. |
| `templates/Goal-Template.md` | Standard for Hermes `/goal` commands. |
| `templates/Subagent-Contract-Template.md` | Standard for defining subagents. |
| `templates/Truth-Retention-Policy.md` | Rules for what gets remembered. |
| `templates/Weekly-AAR-Template.md` | Weekly review structure. |
| `scripts/heartbeat-prompt.md` | Autonomous agent cycle instructions. |
| `hermes.toml` | Hermes config — add your API key here. |

---

## Heartbeat

The heartbeat system (`scripts/heartbeat.sh` + `scripts/heartbeat-prompt.md`) runs Hermes autonomously on a schedule. Each cycle:
1. Checks active projects for unfinished goals.
2. If all goals are complete, drafts and self-critiques a new goal.
3. Writes a dated status file to `brain/00-09 SYSTEM/status/MMDDYY-status.md`.
4. Commits all changes.

Use `scripts/start-heartbeat.sh` to launch the heartbeat loop in a Codespace.

---

## Design rules

- Maximum 2 levels deep for active organization.
- Numbers encode location, not content.
- Actionability decides placement (PARA: Projects / Areas / Resources / Archive).
- Raw evidence stays intact. Summaries do not replace sources.
- Human approval gates all external actions.
- Agent logs every action in `brain/00-09 SYSTEM/Agent-Log/`.
