# GOAL TEMPLATE

Version: 1.0.0
Purpose: Create clean Hermes `/goal` instructions that are bounded, evidence-based, and easy to verify.

---

## Why This Matters

Hermes `/goal` creates a standing objective that persists across turns and continues until the system judges it complete or it is paused, resumed, or cleared.
A weak goal creates drift. A strong goal creates clean autonomous progress.

`/goal status` — check progress
`/goal pause` — pause the loop
`/goal resume` — resume and reset turn counter
`/goal clear` — drop the goal entirely

---

## Goal Design Rules

Every goal must include five things:
1. **Outcome** — what must be true when the goal is done
2. **Constraints** — what the agent must not do
3. **Source of truth** — which files or folders the agent may use as evidence
4. **Deliverable location** — where the output goes
5. **Stop condition** — a clear, verifiable finish line

Avoid vague goals like:
- "Help me get organized"
- "Work on my notes"
- "Improve this project"

Use goals with a finish line.

---

## Template

```
/goal [Outcome]. Use only [source files/folders/tools] as source of truth. Respect these constraints: [constraints]. Write the result to [destination]. Stop when [clear completion condition].
```

---

## Examples

### Example 1: Weekly Review
```
/goal Build a weekly review for all active projects. Use only brain/10-19 PROJECTS, brain/00-09 SYSTEM/Daily, and brain/00-09 SYSTEM/Agent-Log as source of truth. Do not archive, delete, or publish anything. Draft the review in brain/90-99 INTAKE/90.03 Outbox/pending/weekly-review.md. Stop when every active project has a status, blocker list, next actions, and evidence links.
```

### Example 2: File Triage
```
/goal Process all new files in brain/90-99 INTAKE/90.02 Raw. Use brain/00-09 SYSTEM/Intent.md, brain/00-09 SYSTEM/Index.md, and existing naming rules as source of truth. Do not guess on legal, financial, or ambiguous items — move them to brain/90-99 INTAKE/90.01 Inbox and log the reason in brain/00-09 SYSTEM/Agent-Log. Stop when every new file is either routed correctly or escalated.
```

### Example 3: Research Pack
```
/goal Build a short research pack on [topic]. Use only approved source links and local notes as evidence. Draft the pack in brain/90-99 INTAKE/90.03 Outbox/pending/[topic]-pack.md. Do not present assumptions as facts. Stop when the document includes key findings, source links, open questions, and recommended next steps.
```

---

## Review Checklist

Before starting a goal, verify:
- [ ] Is the outcome specific?
- [ ] Are the constraints explicit?
- [ ] Is the source of truth bounded?
- [ ] Is the output destination named?
- [ ] Is there a real stop condition?

If any answer is no, rewrite the goal first.
