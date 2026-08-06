---
name: uga-quiz-author
description: Draft or validate JSON for the UGA Lit uga-quiz component and explain dropbox / grade-sync setup. Use whenever the user mentions uga-quiz, in-page formative quiz JSON, quiz-grade-sync, QUIZ_JSON_FORMAT, or wants multiple-choice / true-false / short-answer items for eLC course HTML.
---

# uga-quiz author

Author and validate **local JSON** for the Lit `<uga-quiz>` component used in eLC course files. This is **not** the native Brightspace quiz tool.

## Durable docs (sibling repos)

- Format: `uga-lit-components/docs/QUIZ_JSON_FORMAT.md` (or `uga-online-cursor-docs/docs/d2l-brightspace/QUIZ_JSON_FORMAT.md` if mirrored)
- Dropbox / grade sync: `uga-lit-components/docs/QUIZ_DROPBOX_SETUP.md`

Read those files when present; the rules below are the minimum contract.

## HTML embed

```html
<script type="module" src="/shared/ugaonline/js/uga-components.js"></script>

<uga-quiz
  quiz-id="my-quiz"
  quiz-title="My Quiz"
  passing-score="70"
  type="local"
  filename="my-quiz.json"
></uga-quiz>
```

`type="local"` and `filename` are required for JSON-backed quizzes. Prefer a relative path from the HTML page.

## JSON contract

Top-level: optional `title`, required `questions` array.

Every question needs:

| Field | Notes |
|-------|--------|
| `id` | Unique string |
| `type` | See types below |
| `question` | Prompt text |
| `points` | Number |
| `correctAnswer` | Shape depends on type |

Optional: `explanation`, `options`, `caseSensitive` (short-answer).

### Types and `correctAnswer`

| Type | correctAnswer | options |
|------|---------------|---------|
| `multiple-choice` | 0-based index | Required |
| `true-false` | `0` or `1` | `["True","False"]` |
| `short-answer` | string | Not used |
| `multi-select` | array of indices | Required |
| `ordering` | permutation array | Required (correct order) |
| `matching` | object map | Required |

## Workflow

1. Clarify quiz title, passing score, and question list (or draft from learning objectives they supply).
2. Produce valid JSON; validate ids unique, indices in range, and type/field consistency.
3. Provide the matching `<uga-quiz>` snippet with `filename`.
4. If they need gradebook sync, summarize dropbox setup from QUIZ_DROPBOX_SETUP (folder naming, `uga-quiz-grade-sync`) without inventing undocumented APIs.
5. Flag gaps: release conditions, Creator+-style editors, and native-quiz parity are product limitations — do not claim they work unless docs say so.

## FERPA

Use anonymized example stems. No real student data in sample items or filenames.

## Related skills

- Page shell: `elc-content-scaffold`
- Pure HTML remediation: `elc-html-cleanup`
- New Brightspace agent for quiz QA: `elc-agent-request` (e.g. future `quiz-validator`)
