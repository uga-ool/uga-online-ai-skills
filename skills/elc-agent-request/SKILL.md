---
name: elc-agent-request
description: Turn an instructional designer's idea for a new Brightspace/eLC AI agent into a structured feature-request brief a developer can implement from. Use whenever a designer or non-developer describes a new AI tool or assistant they want inside eLC/Brightspace, even informally — they don't need to know framework terms like "workflow" or "tool category" to use this.
---

# eLC AI agent feature request

Designers requesting a new Brightspace agent shouldn't need to understand the agent framework to describe what they want — that's the developer's job. This skill turns a rough idea into the structured brief a developer actually needs, and hands them the right document instead of an ad hoc description.

## Steps

1. If the user hasn't already filled out a request template, ask structured questions to fill these fields:
   - **Agent name** (kebab-case identifier)
   - **Purpose** — what problem does this solve for students or instructors?
   - **Brightspace inputs needed** — what course data or context does the agent need to see?
   - **Tool categories** — what kinds of actions or lookups should the agent be able to perform?
   - **Output format** — what should the student or instructor actually see?
   - **LLM instructions** — the tone, constraints, or behavior the AI should follow
2. Write the completed brief in a form the user can paste directly into a new chat in the agent framework repo, or hand to a developer as-is.
3. Prefer the completed brief shape from `uga-online-cursor-docs/docs/ai-agents-brightspace/guides/AGENT-REQUEST-TEMPLATE.md` (or the copy in `uga-online-brightspace-agent-framework/docs/guides/agent-request-template.md`) so the designer can paste it into a coding-agent session in the framework work repo.
4. Remind the user that developers work from `AGENT-GUIDE.md` / `docs/guides/agent-guide.md` on their end — the designer doesn't need to explain the framework itself, just the brief above.
5. Don't write plugin code as part of this skill. If the user wants to move straight to implementation, switch to `elc-agent-scaffolder` only after they confirm.

## Why this separation matters

Keeping the request focused on product intent (not implementation detail) means the same brief works whether the developer who picks it up is on the framework team, a fork maintainer, or a contractor unfamiliar with this specific codebase.
