---
name: grill-me
description: Critically interrogates a draft goal or task before it is accepted into the brain. Forces specificity, measurability, bounded scope, and honest failure analysis. Use this whenever a new goal is being defined — whether by a human or an agent.
version: 1.0.0
author: BUENATURA
metadata:
  hermes:
    tags: [goal-refinement, quality-control, planning, agent-discipline]
    related_skills: [plan, agent-reach]
---

# Grill-Me: Goal Refinement Gate

## Purpose
No goal enters the brain without surviving this critique. Apply grill-me to any draft goal before creating agents, tasks, or project folders.

## When to use
- A human submits a new goal.
- The heartbeat agent proposes a new goal after completing all existing work.
- A subagent escalates a new objective for inclusion.

## Procedure

### Step 1 — State the draft goal clearly
Write the goal in one sentence. If you cannot, it is not ready.

### Step 2 — Run the six questions
1. **Specific**: What exactly will be done? Vague verbs (improve, enhance, explore) must be replaced with concrete actions.
2. **Measurable**: What is the definition of done? How will you know it is complete?
3. **Assumptions**: What is being assumed? List every implicit dependency.
4. **Fit**: Does this belong in the current brain structure? Which AREA or PROJECT does it serve?
5. **Failure modes**: What could cause this to fail? Name at least two.
6. **Scope**: Can this be completed in one sprint? If not, split it.

### Step 3 — Verdict
- **PASS**: Goal is specific, measurable, bounded, and well-placed. Proceed to create agents and tasks.
- **REFINE**: Goal has at least one weak answer. Rewrite and re-run grill-me.
- **REJECT**: Goal is too vague, out of scope, or contradicts existing priorities. Archive the draft with a note.

### Step 4 — Log the verdict
Add a one-line grill-me verdict to today's status file:
```
- [grill-me] Goal: "<goal>" — PASS / REFINE / REJECT — <reason>
```

## Rules
- Never skip grill-me for agent-generated goals. Agents are not exempt.
- A REFINE verdict allows up to two revision cycles before the goal is auto-rejected.
- A PASS verdict must be logged before any agent or task file is created.
