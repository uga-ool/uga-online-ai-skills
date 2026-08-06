# Writing a good skill

A skill is a markdown file that teaches an AI assistant one job well. The assistant reads it only when it decides the skill applies, so a skill that nobody triggers is the same as a skill that does not exist. The examples below come from skills already in this repo.

## The description decides everything

Before doing anything, the assistant scans the `description` of every installed skill and picks the ones that match what you asked for. A vague description never fires.

Compare these. The weak version:

```yaml
description: Helps with HTML.
```

The version we actually ship in `elc-html-cleanup`:

```yaml
description: Remediate eLC course HTML from PDF tools or ID Assistant (PPT-to-HTML). Fix accessibility, equations, PDF/PPT artifacts, semantic structure, and enforce the UGA Online Design System. Use whenever the user asks for HTML cleanup, remediation, design-system wrap, or fixing inaccessible HTML for Brightspace course files — even if they only @-mention an .html file.
```

The second one works because it names the situation, lists the words people really type ("cleanup," "remediation," "design-system wrap"), and covers the case where the person says almost nothing and just attaches a file. Write the description last, after you know what the skill does, and imagine three different people asking for it in three different ways.

## One skill, one job

Skills that try to do everything get triggered at the wrong moments. When two skills are close cousins, say so in the body. `elc-html-cleanup` opens with a line pointing at its sibling:

> Prefer this skill for pure remediation; use `elc-course-reviewer` when the user wants a scored course-level review.

That one sentence prevents the assistant from producing a review when someone wanted cleaned HTML.

## State the limits honestly

An assistant will happily imply it can do something it cannot. `elc-agent-scaffolder` heads this off directly:

> Features that call Brightspace APIs need a real eLC session (OU, XSRF) that only exists once the app is deployed and opened inside eLC by a human. The assistant never has that session or D2L API access in this environment.

Every skill in this repo also carries the non-negotiable limits: work only on what the user supplies, never emit student names or UGA IDs, never emit credentials. Keep those in your skill even if they feel obvious.

## Write directions, not prose

The body is a set of instructions to the assistant. Use numbered steps for a sequence and bullets for rules. Write in the imperative: "Confirm which HTML file to clean," not "The assistant should confirm which file." A "Do not" section at the end is worth more than several paragraphs of nuance, because it is unambiguous.

Keep it short. If a skill runs past roughly 150 lines, it is probably two skills, or it is pasting reference material that belongs in a linked doc.

## Link, do not paste

`uga-online-handoff` ends by pointing at the canonical docs rather than reproducing them. That way the skill does not go stale when the doc changes. The exception is anything the assistant needs verbatim to produce correct output, such as the required design-system CSS URLs.

## Naming

Lowercase words joined by hyphens. The folder name and the frontmatter `name` must match exactly, or the packaging script produces a file the platforms reject. Prefix by domain when it helps people scan the list: `elc-` for eLC course content, `uga-online-` for team process.

## If the skill needs to run in ID Assistant

The ID Assistant lives inside eLC and cannot read a git repository. Keep the instructions self-contained, fill in `trigger` and `keywords`, and avoid referring to file paths or scripts the assistant cannot reach. See [templates/README.md](../templates/README.md) for the field mapping.

## Before you open a pull request

- The folder name is kebab-case and matches the frontmatter `name`.
- The description says what it does and when to use it.
- No student names, UGA IDs, grades, API keys, or tokens anywhere in the file.
- It is not a duplicate of an existing skill; if it overlaps, the body says which to prefer.
- `./scripts/validate-skills.sh` passes.

The pull request template repeats this list so you do not have to remember it.
