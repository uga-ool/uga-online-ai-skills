# Skill template

`skill-template/SKILL.md` is the starting point for every new skill in this repo. One file works everywhere: Claude Code, Cowork, Cursor, the ID Assistant inside eLC, and any assistant that accepts pasted instructions.

## Make a new skill from it

1. Copy the `skill-template` folder into `skills/` and rename it. The folder name is the skill name: lowercase words joined by hyphens, like `elc-html-cleanup`.
2. Open `skills/<your-name>/SKILL.md` and edit every field. Delete sections you do not need.
3. Set the frontmatter `name` to exactly the folder name.
4. Run `./scripts/validate-skills.sh` to catch mistakes, then `./scripts/package-skills.sh` to build the installable file.
5. Open a pull request. See [CONTRIBUTING.md](../CONTRIBUTING.md) for both the browser and command-line versions of this.

If you are not comfortable running scripts, skip steps 4 and 5 and follow the browser path in [CONTRIBUTING.md](../CONTRIBUTING.md). A maintainer will run the scripts for you.

## What goes in each field

**name** — The skill's identifier. Lowercase, hyphens, no spaces. Must match the folder name.

**description** — The single most important field. It is how the assistant decides whether to use your skill at all. Write what the skill does, then when to use it, using the words a person would actually type. Aim for under 500 characters.

**trigger** — Short natural phrases a person might say, comma-separated: `clean up this HTML, fix accessibility`. Optional. Used by the ID Assistant; other platforms read the description instead, so keep the two consistent.

**keywords** — Single words, comma-separated: `html, accessibility, remediation`. Optional, ID Assistant only.

**Everything below the frontmatter** — The instructions. Write them as directions to the assistant, in the imperative: "Confirm which file to clean," not "The assistant should confirm."

Read [docs/authoring-skills.md](../docs/authoring-skills.md) before writing the instructions. It walks through what makes the existing skills work.

## Using the template in eLC ID Assistant

The ID Assistant inside eLC (D2L Brightspace) has its own form for creating a skill. Every field on it comes from the SKILL.md file.

![The ID Assistant Create Personal Skill form, with fields for Name, Description, Trigger, Keywords, and Instructions](../docs/images/id-assistant-create-personal-skill.png)

| Form field | Where it comes from |
|---|---|
| Name | Frontmatter `name`, or the `#` heading if you prefer a friendly title |
| Description | Frontmatter `description` |
| Trigger | Frontmatter `trigger` (leave blank if the file has none) |
| Keywords | Frontmatter `keywords` (leave blank if the file has none) |
| Instructions | Everything below the closing `---`, pasted as-is |

Do not paste the `---` frontmatter block into the Instructions box. It is metadata for the other platforms and only adds noise there.

One caveat: the ID Assistant runs inside eLC and cannot open files in a git repository. If your skill is meant to work there, keep the instructions self-contained rather than pointing at repo paths the assistant cannot reach.
