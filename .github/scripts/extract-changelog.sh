#!/bin/bash
set -euo pipefail

VERSION="$1"
CHANGELOG_FILE="CHANGELOG.md"

# Check if CHANGELOG.md exists
if [ ! -f "$CHANGELOG_FILE" ]; then
  echo "Error: $CHANGELOG_FILE not found"
  exit 1
fi

# Find the line number where the section for the given version starts
START_LINE=$(grep -n "^## \[$VERSION\]" "$CHANGELOG_FILE" | cut -d: -f1)

if [ -z "$START_LINE" ]; then
  echo "Error: Version $VERSION not found in $CHANGELOG_FILE"
  exit 1
fi

# Find the line number where the next version section starts
# If there is no next version, use the end of the file
TOTAL_LINES=$(wc -l < "$CHANGELOG_FILE")
NEXT_LINE=$(tail -n +$((START_LINE+1)) "$CHANGELOG_FILE" | grep -n -m1 "^## \[" | cut -d: -f1 || echo "$((TOTAL_LINES-START_LINE))")
END_LINE=$((START_LINE + NEXT_LINE - 1))

# Extract lines between START_LINE and END_LINE
# Exclude the first line (section title) and any lines starting with '[' (references)
sed -n "$((START_LINE+1)),$END_LINE p" "$CHANGELOG_FILE" \
  | grep -v '^\['
