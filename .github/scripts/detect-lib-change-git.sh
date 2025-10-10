#!/usr/bin/env bash
set -e

PREV_TAG="$1"

echo "[DEBUG] Detecting library changes since ${PREV_TAG}"

# Function to extract the version of a library from libs.versions.toml
get_version() {
    local lib_name="$1"
    sed -n "s/.*${lib_name}.*\"\([0-9]\+\.[0-9]\+\.[0-9]\+\)\".*/\1/p" "${GITHUB_WORKSPACE}/gradle/libs.versions.toml"
}

# Get previous versions
PREV_VERSION_A=$(get_version "keypleInteropJsonapiClientKmpLib")
PREV_VERSION_B=$(get_version "keypleInteropLocalreaderNfcmobileKmpLib")

echo "[DEBUG] Previous versions: A=${PREV_VERSION_A}, B=${PREV_VERSION_B}"

# Get current versions (from main branch or updated files)
CUR_VERSION_A=$(get_version "keypleInteropJsonapiClientKmpLib")
CUR_VERSION_B=$(get_version "keypleInteropLocalreaderNfcmobileKmpLib")

echo "[DEBUG] Current versions : A=${CUR_VERSION_A}, B=${CUR_VERSION_B}"

# Determine change level
if [ "$CUR_VERSION_A" != "$PREV_VERSION_A" ] || [ "$CUR_VERSION_B" != "$PREV_VERSION_B" ]; then
    # Set bump type: major/minor/patch depending on your logic
    CHANGE_LEVEL="patch"
else
    echo "No library change detected, bumping patch version by default."
    CHANGE_LEVEL="none"
fi

echo "$CHANGE_LEVEL"
