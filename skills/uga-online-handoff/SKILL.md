---
name: uga-online-handoff
description: Produce a FERPA-safe structured handoff between instructional designers, developers, and QA for UGA Online eLC work. Use when the user says handoff, hand off, switch repos, pass to QA, ID to developer, or needs a Handoff Summary instead of pasting a full chat transcript.
---

# UGA Online handoff

Create a durable handoff so the next person (or a new chat in another repo) can continue without the full prior transcript.

## When to hand off

- ID → developer, developer → QA, or repo switch
- New feature / review task after exploration
- Opening work in a different AI tool on the same goal

## Steps

1. Confirm goal, target repo, and audience (ID, AI/dev, QA, sysadmin).
2. Fill the Handoff Summary below from conversation context; ask only for missing fields.
3. Remind the receiver to open a **new** chat in the **target repo** and `@`-reference key docs — do not paste the entire prior transcript.
4. Confirm the handoff contains **no** student names, UGA IDs, grades, tokens, or credentials. Redact if present.
5. Suggest where durable outcomes should live (commit, PR description, `docs/`) vs ephemeral chat.

## Handoff Summary template

```markdown
## Handoff Summary

**Goal:**
**Repos / paths:**
**Files touched or to create:**
**Decisions already made:**
**Open questions:**
**eLC test context:** (OU, role, Manage Files path — or N/A; use sandbox OUs only)
**Out of scope:**
**FERPA note:** (confirm no student PII in this handoff)
**Suggested next skill / command:** (e.g. elc-html-cleanup, elc-smoke-test, elc-agent-scaffolder)
```

## Role tips

| From → To | Emphasize |
|-----------|-----------|
| ID → Dev | Agent brief or HTML paths; link AGENT-REQUEST-TEMPLATE if requesting an agent |
| Dev → QA | PR URL, Manage Files path, roles to test, keyboard/focus notes |
| Any → Any | Repo tier (do not ask them to edit read-only upstream unless intentional) |

## Durable references

- `uga-online-cursor-docs/docs/cursor/chat-and-transcript-practices.md`
- `uga-online-cursor-docs/docs/cursor/prompts/handoff-new-project.md`

## Do not

- Paste full chat exports as the source of truth
- Include real student data or API secrets
- Implement code in this skill — handoff only; then switch to the appropriate build/review skill
