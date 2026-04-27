#!/usr/bin/env bash
# Copy the latest CV into assets/, commit, and push.
# Usage: ./scripts/update.sh
# Override source path: CV_SOURCE=/path/to/cv.pdf ./scripts/update.sh

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE="${CV_SOURCE:-$HOME/Dropbox/CV/cv/kilpatrick_cv_full.pdf}"
DEST="$REPO_ROOT/assets/kilpatrick_cv_full.pdf"

if [[ ! -f "$SOURCE" ]]; then
  echo "Error: CV not found at:" >&2
  echo "  $SOURCE" >&2
  echo "Set CV_SOURCE if your PDF lives elsewhere, e.g.:" >&2
  echo "  CV_SOURCE=\"\$HOME/Library/CloudStorage/Dropbox/CV/cv/kilpatrick_cv_full.pdf\" ./scripts/update.sh" >&2
  exit 1
fi

mkdir -p "$REPO_ROOT/assets"
cp "$SOURCE" "$DEST"
echo "Copied: $SOURCE -> $DEST"

cd "$REPO_ROOT"
git add "$DEST"

if git diff --staged --quiet; then
  echo "CV file unchanged; nothing to commit."
  exit 0
fi

git commit -m "Update CV"
git push
echo "Committed and pushed."
