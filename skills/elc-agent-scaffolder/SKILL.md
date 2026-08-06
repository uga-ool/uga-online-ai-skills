---
name: elc-agent-scaffolder
description: Scaffold or implement a new custom AI agent plugin that runs inside eLC (D2L Brightspace) using the UGA Online Brightspace agent framework. Use this whenever the user wants to build a new eLC/Brightspace AI agent, turn a designer's feature brief into a working plugin, or work on files under frontend/src/agents/ — even if they just describe the agent's purpose without naming the framework.
---

# eLC Brightspace agent plugin scaffolder

Brightspace agents are embedded tools inside eLC — workflow-driven flows, Valence-backed tools, and optionally an LLM proxy through a backend. They all follow one framework contract, and following it exactly is what keeps a new agent from breaking the shared build.

## Before writing code

1. Prefer the work/fork repo the team commits to (e.g. `agent-todd`). Treat `uga-online-brightspace-agent-framework` as read-only canonical upstream unless the user explicitly wants an upstream PR.
2. Read `docs/guides/agent-guide.md` in the framework clone (mirrored as `uga-online-cursor-docs/docs/ai-agents-brightspace/guides/AGENT-GUIDE.md`) — authoritative for AI-authored agent code. Also check `docs/guides/developer-guide.md` and architecture docs if present.
3. Use **`template-fidelity`** under `frontend/src/agents/template-fidelity/` as the structural reference. Prefer `npm run create-agent -- --name "<kebab-case>"` when available.
4. If the user has a designer's feature brief, map it into workflow steps, tool categories, and prompts rather than asking them to restate it in framework terms. Incomplete briefs belong in `elc-agent-request` first.

## Structure

Scaffold under `frontend/src/agents/<kebab-case-name>/` with:

- `config.ts` — workflow definition + `defineAgentPlugin`
- `entry.tsx` / `entry.html`
- `components/MainView.tsx`
- `prompts/`
- `data/tools.json`

## The one hard rule: imports

Agent plugin code must import **only** from `@uga-brightspace/framework`. Never deep-import from `frontend/src/core/*` — builds enforce this, and a deep import that works locally can break the production build silently.

## LLM and environment

- Respect `VITE_LLM_MODE` (`proxy` vs `direct`), `VITE_BACKEND_URL`, and optional `VITE_BACKEND_STREAM_URL` from the project's `DEVELOPER-GUIDE.md`.
- Never put production LLM API keys in client-side env vars that ship to the browser — the backend holds `LLM_*` keys server-side only.

## Brightspace session behavior

Features that call Brightspace APIs need a real eLC session (OU, XSRF) that only exists once the app is deployed and opened inside eLC by a human. The assistant never has that session or D2L API access in this environment — local dev is UI-only unless the project provides mocks, and no amount of scaffolding here can be tested against live Brightspace data. Say this plainly rather than implying live-data testing is available locally, and rely on the project's mocks (or ask the user to test manually after a Manage Files upload) to validate anything session-dependent.

## State

Persist agent state through the framework's Brightspace course-file state layer unless the product explicitly uses a different store.

## Scope check

If the user asks to edit `uga-online-brightspace-agent-framework` (the canonical upstream repo) rather than a fork or work repo, stop and suggest an upstream PR instead — prefer building in the team's agent fork (e.g. `agent-todd`) unless they explicitly intend to change the framework itself.

If the brief from a designer is incomplete (missing agent name, purpose, Brightspace inputs, or output format), ask for those specifics before scaffolding rather than guessing.
