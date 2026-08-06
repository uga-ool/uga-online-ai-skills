---
name: elc-smoke-test
description: Run a pre-merge or pre-release smoke test checklist for a Brightspace/eLC tool — functional, accessibility, integration, and regression/rollback checks. Use whenever the user is validating an eLC tool before merging or shipping, asks for a QA pass, or wants a test report to paste into a PR test plan.
---

# eLC smoke test checklist

A consistent pre-merge QA pass for a Brightspace tool, producing a report the author can paste straight into a PR's test plan section.

## Steps

1. Ask the user for: tool name, the eLC URL or Manage Files path being tested, the course/OU used, the role tested (student, instructor, TA, etc.), and whether the LLM proxy is in scope for this tool.
2. Walk through each checklist section and record pass / fail / not-applicable with notes for each item:
   - **Functional** — core feature paths work as intended for the tested role
   - **Accessibility** — keyboard navigation works, focus states are visible, no keyboard traps, screen-reader landmarks present
   - **Integration** — Brightspace session/Valence calls succeed, design-system assets (CSS/JS/fonts) load correctly
   - **Regression and rollback** — existing functionality unaffected; a rollback path exists if this release needs to be reverted
3. Flag any **blocking failures** clearly and separately: keyboard traps, missing focus states, console errors, or design-system assets failing to load are always blocking.
4. Output a markdown test report suitable for pasting directly into a PR's **Test plan** section.
5. Don't commit or deploy anything as part of this check — it's validation only.

## Reminder

Use test-sandbox courses for this, not real student sections, and never include actual student PII in the test report even if it's visible in the sandbox data.
