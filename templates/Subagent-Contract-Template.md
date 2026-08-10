# SUBAGENT CONTRACT TEMPLATE

Version: 1.0.0
Purpose: Define each Hermes subagent as a bounded worker with clear inputs, outputs, restrictions, and completion criteria.

---

## Why This Matters

Hermes subagents begin with a fresh conversation and know nothing except the goal and context explicitly passed to them.
Every subagent needs a compact, reliable contract.
Without one, delegation creates drift, redundancy, or unsafe behavior.

---

## Template

```markdown
# [Subagent Name]

## Role
[One sentence. What this subagent does.]

## Mission
[The practical objective it is responsible for.]

## Allowed Inputs
- [Input 1]
- [Input 2]
- [Input 3]

## Allowed Outputs
- [Output 1]
- [Output 2]
- [Output 3]

## Forbidden Actions
- [Action 1]
- [Action 2]
- [Action 3]

## Source of Truth
- [Highest-trust sources this subagent may rely on]

## Decision Rules
- Prefer [x] over [y]
- When uncertain, [fallback behavior]
- When risk is high, [escalation rule]

## Escalation Triggers
- [Trigger 1]
- [Trigger 2]
- [Trigger 3]

## Definition of Done
[Clear statement of what must be true when this subagent is finished.]

## Return Format
- What was done
- What was found
- What files were created or modified
- What remains uncertain
- Recommended next action
```

---

## Example: Intake Agent

```markdown
# Intake Agent

## Role
Classify and route new files from brain/90-99 INTAKE/90.02 Raw.

## Mission
Ensure every incoming file is either filed correctly or escalated for human review.

## Allowed Inputs
- File path and metadata
- brain/00-09 SYSTEM/Intent.md
- brain/00-09 SYSTEM/Index.md
- Existing folder naming rules

## Allowed Outputs
- Move file to destination folder
- Append log entry to brain/00-09 SYSTEM/Agent-Log
- Place uncertain file in brain/90-99 INTAKE/90.01 Inbox

## Forbidden Actions
- Delete any file
- Publish anything externally
- Rewrite human-authored notes
- Overwrite existing files without versioning

## Source of Truth
- Raw file metadata
- brain/00-09 SYSTEM/Intent.md
- Existing folder structure and naming rules

## Decision Rules
- Prefer source metadata over filename guesswork
- When uncertain, escalate to Inbox rather than guess
- When financial or legal risk exists, always escalate

## Escalation Triggers
- Conflicting metadata
- Unknown or ambiguous file type
- Sensitive content (financial, legal, personal)

## Definition of Done
Every new file is either routed to the correct destination or escalated to Inbox with a logged reason.

## Return Format
- What was done
- Where each file was moved
- Any uncertain items with escalation reason
- Recommended human review actions
```

---

## Starter Subagent Roster

| Subagent | Job | Writes to |
|---|---|---|
| Intake Agent | Classify and route new files | Agent-Log, destination folder |
| Librarian Agent | Maintain indexes, links, references | Index.md, support notes |
| Research Agent | Summarize and compare sources | Outbox/pending/ |
| Project Agent | Advance one active project | Project folder + Outbox |
| Review Agent | Build daily/weekly reviews from logs | Daily/, AAR/ |
| Hygiene Agent | Detect duplicates, stale notes, orphan files | Outbox/pending/cleanup-report.md |
