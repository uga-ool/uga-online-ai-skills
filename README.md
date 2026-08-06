# UGA Online AI skills

Shared AI skills for the UGA Online team. A skill is a plain markdown file that teaches an AI assistant how to do one of our recurring jobs the way we want it done: remediating course HTML, scaffolding a module, reviewing a pull request, handing work to the next person.

The same file works across the tools we use. Claude Code, Cowork, Cursor, and the ID Assistant in eLC all read it, and for anything else you can paste it in as instructions.

## Quick start

1. Get the files. Click the green **Code** button and choose **Download ZIP**, or run `git clone https://github.com/uga-ool/uga-online-ai-skills.git`.
2. Install the skills you need. [docs/platforms.md](docs/platforms.md) has the steps for each platform.
3. Work normally. Skills trigger on their own when what you ask matches what they do; you can also name one directly.

New to GitHub? [docs/sharing-with-github.md](docs/sharing-with-github.md) explains the whole workflow, including a glossary.

## Skills

| Skill | What it does | Mainly for |
|---|---|---|
| [elc-html-cleanup](skills/elc-html-cleanup/SKILL.md) | Remediate course HTML from PDF or PPT sources: accessibility, equations, artifacts, design system | ID, QA |
| [elc-content-scaffold](skills/elc-content-scaffold/SKILL.md) | Build a course-file HTML shell for a module from an outline | ID |
| [elc-intent-html](skills/elc-intent-html/SKILL.md) | Turn a marked-up Word or plain-text draft into design-system HTML with Lit components | ID |
| [elc-course-reviewer](skills/elc-course-reviewer/SKILL.md) | Review supplied course materials for quality and accessibility together | ID, QA |
| [uga-quiz-author](skills/uga-quiz-author/SKILL.md) | Author and validate JSON for the Lit `<uga-quiz>` component | ID, developer |
| [uga-online-handoff](skills/uga-online-handoff/SKILL.md) | Produce a FERPA-safe handoff so the next person can pick up the work | Everyone |
| [elc-agent-request](skills/elc-agent-request/SKILL.md) | Turn a rough idea for an eLC agent into a brief a developer can build from | ID |
| [elc-agent-scaffolder](skills/elc-agent-scaffolder/SKILL.md) | Scaffold a Brightspace agent plugin against the framework contract | Developer |
| [scaffold-from-uga-online-template](skills/scaffold-from-uga-online-template/SKILL.md) | Start a new course-file React app from the shared template | Developer |
| [uga-online-pr-and-code-review](skills/uga-online-pr-and-code-review/SKILL.md) | Team PR conventions and pre-PR checks for authors | Authors |
| [uga-online-pr-reviewer](skills/uga-online-pr-reviewer/SKILL.md) | Fast focused review of one specific pull request | Reviewers |
| [elc-smoke-test](skills/elc-smoke-test/SKILL.md) | Pre-merge QA pass for a Brightspace tool, formatted for a PR test plan | QA |
| [setup-git-hooks](skills/setup-git-hooks/SKILL.md) | Wire up the team's commit template and hooks in a fresh clone | Everyone |

Sources are in [`skills/<name>/SKILL.md`](skills/). Prebuilt Claude packages are in [`skills/packaged/`](skills/packaged/).

Several skills assume the assistant can read and write files in a repository. Those will not work in the eLC ID Assistant, which has no repo access. [docs/platforms.md](docs/platforms.md) says which is which.

## Adding a skill

Start from [`templates/skill-template/SKILL.md`](templates/skill-template/SKILL.md), read [docs/authoring-skills.md](docs/authoring-skills.md), and follow [CONTRIBUTING.md](CONTRIBUTING.md). There is a browser-only path that needs no git and no installed tools.

If you would rather not write it yourself, open an issue with the **Request a new skill** template.

## Maintainer commands

```bash
./scripts/validate-skills.sh   # check names, frontmatter, and stray credentials
./scripts/package-skills.sh    # rebuild skills/packaged/<name>.skill
```

Run both after editing any `SKILL.md`, and commit the regenerated package alongside the source.

## What this repo is not

It does not manage the custom AI agents embedded in eLC courses; those live in the Brightspace agent framework repo. It also does not hold always-on guardrails like FERPA rules or repo tiers. Those belong in each platform's organization or always-apply settings so they cover every conversation, not just the ones where a skill fires.
