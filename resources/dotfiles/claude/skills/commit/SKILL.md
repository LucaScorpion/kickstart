---
name: commit
description: Stage and commit changes.
model: haiku
---

First, check if a project-specific commit skill exists by reading `.claude/skills/commit.md` or `.claude/skills/commit/SKILL.md`.
If either file exists, follow its instructions instead of the ones below and stop reading this file.

---

Stage all changed files and write a single commit.
Omit "Co-Authored by" in the message.
Use a single subject line only, no body unless the change requires context that the diff cannot convey.

## Git status

!`git status`

## Git diff (staged)

!`git diff --staged`

## Git diff (unstaged)

!`git diff`
