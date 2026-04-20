---
name: pr
description: Create or update a pull request.
---

Follow these steps in order:

## 1. Commit local changes

If there are any uncommitted changes, invoke the `/commit` skill to stage and commit them.

Git status:

!`git status 2>&1`

## 2. Push

Run `git push` (no `-u` flag).

## 3. Create or update the PR

Check if a PR already exists for the current branch:

!`gh pr view 2>&1 || true`

- If no PR exists: create one with `gh pr create`.

- If a PR exists: update the title and/or body if they are outdated relative to the commits since the PR was opened, using `gh pr edit`.
If nothing needs updating, leave it as-is and say so.

Write a concise title and a short body describing what changed and why.
Omit information about tests and static analysis unless this requires special attention.
Omit headers unless the body requires multiple distinct sections.

## 4. Return the PR URL

Return the PR URL when done.

### Git log from main

!`git log --oneline main..HEAD`

### Git diff vs main

!`git diff main...HEAD`
