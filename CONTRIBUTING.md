# Contributing a skill

Anyone on the UGA Online team can add or improve a skill. There are two routes to the same destination: one entirely in your browser, one from the command line. Pick whichever you are comfortable with; neither produces a better result.

Before you start, read [docs/authoring-skills.md](docs/authoring-skills.md). It is short, and it covers the one thing most new skills get wrong, which is writing a description too vague for the assistant to act on.

## Route 1: In your browser (no software to install)

You need a GitHub account with access to the `uga-ool` organization. Nothing else.

1. Open [`templates/skill-template/SKILL.md`](templates/skill-template/SKILL.md) on GitHub and copy the whole file.
2. Go back to the repo's main page. Click **Add file**, then **Create new file**.
3. In the filename box, type `skills/` then your skill's name, then `/SKILL.md`. For example: `skills/quiz-feedback-writer/SKILL.md`. Typing the slashes creates the folders automatically. Use lowercase words joined by hyphens.
4. Paste the template into the editor and fill it in. The frontmatter `name` must match the folder name you just typed, exactly.
5. Scroll down. Choose **Create a new branch for this commit and start a pull request**. GitHub suggests a branch name; that is fine.
6. Click **Propose new file**, then describe your skill on the next screen: what it does, and one example of a prompt that should trigger it.
7. Click **Create pull request**. You are done. A maintainer will review it, run the validation and packaging scripts, and merge.

To fix an existing skill instead, open its `SKILL.md`, click the pencil icon, edit, and follow the same steps from step 5.

## Route 2: From the command line

```bash
git clone https://github.com/uga-ool/uga-online-ai-skills.git
cd uga-online-ai-skills
git checkout -b skill/my-skill-name

cp -R templates/skill-template skills/my-skill-name
# edit skills/my-skill-name/SKILL.md

./scripts/validate-skills.sh
./scripts/package-skills.sh

git add skills/my-skill-name skills/packaged/my-skill-name.skill
git commit -m "Add my-skill-name skill"
git push -u origin skill/my-skill-name
```

Then open a pull request, either from the link git prints or with `gh pr create`.

Run both scripts before you commit. `validate-skills.sh` catches the mistakes that make a skill fail to install: a name that does not match its folder, missing frontmatter, an accidentally committed credential. `package-skills.sh` rebuilds the `.skill` file that Claude users install, and it needs to be regenerated any time you change a `SKILL.md`.

## What reviewers check

Every skill pull request gets read against this list. It is the same list in the pull request template, so you can check it yourself first.

- The folder name is lowercase-with-hyphens and matches the frontmatter `name`.
- The description says both what the skill does and when to use it, in words someone would actually type.
- It does not duplicate an existing skill. If it overlaps with one, the body says which to prefer.
- No student names, UGA IDs, grades, or other FERPA-protected data.
- No API keys, tokens, passwords, or internal URLs that should stay private.
- Instructions are written as directions to the assistant, in the imperative.
- `skills/packaged/<name>.skill` was regenerated, or the pull request notes that a maintainer should do it.

## Requesting a skill instead of writing one

Open an issue with the **Request a new skill** template. Describe the task you keep doing by hand, what a good result looks like, and how you would ask for it. That last part becomes the description, so it is genuinely useful.

## Reporting a problem

Open an issue with the **Report a skill problem** template. Include the skill name, the platform you used, what you asked for, and what you got. A copy of the wrong output helps, as long as it has no student data in it.

## A note on secrets and student data

This repo is shared across the team and git keeps its full history, so a credential or a student name committed once is not really removed by deleting the line later. If you realize you have committed something sensitive, tell a maintainer right away rather than trying to clean it up alone.
