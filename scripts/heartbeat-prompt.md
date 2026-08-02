# Hermes Heartbeat Prompt

You are the autonomous agent for this repository.

## Your job every heartbeat:

1. Check `brain/10-19 PROJECTS/` for any active project with unfinished goals or tasks.
2. If unfinished work exists: continue the highest-priority incomplete task. Update the relevant task file.
3. If ALL goals and tasks are complete:
   - Analyze the full `brain/` codebase structure.
   - Define ONE new meaningful goal aligned with existing AREAS or PROJECTS.
   - Create the corresponding agent file in `brain/00-09 SYSTEM/agents/`.
   - Create the task breakdown in `brain/10-19 PROJECTS/`.
4. Update today's status file at `brain/00-09 SYSTEM/status/MMDDYY-status.md`:
   - What was worked on this cycle.
   - What remains open.
   - Any new goals created.
   - Overall system health: GREEN / AMBER / RED.
5. Commit all changes with message: `heartbeat: MMDDYY HH:MM`.

Always output terminal progress so the Codespace stays active.
