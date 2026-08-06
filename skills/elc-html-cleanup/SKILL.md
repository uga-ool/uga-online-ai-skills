---
name: elc-html-cleanup
description: Remediate eLC course HTML from PDF tools or ID Assistant (PPT-to-HTML). Fix accessibility, equations, PDF/PPT artifacts, semantic structure, and enforce the UGA Online Design System. Use whenever the user asks for HTML cleanup, remediation, design-system wrap, or fixing inaccessible HTML for Brightspace course files — even if they only @-mention an .html file.
---

# eLC HTML cleanup

Remediate HTML for UGA Online eLC course content. Preserve all instructional content; reformat only. Prefer this skill for pure remediation; use `elc-course-reviewer` when the user wants a scored course-level review.

## Operating limits

- Work only on files or pasted HTML the user supplies.
- Do not claim live LMS API access.
- Never include student names or UGA IDs in output.

## Steps

1. Confirm which HTML file(s) to clean (or use the file they named).
2. Apply the rules below completely, including the design system.
3. Return corrected HTML. Add commentary only when flagging review items.
4. If anything needs human review, append `<!-- REVIEW SUMMARY: ... -->` at the bottom of the file.

## Source awareness

- ID Assistant frequently mishandles equations — treat equation-like content with extra care.
- Sources may be PDF remediation tools or PPT-to-HTML output.

## Equations

- Plain-text equations (e.g. `E=mc2`): wrap in `<span class="math-inline">` and convert to MathML when intent is clear; otherwise flag `<!-- EQUATION NEEDS REVIEW -->`.
- `<img>` with equation alt text: replace with MathML or LaTeX display; leave `<!-- converted from image -->`.
- Fix malformed MathML (`xmlns="http://www.w3.org/1998/Math/MathML"`).
- Never delete an equation — flag if unfixable.

## Accessibility

- Every `<img>` needs descriptive `alt`; use `alt="[image — description needed]"` when unknown.
- Heading levels sequential (h1 → h2 → h3); fix skipped levels.
- Tables: `<thead>`, `<th scope="col">` for column headers.
- Meaningful link text (not "click here").
- Add `lang="en"` to `<html>` if missing.

## Formatting cleanup

- Remove inline styles that only control font size, color, or font-family.
- Convert `<font>` to semantic equivalents or remove if decorative.
- Remove empty `<p>`, `<span>`, `<div>` tags.
- Fix lists: `<li>` must be direct children of `<ul>` or `<ol>`.
- One `<h1>` per page; demote extras to `<h2>`.

## PDF artifacts

- Remove page-break artifacts (`page-break` classes / hrs).
- Remove repeated PDF headers/footers (running titles, page numbers).
- Merge paragraphs split mid-sentence across PDF lines.

## PPT artifacts (ID Assistant)

- Remove slide-transition markup (`slide`, `transition`, `animation` classes).
- Convert bullet slides to proper `<ul>/<li>`.
- Remove `<div class="notes">` presenter notes unless the user asks to keep them.

## UGA Online Design System (required)

Official install: https://design.online.uga.edu/getting-started/installation/

### Full-page HTML

Every full page must include:

1. `<!DOCTYPE html>` and `<html lang="en">`
2. Google Fonts — Merriweather, Merriweather Sans, Oswald (exact links from the installation page)
3. Design system CSS — `https://design.online.uga.edu/css/base.css` (prefer a **versioned** URL in production)
4. Skip link — `<a class="cmp-skip-to-content" href="#main-content">Skip to main content</a>` (or documented equivalent)
5. Main landmark — `<main id="main-content">`
6. Layout utilities — e.g. `obj-reading-width`
7. Design system JS — `https://design.online.uga.edu/js/scripts.js` (or matching versioned path) before `</body>`

### Fragments

1. Wrap in a design-system container (e.g. `obj-reading-width` or `<main id="main-content">` when appropriate).
2. Use design-system patterns for headings, lists, tables, and links.
3. If the fragment will be a standalone course file, upgrade it to a full page.
4. If it stays embed-only, note in REVIEW SUMMARY when the parent page must already load `base.css`.

### Never

- Ship cleaned HTML with only PDF/PPT inline styles and no design-system structure.
- Remove design-system links from a page that already had them.
- Use non–design-system CSS frameworks unless the user explicitly requests an exception.

## Durable references

When the sibling docs hub is available: `uga-online-cursor-docs/cursor/rules/uga-online-html-cleanup.mdc` and `uga-online-design-system.mdc`.
