#!/bin/bash
set -e

PREV_TAG="$1"
LIBS_FILE="gradle/libs.versions.toml"

if [ ! -f "$LIBS_FILE" ]; then
    echo "Error: $LIBS_FILE not found."
    exit 1
fi

# Extract the [versions] section only
VERSIONS_SECTION=$(awk '/\[versions\]/ {flag=1; next} /^\[/{flag=0} flag' "$LIBS_FILE")

# Extract previous versions of A and B from that section
prev_A=$(echo "$VERSIONS_SECTION" | awk -F'"' '/^A\s*=/ {print $2}')
prev_B=$(echo "$VERSIONS_SECTION" | awk -F'"' '/^B\s*=/ {print $2}')

# Fallback if versions not found
prev_A=${prev_A:-0.0.0}
prev_B=${prev_B:-0.0.0}

echo "[DEBUG] Detecting library changes since $PREV_TAG"
echo "[DEBUG] Previous versions: A=$prev_A, B=$prev_B"

# For simplicity, compare with git tags or any custom logic here
# Example: just say "none" if no change detected
# You can replace with your actual change detection logic
if [ "$prev_A" = "$prev_B" ]; then
    echo "No library change detected, bumping patch version by default."
    echo "none"
else
    # If differences detected, you could decide major/minor/patch
    echo "Library change detected."
    echo "patch"
fi
