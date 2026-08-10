# skills/

This folder contains reusable Hermes skill files.

A skill is a self-contained prompt or instruction set that can be loaded by Hermes to extend its capabilities for a specific type of task.

## Usage

Reference a skill from a Hermes goal or agent contract:

```
/goal [outcome] using skill: skills/[skill-name].md
```

## Adding Skills

- One file per skill.
- Name the file clearly: `summarize-source.md`, `classify-file.md`, `draft-email.md`.
- Each skill file should describe: purpose, inputs, outputs, and any constraints.
- Keep skills small and focused. One skill = one capability.

## Starter Skills

Add skill files here as your system matures. Do not add skills preemptively.
