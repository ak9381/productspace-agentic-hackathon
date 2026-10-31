#!/usr/bin/env bash
# Re-copy hackathon context from the private working folder, scrub, check for secrets, push.
set -euo pipefail
SRC=/workspace/product-space-hackathon
DST="$(cd "$(dirname "$0")" && pwd)"
cd "$DST"
for f in instructions.md checklist.md rules.md problem-statements.md kickoff-notes.md plan.md; do
  [ -f "$SRC/$f" ] && cp "$SRC/$f" "$f"
done
[ -f "$SRC/github-audit-public.md" ] && cp "$SRC/github-audit-public.md" github-audit.md
mkdir -p council
for f in "$SRC"/council/round-*.md "$SRC"/council/*-prompt.txt "$SRC"/council/*-cands.txt "$SRC"/council/scores.csv "$SRC"/council/common.txt; do
  [ -f "$f" ] && cp "$f" council/
done
for j in claude agy; do mkdir -p council/$j; cp "$SRC"/council/$j/*.md council/$j/ 2>/dev/null || true; done
# Scrub (never copy kickoff-captions-raw.txt, invite.ics, *.err, *.json)
FILES=$(git ls-files -co --exclude-standard | grep -E '\.(md|txt|csv)$' | grep -v '^README.md$' || true)
for f in $FILES; do
  perl -pi -e '
    s/\+?91[\s-]?\d{5}[\s-]?\d{5}|\b[6-9]\d{9}\b/[phone removed]/g;
    s/\b[\w.+-]+@(?!theproductspace\.in|wisprflow\.ai)[\w-]+\.[\w.]+\b/[email removed]/gi;
    s/https?:\/\/(meet\.google\.com|[\w.]*zoom\.us|teams\.microsoft\.com|ref\.wisprflow\.ai|wisprflow\.ai\/r)\S*/[link removed]/gi;
    s/\b(meet\.google\.com\/[\w-]+)/[link removed]/gi;
    s/\bPRODUCTSPACE\b/[code removed]/g;
    s/https?:\/\/(chat\.whatsapp\.com|[\w.]*edmingle\S*|learn\.theproductspace\.in)\S*/[link removed]/gi;
    s/\S*token=\S+/[link removed]/g;
    s/github\.com\/ak9381\/(?!productspace-agentic-hackathon)[\w.-]+/[private repo]/g;
    s/\b(sk-[\w-]{10,}|gh[pousr]_\w{20,}|AKIA\w{16}|xox[bp]-[\w-]+|AIza[\w-]{30,})/[token removed]/g;
    s/(password|passwd|pwd|otp)\s*[:=]\s*\S+/$1: [removed]/gi;
  ' "$f"
done
# Secret check: abort if anything suspicious remains
if grep -rInE 'sk-[A-Za-z0-9]{10}|gh[pousr]_[A-Za-z0-9]{20}|AKIA[0-9A-Z]{16}|AIza[0-9A-Za-z_-]{30}|xox[bp]-|BEGIN [A-Z ]*PRIVATE KEY|meet\.google\.com/|chat\.whatsapp|token=|PRODUCTSPACE|\b[6-9][0-9]{9}\b|[A-Za-z0-9._%+-]+@gmail\.com|nyu\.edu' --exclude=sync.sh --exclude-dir=.git . ; then
  echo "Secret check FAILED, not pushing"; exit 1
fi
git add -A
git diff --cached --quiet && { echo "nothing new"; exit 0; }
git commit -m "sync: $(date '+%Y-%m-%d %H:%M IST')"
git push origin HEAD
