#!/bin/bash
set -e

PREV_VERSION=$1
CHANGE=$2

IFS='.' read -r MAJ MIN PAT <<< "$PREV_VERSION"

case "$CHANGE" in
  major)
    NEW_VERSION="$((MAJ + 1)).0.0"
    ;;
  minor)
    NEW_VERSION="$MAJ.$((MIN + 1)).0"
    ;;
  patch)
    NEW_VERSION="$MAJ.$MIN.$((PAT + 1))"
    ;;
  none)
    # No change detected on libs → go to patch +1
    echo "No library change detected, bumping patch version by default."
    NEW_VERSION="$MAJ.$MIN.$((PAT + 1))"
    ;;
  *)
    echo "Unknown change level: $CHANGE" >&2
    exit 1
    ;;
esac

echo "$NEW_VERSION"
