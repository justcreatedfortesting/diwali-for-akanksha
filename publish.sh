#!/bin/zsh
# Rebuilds index.html from diwali.html and pushes it to GitHub Pages.
# Usage: ./publish.sh "What you changed"
set -e
cd "$(dirname "$0")"
msg="${1:-Update Diwali card}"
{ cat head.html; cat diwali.html; printf '\n</body>\n</html>\n'; } > index.html
git add diwali.html index.html head.html publish.sh
if git diff --cached --quiet; then
  echo "No changes to publish. Edit diwali.html first, save it, then run this again."
  exit 0
fi
git commit -m "$msg"
git push
echo ""
echo "Pushed. The live page updates in about a minute:"
echo "https://justcreatedfortesting.github.io/diwali-for-akanksha/"
