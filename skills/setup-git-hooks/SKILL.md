---
name: setup-git-hooks
description: Enable the UGA Online commit-message template and validation hooks in a freshly cloned uga-ool repository. Use whenever the user just cloned a UGA Online repo, mentions commit message validation failing, asks how to set up git hooks, or their commits aren't following the team's COMMIT_TEMPLATE.
---

# Set up UGA Online git hooks

Every `uga-ool` template repo ships a setup script that points local commits at the team's `COMMIT_TEMPLATE` and enables subject-line validation. This only needs to run once per clone, but it's easy to forget after a fresh clone — and skipping it is the most common reason someone's commit message fails CI validation later.

## Steps

1. From the repository root, run:
   ```bash
   ./scripts/setup-git-hooks.sh
   ```
2. Confirm it worked: `git config core.hooksPath` should return `.githooks`.
3. Tell the user: when committing, delete the template's comment lines and keep exactly one imperative subject line (e.g. "Add quiz dropbox validation", not "Added" or a multi-line subject).

Don't change any other git config while doing this — the script's only job is wiring up the commit template and hooks path, so if the user asks for something broader (a different editor, global gitignore, etc.), treat that as a separate request.
