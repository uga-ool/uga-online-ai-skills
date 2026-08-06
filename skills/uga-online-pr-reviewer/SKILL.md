---
name: uga-online-pr-reviewer
description: Quickly review a single named UGA Online (uga-ool) pull request — by URL, number, or pasted diff — and produce blocking vs non-blocking findings plus draft GitHub review comments. Use this for a fast, reviewer-only pass on one specific PR someone hands you. For a broader workflow that also covers preparing your own PR before opening it, use the uga-online-pr-and-code-review skill instead.
---

# UGA Online PR reviewer (fast path)

A focused reviewer pass for one specific pull request — optimized for speed when someone says "can you review PR #142" rather than a full team-process walkthrough.

## Steps

1. Get the PR: URL, number, or a pasted diff. If `gh` CLI is available, use `gh pr view` and `gh pr diff` (read-only — never `gh pr merge` or push from here).
2. Read the title, description, and test plan on the PR, then the diff itself.
3. Check, specifically:
   - Scope matches the stated description — no unrelated "drive-by" changes bundled in
   - No secrets (`.env`, API keys, tokens) or student PII (names, UGA IDs, grades) anywhere in the diff
   - No feature edits inside `UGA-Brightspace-React-Template`, the agent framework, or `uga-lit-components` — those are reference/upstream repos
   - New React apps live under `UGA-Brightspace-React-Apps/apps/`
   - Client env vars are `VITE_*` only
   - eLC test plan present (course/OU, role, Manage Files path) for anything student- or instructor-facing
   - Agent plugin imports come only from `@uga-brightspace/framework`, never deep imports
   - UI changes use the UGA Online Design System rather than ad hoc styling
4. Output exactly three things: a one-paragraph summary of what the PR does, a **blocking** list (must fix before merge), and a **non-blocking** list (suggestions) — with draft comment text for each blocking item the reviewer can paste straight into GitHub.
5. Never approve, request changes, or merge on GitHub yourself — this skill produces the review for a human to post, it doesn't act as that human.

## Red flags that always warrant a blocking comment

`.env` files or literal tokens/keys in source, student identifiers anywhere in the diff or its comments, and missing eLC validation details on anything a student or instructor will actually see.
