#!/bin/bash
set -e

PREV_TAG=$1

# Debug function (stderr)
debug() {
  echo "[DEBUG] $*" >&2
}

debug "Detecting library changes since $PREV_TAG"

# Extract previous libs.versions.toml from last tag
git show "$PREV_TAG:gradle/libs.versions.toml" > prev_libs.versions.toml || echo "" > prev_libs.versions.toml

# Function to extract a version from [versions] section
extract_version() {
  local FILE=$1
  local KEY=$2
  awk -v key="$KEY" '
    /^\[versions\]/{flag=1; next}
    /^\[/{flag=0}
    flag && $0 ~ "^"key"[ \t]*=" {
      match($0, /"([0-9]+\.[0-9]+\.[0-9]+)"/, arr)
      print arr[1]
      exit
    }' "$FILE"
}

# Previous library versions
PREV_LIB_A=$(extract_version prev_libs.versions.toml "keypleInteropJsonapiClientKmpLib" || echo "0.0.0")
PREV_LIB_B=$(extract_version prev_libs.versions.toml "keypleInteropLocalreaderNfcmobileKmpLib" || echo "0.0.0")

# Current library versions
CUR_LIB_A=$(extract_version gradle/libs.versions.toml "keypleInteropJsonapiClientKmpLib")
CUR_LIB_B=$(extract_version gradle/libs.versions.toml "keypleInteropLocalreaderNfcmobileKmpLib")

debug "Previous versions: A=$PREV_LIB_A, B=$PREV_LIB_B"
debug "Current versions : A=$CUR_LIB_A, B=$CUR_LIB_B"

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

# Determine the highest change level
if [ "$change_a" == "major" ] || [ "$change_b" == "major" ]; then
  echo "major"
elif [ "$change_a" == "minor" ] || [ "$change_b" == "minor" ]; then
  echo "minor"
elif [ "$change_a" == "patch" ] || [ "$change_b" == "patch" ]; then
  echo "patch"
else
  echo "none"
fi
