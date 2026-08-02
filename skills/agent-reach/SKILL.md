---
name: agent-reach
description: Decides whether a task should be handled locally, delegated to another agent in the repo, or escalated to an external agent or repo. Prevents scope creep and keeps agent boundaries clean.
version: 1.0.0
author: BUENATURA
metadata:
  hermes:
    tags: [coordination, delegation, multi-agent, scope]
    related_skills: [grill-me, plan]
---

# Agent-Reach: Delegation and Coordination Gate

## Purpose
Before acting on a task, determine whether this agent is the right one to handle it, or whether it should be delegated or escalated.

## When to use
- A task requires capabilities outside this agent's defined scope.
- A task touches files or systems owned by another agent.
- A task requires coordination across multiple repos or accounts.

## Procedure

### Step 1 — Scope check
Ask: Is this task within this agent's defined scope in `brain/00-09 SYSTEM/agents/`?
- YES: proceed locally.
- NO: go to Step 2.

### Step 2 — Delegate or escalate?
- If another agent in this repo owns this domain: add a task to their project folder and log the delegation.
- If the task requires another GitHub account or repo: trigger a `repository_dispatch` via PAT.
- If the task requires human approval: stop, write a decision request to the status file, and wait.

### Step 3 — Log the reach decision
Add to today's status file:
```
- [agent-reach] Task: "<task>" — LOCAL / DELEGATE(<agent>) / ESCALATE(<repo>) / HUMAN-GATE
```

## Rules
- Never silently absorb tasks outside your scope.
- Never escalate without logging.
- Human-gate decisions must be explicit and never auto-resolved.
