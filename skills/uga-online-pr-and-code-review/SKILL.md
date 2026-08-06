---
name: uga-online-pr-and-code-review
description: Prepare or review a GitHub pull request in a UGA Online (uga-ool) repository. Use this whenever the user asks for a pre-PR self-check, a PR description, help reviewing someone else's PR, a code review checklist, or mentions "gh pr", secrets/FERPA scanning of a diff, or eLC test plans — even if they don't say "UGA Online" explicitly. Covers both the author side (before opening a PR) and the reviewer side (evaluating someone else's PR).
---

# UGA Online PR and code review

This skill captures the team's PR conventions so the same checks happen every time — secrets and student data never land in a diff, new apps land in the right repo, and reviewers get a consistent, kind review.

Figure out which track applies: is the user about to open a PR (author track) or looking at someone else's PR (reviewer track)?

## Author track — before opening a PR

1. **Repo and path.** New Brightspace course-file React apps must live under `UGA-Brightspace-React-Apps/apps/<kebab-case-name>/`. If the diff touches `UGA-Brightspace-React-Template` or another reference/upstream repo, stop and flag it — those repos are read-only for app work unless the user explicitly says they're intentionally patching upstream.
2. **Secrets and FERPA.** Scan the diff (or ask for `git status` / `git diff`) for `.env` files, API keys, tokens, and any student names, UGA IDs, or grade data in code, comments, or commit messages. This is the single most important check — treat it as non-negotiable regardless of how small the PR is.
3. **Build check.** Run the project's build step (commonly `npm run build` from the app directory) and report pass/fail.
4. **Draft the PR description** from the diff, using this shape:
   ```markdown
   ## Summary
   -

   ## Test plan
   - [ ] Built locally (npm run build or per README)
   - [ ] Tested in eLC (course/OU: ___; role: ___; Manage Files path: ___)

   ## Notes
   ```
   Include eLC validation details (OU, role, hosting path) whenever the change is student- or instructor-facing.
5. Do not push, commit, or open the PR on GitHub unless the user explicitly asks you to.

## Reviewer track — evaluating someone else's PR

1. Get the PR (URL, number, or pasted diff). Use `gh pr view` / `gh pr diff` read-only if the `gh` CLI is available.
2. Check, in order:
   - Diff scope matches the stated description (no unrelated "drive-by" changes)
   - No secrets or student PII anywhere in the diff
   - No feature edits inside `UGA-Brightspace-React-Template` or other reference repos
   - New React apps are under `UGA-Brightspace-React-Apps/apps/`
   - Client-side env vars are `VITE_*` only — no provider/LLM keys in a bundle shipped to the browser
   - eLC test plan present (OU, role, Manage Files path) for anything student- or instructor-facing
   - UI changes use the UGA Online Design System (`https://design.online.uga.edu`) rather than one-off styles
   - Brightspace agent plugin code imports only from `@uga-brightspace/framework`, never deep-imports framework internals
3. Produce: a short summary of what the PR does, **blocking** issues (must fix before merge), **non-blocking** suggestions, and draft review-comment text the reviewer can paste into GitHub.
4. Do not approve, merge, or push unless the user explicitly asks — this skill's job is to produce the review, not to act on it.

## Why these checks specifically

Student data is FERPA-protected, so any leak into a public or semi-public repo is a real compliance problem, not just a style issue — that's why it comes before build checks. Reference/template repos are shared across the whole team, so an app-specific fix landed there quietly breaks everyone else's starting point; the fix belongs in a work repo or an intentional upstream PR instead.
