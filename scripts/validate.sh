#!/usr/bin/env bash
# validate.sh — checks the web-design skill folder.
# Run from anywhere: bash scripts/validate.sh
set -u
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT" || exit 1
fail=0
ok()   { echo "ok:   $1"; }
bad()  { echo "FAIL: $1"; fail=1; }

# 1. SKILL.md frontmatter parses: name web-design, description non-empty.
node -e '
const fs = require("fs");
const t = fs.readFileSync("SKILL.md", "utf8");
const m = t.match(/^---\n([\s\S]*?)\n---\n/);
if (!m) { console.error("FAIL: no YAML frontmatter"); process.exit(1); }
const fm = m[1];
const name = (fm.match(/^name:\s*(.+)$/m) || [])[1];
const desc = (fm.match(/^description:\s*(.+)$/m) || [])[1];
const hint = (fm.match(/^argument-hint:\s*(.+)$/m) || [])[1];
let bad = [];
if ((name || "").trim() !== "web-design") bad.push("name is not web-design");
if (!(desc || "").replace(/["'"'"']/g, "").trim()) bad.push("description is empty");
if (!(hint || "").trim()) bad.push("argument-hint missing");
if (bad.length) { console.error("FAIL: frontmatter: " + bad.join("; ")); process.exit(1); }
console.log("ok:   frontmatter (name web-design, description non-empty)");
' || fail=1

# 2. SKILL.md line count under 500.
lines=$(wc -l < SKILL.md | tr -d ' ')
if [ "$lines" -lt 500 ]; then ok "SKILL.md is $lines lines (< 500)"; else bad "SKILL.md is $lines lines (>= 500)"; fi

# 3. Every file path referenced in SKILL.md exists.
#    Tokens look like references/... scripts/... assets/... library/...
#    Tokens containing <...> are patterns (e.g. <slug>.md), not files: skipped.
missing=0
checked=0
while IFS= read -r tok; do
  case "$tok" in *'<'*|*'>'*|*-) continue ;; esac # <...> patterns and truncated pattern prefixes
  checked=$((checked + 1))
  if [ ! -e "$ROOT/$tok" ]; then
    bad "SKILL.md references missing path: $tok"
    missing=$((missing + 1))
  fi
done <<EOF
$(grep -oE '(references|scripts|assets|library)/[A-Za-z0-9_./-]+' SKILL.md | sed 's/[.,;:)]*$//' | sort -u)
EOF
if [ "$missing" -eq 0 ]; then ok "all $checked paths referenced in SKILL.md exist"; fi

# 4. node --check passes on all vendored .mjs scripts.
badjs=0
totaljs=0
while IFS= read -r f; do
  totaljs=$((totaljs + 1))
  if ! node --check "$f" >/dev/null 2>&1; then bad "node --check failed: $f"; badjs=$((badjs + 1)); fi
done <<EOF
$(find scripts assets -name '*.mjs' -type f | sort)
EOF
if [ "$badjs" -eq 0 ]; then ok "node --check passes on all $totaljs vendored .mjs scripts"; fi

# 5. Themes: files match index.json, and index.json is present.
#    Upstream ships 51 theme .md files counting themes/README.md; this skill
#    skips that README (its contract is summarised in SKILL.md), so the
#    vendored count is 50 — and index.json lists exactly those 50 themes.
if [ -f references/hallmark/themes/index.json ]; then
  theme_files=$(ls references/hallmark/themes/*.md 2>/dev/null | wc -l | tr -d ' ')
  theme_index=$(node -e 'console.log(JSON.parse(require("fs").readFileSync("references/hallmark/themes/index.json","utf8")).themes.length)')
  if [ "$theme_files" = "$theme_index" ] && [ "$theme_files" = "50" ]; then
    ok "themes: $theme_files files, index.json lists $theme_index (README.md excluded by design)"
  else
    bad "themes mismatch: $theme_files files vs $theme_index in index.json (expected 50/50)"
  fi
else
  bad "references/hallmark/themes/index.json missing"
fi

# 6. LICENSES.md contains all three copyright notices.
for notice in "Copyright (c) 2026 Hallmark contributors" "Copyright (c) 2026 Leonxlnx" "Copyright (c) 2026 Elaya"; do
  if grep -qF "$notice" LICENSES.md; then ok "LICENSES.md contains: $notice"; else bad "LICENSES.md missing: $notice"; fi
done

# 7. No absolute /home/ or /Users/ paths inside SKILL.md or references/.
if grep -rnE '/home/|/Users/' SKILL.md references/ >/tmp/web-design-validate-paths.txt 2>&1; then
  bad "absolute home paths found in SKILL.md or references/ (see /tmp/web-design-validate-paths.txt)"
  cat /tmp/web-design-validate-paths.txt
else
  ok "no absolute /home/ or /Users/ paths in SKILL.md or references/"
fi

# 8. The references/themes symlink shim resolves to the 50 themes.
if [ -L references/themes ] && [ -f references/themes/index.json ]; then
  ok "references/themes symlink resolves (theme.mjs layout shim)"
else
  bad "references/themes symlink missing or broken"
fi

if [ "$fail" -eq 0 ]; then
  echo "PASS: web-design skill validates"
  exit 0
else
  echo "FAIL: web-design skill has validation failures"
  exit 1
fi
