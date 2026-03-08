#!/bin/bash
# Enable GitHub Pages via GitHub CLI. Run this after: brew install gh && gh auth login

set -e
REPO="blastergirl/pet-loving-simulator"

if ! command -v gh &>/dev/null; then
  echo "GitHub CLI (gh) not found. Install it: https://cli.github.com/"
  echo "On Mac with Homebrew: xcode-select --install   then   brew install gh"
  echo "Then run: gh auth login"
  exit 1
fi

echo "Enabling GitHub Pages for $REPO..."
gh api repos/"$REPO"/pages -X PUT --input - <<< '{"source":{"branch":"main","path":"/"}}'

echo "Done! Your site will be live in 1-2 minutes at:"
echo "  https://blastergirl.github.io/pet-loving-simulator/"
