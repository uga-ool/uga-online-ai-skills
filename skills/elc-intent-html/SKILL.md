---
name: elc-intent-html
description: Compile instructional designer intent markup in Word/plain text into UGA Online Design System HTML and Lit components (tabs, accordion, callout, video, quiz stubs). Use when an ID pastes a draft with markers like <bold>, :::tabs, :::callout, :::accordion, "tab container", or asks to convert Word/raw text into purposeful eLC HTML with intentional formatting — not plain cleanup or empty module scaffolds.
---

# eLC intent HTML

Turn an ID’s **marked-up source draft** into purposeful course HTML: design-system shell plus Lit embeds where the markers request structure (tabs, accordion, callouts, etc.).

Use this skill in an assistant that can read and write files.

Canonical cheatsheet (share with IDs): `uga-online-cursor-docs/docs/cursor/elc-intent-markup.md`

**How IDs should invoke this skill:** `uga-online-cursor-docs/docs/cursor/elc-intent-html-for-ids.md`

## When to use this vs other skills

| Need | Skill |
|------|-------|
| Draft has intent markers / “make this a tab container” | **This skill** |
| Outline only, no markers | `elc-content-scaffold` |
| Existing HTML needs remediation | `elc-html-cleanup` |
| Full quiz item JSON | `uga-quiz-author` |

## Operating limits

- Work from pasted text, `.docx` text the user provides, or a file they name. No live LMS crawl.
- Preserve instructional wording; do not invent outcomes or examples they did not supply.
- No student PII in input or output.
- Prefer design-system classes and Lit components over ad hoc inline color/CSS.

## Workflow

1. Confirm page title and full page vs fragment (default: **full page**).
2. Parse intent markers per the cheatsheet (accept aliases like `<bold>`, `**bold**`, prose “put the next section in a tab container” when clearly scoped).
3. Emit:
   - Design-system HTML shell (fonts, `base.css`, skip link, `<main id="main-content">`, `obj-reading-width`, `scripts.js`). Prefer versioned CDN URLs in production.
   - Lit bundle when any `uga-*` component is used:  
     `<script type="module" src="/shared/ugaonline/js/uga-components.js"></script>`
   - Sidecar JSON files for `uga-tabs` / `uga-accordion` (and quiz only if they supplied items; otherwise stub + point to `uga-quiz-author`).
4. Map emphasis correctly: `<bold>` → `<strong>`; never ship `<bold>` or `<red>` as final tags. For “make this red,” prefer `<uga-callout type="important">` or a documented utility; if forced inline, flag in REVIEW SUMMARY.
5. Append `<!-- REVIEW SUMMARY: … -->` for missing video IDs, unknown markers, color requests without a design-system match, and JSON paths the ID must upload beside the HTML.

## Intent → output (quick reference)

| Marker | Output |
|--------|--------|
| `<bold>…</bold>` / `**…**` | `<strong>` |
| `<italic>…</italic>` / `*…*` | `<em>` |
| `:::callout type=note` … `:::` | `<uga-callout type="note" label="…" body="…">` (`important`, `tip`, `example`, `warning`) |
| `:::tabs` / `=== Tab title` | `tabs/<slug>.json` + `<uga-tabs type="local" filename="…">` |
| `:::accordion` / `=== Panel` | accordion JSON + `<uga-accordion type="local" filename="…">` |
| `:::video id=…` | `<uga-video>` stub (check demo attrs: `videoid` / program patterns) |
| `:::quiz file=…` | `<uga-quiz type="local" filename="…">` stub |
| `:::instructor` | `<uga-instructor-note>` pattern + session caveat |
| `:::toc` / `:::return-to-top` | `<uga-toc>` / `<uga-return-to-top>` |

### Tabs JSON shape

```json
{
  "data": [
    { "title": "Tab one", "body": "<p>…</p>" }
  ]
}
```

### Accordion JSON shape

```json
{
  "title": "Optional heading",
  "data": [
    { "title": "Panel", "body": "<p>…</p>" }
  ]
}
```

Bodies inside JSON should be semantic HTML fragments (headings, lists, paragraphs) — not PDF artifact markup.

## Ambiguous instructions

If the user says “tabs” without marking tab boundaries, ask once for titles/content splits — or propose a split and list assumptions in REVIEW SUMMARY.

Unknown markers: keep text, do not invent components, list under REVIEW SUMMARY.

## Related

- Cheatsheet: `uga-online-cursor-docs/docs/cursor/elc-intent-markup.md`
- Lit demos: `uga-lit-components/demo/tabs.html`, `accordion.html`, `callout.html`
- Future eLC port: extend ID Assistant `html-page-authoring` to load this dialect (not implemented here)
