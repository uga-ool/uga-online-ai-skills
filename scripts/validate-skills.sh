#!/usr/bin/env bash
# Check every skills/<name>/SKILL.md before packaging or opening a pull request.
set -uo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/skills"

KNOWN_KEYS="name description trigger keywords"
MAX_DESCRIPTION=1024
LONG_DESCRIPTION=500

errors=0
warnings=0

fail() { echo "ERROR  $1"; errors=$((errors + 1)); }
warn() { echo "WARN   $1"; warnings=$((warnings + 1)); }

frontmatter_value() {
  # $1 = file, $2 = key. Prints the value of a top-level frontmatter key.
  awk -v key="$2" '
    NR == 1 && $0 == "---" { inside = 1; next }
    inside && $0 == "---" { exit }
    inside && index($0, key ":") == 1 {
      sub("^" key ": *", "")
      print
      exit
    }
  ' "$1"
}

shopt -s nullglob
for skill_dir in "$SRC"/*/; do
  dir_name="$(basename "$skill_dir")"
  [[ "$dir_name" == "packaged" ]] && continue

  file="$skill_dir/SKILL.md"
  if [[ ! -f "$file" ]]; then
    fail "$dir_name: no SKILL.md in the folder"
    continue
  fi

  if [[ "$(head -n 1 "$file")" != "---" ]]; then
    fail "$dir_name: file must start with a --- frontmatter block"
    continue
  fi

  if ! awk 'NR > 1 && $0 == "---" { found = 1; exit } END { exit !found }' "$file"; then
    fail "$dir_name: frontmatter block is never closed with ---"
    continue
  fi

  if [[ ! "$dir_name" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
    fail "$dir_name: folder name must be kebab-case (lowercase words joined by hyphens)"
  fi

  name="$(frontmatter_value "$file" name)"
  if [[ -z "$name" ]]; then
    fail "$dir_name: frontmatter is missing 'name'"
  elif [[ "$name" != "$dir_name" ]]; then
    fail "$dir_name: frontmatter name '$name' does not match the folder name"
  fi

  description="$(frontmatter_value "$file" description)"
  if [[ -z "$description" ]]; then
    fail "$dir_name: frontmatter is missing 'description'"
  elif (( ${#description} > MAX_DESCRIPTION )); then
    fail "$dir_name: description is ${#description} characters (max $MAX_DESCRIPTION)"
  elif (( ${#description} > LONG_DESCRIPTION )); then
    warn "$dir_name: description is ${#description} characters; under $LONG_DESCRIPTION reads better"
  elif (( ${#description} < 40 )); then
    warn "$dir_name: description is very short; say what it does AND when to use it"
  fi

  # Unknown frontmatter keys are usually typos, and some platforms reject them.
  while IFS= read -r key; do
    [[ -z "$key" ]] && continue
    if [[ " $KNOWN_KEYS " != *" $key "* ]]; then
      warn "$dir_name: unrecognized frontmatter key '$key' (known keys: $KNOWN_KEYS)"
    fi
  done < <(awk 'NR == 1 && $0 == "---" { inside = 1; next }
                inside && $0 == "---" { exit }
                inside && /^[A-Za-z_][A-Za-z0-9_-]*:/ { sub(":.*", ""); print }' "$file")

  if grep -Eqi '(api[_-]?key|client[_-]?secret|Bearer [A-Za-z0-9]|BEGIN [A-Z ]*PRIVATE KEY)[^a-z]*[:=]?[[:space:]]*["'"'"'][A-Za-z0-9_/+-]{12,}' "$file"; then
    fail "$dir_name: looks like it contains a credential — remove it before committing"
  fi
done

echo
if (( errors > 0 )); then
  echo "$errors error(s), $warnings warning(s). Fix the errors above."
  exit 1
fi
echo "All skills valid. $warnings warning(s)."
