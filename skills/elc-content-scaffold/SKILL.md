---
name: elc-content-scaffold
description: Turn a syllabus, module outline, or topic list into eLC-ready HTML module shells using the UGA Online Design System and optional Lit component stubs (uga-toc, uga-video, uga-quiz). Use whenever an instructional designer asks for a new module page, content shell, HTML starter from an outline, or "scaffold this module for eLC."
---

# eLC content scaffold

Create course-file HTML shells for UGA Online eLC (Brightspace). One composition per module page: clear title, short intro, and structured sections — not a dashboard of widgets.

## Before writing

Ask only what is missing:

- Module or page title
- Outline / learning objectives / topic list (paste or file)
- Full page vs embed fragment (default: **full page**)
- Which Lit stubs to include (`uga-toc`, `uga-video`, `uga-quiz`, none)
- Bundle path: production `/shared/ugaonline/js/uga-components.js` unless the user specifies local/demo

## Full-page shell requirements

Follow https://design.online.uga.edu/getting-started/installation/

1. `<!DOCTYPE html>` + `<html lang="en">`
2. Google Fonts (Merriweather, Merriweather Sans, Oswald)
3. Versioned or latest `base.css` from design.online.uga.edu
4. Skip link to `#main-content`
5. `<main id="main-content">` with `obj-reading-width` (or documented layout utility)
6. `scripts.js` before `</body>`
7. One `<h1>` matching the module title; sequential headings for outline sections

## Content rules

- Preserve the user's instructional wording; do not invent learning outcomes they did not supply.
- Map outline items to `<h2>` / `<h3>` sections with short placeholder paragraphs only when needed for structure (`<!-- TODO: replace with instructional text -->`).
- Prefer design-system classes over custom CSS.
- No student PII in examples.

## Optional Lit stubs

When requested, add light-DOM-friendly stubs (do not invent attributes beyond documented patterns):

```html
<script type="module" src="/shared/ugaonline/js/uga-components.js"></script>

<uga-toc></uga-toc>

<!-- Video: set entry_id when known -->
<uga-video entry_id=""></uga-video>

<!-- Quiz: pair with a JSON file authored via uga-quiz-author -->
<uga-quiz
  quiz-id="module-quiz"
  quiz-title="Check your understanding"
  passing-score="70"
  type="local"
  filename="quiz.json"
></uga-quiz>
```

If quiz JSON is needed next, point the user to the `uga-quiz-author` skill.

## Output

- Write one HTML file per module (or the single page they asked for).
- End with a short checklist: design system links, skip/main, Lit script path, open TODOs.
- For remediation of existing messy HTML, switch to `elc-html-cleanup` instead of scaffolding from scratch.
- For Word/raw drafts with intentional markers (`:::tabs`, `<bold>`, callouts), use `elc-intent-html` instead.
