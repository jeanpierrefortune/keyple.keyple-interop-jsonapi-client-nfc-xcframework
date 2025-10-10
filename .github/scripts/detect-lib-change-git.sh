#!/bin/bash
set -e

PREV_TAG=$1
echo "Detecting library changes since $PREV_TAG"

# Get the previous libs.versions.toml from last tag
git show "$PREV_TAG:gradle/libs.versions.toml" > prev_libs.versions.toml || echo "" > prev_libs.versions.toml

# Extract previous library versions (from [versions] section only)
PREV_LIB_A=$(awk '/\[versions\]/{flag=1; next} /^\[/{flag=0} flag && /^keypleInteropJsonapiClientKmpLib\s*=/ {match($0, /"([0-9]+\.[0-9]+\.[0-9]+)"/, arr); print arr[1]}' prev_libs.versions.toml || echo "0.0.0")
PREV_LIB_B=$(awk '/\[versions\]/{flag=1; next} /^\[/{flag=0} flag && /^keypleInteropLocalreaderNfcmobileKmpLib\s*=/ {match($0, /"([0-9]+\.[0-9]+\.[0-9]+)"/, arr); print arr[1]}' prev_libs.versions.toml || echo "0.0.0")

# Extract current library versions
CUR_LIB_A=$(awk '/\[versions\]/{flag=1; next} /^\[/{flag=0} flag && /^keypleInteropJsonapiClientKmpLib\s*=/ {match($0, /"([0-9]+\.[0-9]+\.[0-9]+)"/, arr); print arr[1]}' gradle/libs.versions.toml)
CUR_LIB_B=$(awk '/\[versions\]/{flag=1; next} /^\[/{flag=0} flag && /^keypleInteropLocalreaderNfcmobileKmpLib\s*=/ {match($0, /"([0-9]+\.[0-9]+\.[0-9]+)"/, arr); print arr[1]}' gradle/libs.versions.toml)

# Debug output (optional)
echo "Previous versions: A=$PREV_LIB_A, B=$PREV_LIB_B"
echo "Current versions : A=$CUR_LIB_A, B=$CUR_LIB_B"

# Compare two semantic versions and return change level
compare_versions() {
  local OLD=$1
  local NEW=$2

  IFS='.' read -r oM oN oP <<< "$OLD"
  IFS='.' read -r nM nN nP <<< "$NEW"

  if [ "$nM" -gt "$oM" ]; then
    echo "major"
  elif [ "$nN" -gt "$oN" ]; then
    echo "minor"
  elif [ "$nP" -gt "$oP" ]; then
    echo "patch"
  else
    echo "none"
  fi
}

change_a=$(compare_versions "$PREV_LIB_A" "$CUR_LIB_A")
change_b=$(compare_versions "$PREV_LIB_B" "$CUR_LIB_B")

# Determine the highest change level among the two libraries
if [ "$change_a" == "major" ] || [ "$change_b" == "major" ]; then
  echo "major"
elif [ "$change_a" == "minor" ] || [ "$change_b" == "minor" ]; then
  echo "minor"
elif [ "$change_a" == "patch" ] || [ "$change_b" == "patch" ]; then
  echo "patch"
else
  echo "none"
fi
