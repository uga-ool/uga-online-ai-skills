---
name: scaffold-from-uga-online-template
description: Scaffold a brand-new Brightspace course-file React app for UGA Online by copying patterns from the UGA-Brightspace-React-Template. Use this whenever the user wants to create a new course-file app, start a new Brightspace tool from the template, "rebase" an app on the latest template, or mentions course-file starter, template snapshot, or UGA-Brightspace-React-Apps/apps/ — even if they just say "I need a new eLC app for X."
---

# Scaffold from the UGA Online React template

New Brightspace course-file apps should all start from the same template so they share build tooling, Manage Files layout, and Brightspace session handling. This skill scaffolds a new app into the monorepo without ever editing the template repo itself.

**Public template:** https://github.com/uga-ool/UGA-Brightspace-React-Template
**Target monorepo:** `UGA-Brightspace-React-Apps/apps/` (one npm package per folder)

## 1. Confirm the target location

- Required path: `UGA-Brightspace-React-Apps/apps/<app-name>/`, kebab-case, matching the app's id.
- Never write feature code inside `UGA-Brightspace-React-Template` itself — it's the shared reference, and editing it in place breaks the starting point for every future app.
- Don't create the new app as a standalone sibling repo. The only exception is a legacy standalone repo (e.g. `uga-elc-kaltura-caption-import`) — only touch that pattern if the user explicitly names it.
- Match existing apps' `package.json`, `zip.js`, and build patterns already in the monorepo rather than inventing new conventions.

## 2. Read the reference (read-only)

From the template repo (or a frozen snapshot folder if one exists in the workspace), inspect and copy what the new app actually needs:

- `vite.config.ts` — relative paths, no hashed filenames, since Brightspace Manage Files hosting depends on stable relative paths
- `index.html`
- `src/context/CourseContext` — carries OU, XSRF, WhoAmI, and role
- `src/api/` helpers
- `.env.example` / env variable patterns
- The zip or build scripts described in the template README

Copy only what's needed — don't fork the whole template tree wholesale.

## 3. Build the scaffold

- Vite + TypeScript (+ SWC where the template uses it)
- `dist/` output must be laid out for Brightspace **Manage Files** (relative asset paths, matching zip layout expected by the README)

## 4. Add the app layer

- Set `package.json`'s `name` to the app identifier
- Add app-specific `src/` (components, API routes, main view)
- Configure `VITE_API_BASE_URL` (typically `/d2l/api`), `VITE_LP_VERSION`, `VITE_LE_VERSION` per the app or monorepo README
- Use `import.meta.env.DEV` to branch local-dev behavior from embedded-in-eLC behavior

## 5. Apply the design system

Load the UGA Online Design System CDN assets in any HTML shell: `base.css`, `scripts.js`, and the documented Google Fonts (Merriweather, Merriweather Sans, Oswald) from `https://design.online.uga.edu`.

## 6. Verify

Run `npm run build` inside `UGA-Brightspace-React-Apps/apps/<app-name>/` and confirm `dist/` is ready for a Manage Files upload (paths and zip layout match the README).

## 7. Optional finishing touches

- Add a row to the `apps/` table in `UGA-Brightspace-React-Apps/README.md` once the app is complete.
- Document any intentional differences from the public template in the PR description only if they're non-obvious.
- Before opening the first PR, run through the `uga-online-pr-and-code-review` skill's author track.
