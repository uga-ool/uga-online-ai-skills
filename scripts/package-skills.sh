#!/usr/bin/env bash
# Rebuild skills/packaged/<name>.skill from each skills/<name>/SKILL.md
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/skills"
OUT="$ROOT/skills/packaged"

mkdir -p "$OUT"

shopt -s nullglob
for skill_dir in "$SRC"/*/; do
  name="$(basename "$skill_dir")"
  if [[ "$name" == "packaged" ]]; then
    continue
  fi
  skill_md="$skill_dir/SKILL.md"
  if [[ ! -f "$skill_md" ]]; then
    echo "skip $name (no SKILL.md)" >&2
    continue
  fi
  rm -f "$OUT/$name.skill"
  tmp="$(mktemp -d)"
  mkdir -p "$tmp/$name"
  cp "$skill_md" "$tmp/$name/SKILL.md"
  (
    cd "$tmp"
    # .skill packages are zip archives with <name>/SKILL.md at the top
    zip -q -r "$OUT/$name.skill" "$name"
  )
  rm -rf "$tmp"
  echo "packed $name.skill"
done

echo "Done. Packages in $OUT"
