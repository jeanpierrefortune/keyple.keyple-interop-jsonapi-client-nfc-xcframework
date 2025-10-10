#!/bin/bash
set -e

PREV_VERSION=$1
echo "🔍 Detecting library changes since $PREV_VERSION..."

# Download version-info.json of the latest release
curl -sL "https://raw.githubusercontent.com/jeanpierrefortune/keyple.keyple-interop-jsonapi-client-nfc-xcframework/v${PREV_VERSION}/version-info.json" -o prev.json || echo "{}" > prev.json

# Previous versions
PREV_LIB_A=$(jq -r '.keypleInteropJsonapiClientKmpLib // "0.0.0"' prev.json)
PREV_LIB_B=$(jq -r '.keypleInteropLocalreaderNfcmobileKmpLib // "0.0.0"' prev.json)

# Current versions
CUR_LIB_A=$(grep 'keypleInteropJsonapiClientKmpLib' gradle/libs.versions.toml | sed 's/.*= "\(.*\)"/\1/')
CUR_LIB_B=$(grep 'keypleInteropLocalreaderNfcmobileKmpLib' gradle/libs.versions.toml | sed 's/.*= "\(.*\)"/\1/')

echo "Previous: A=$PREV_LIB_A, B=$PREV_LIB_B"
echo "Current : A=$CUR_LIB_A, B=$CUR_LIB_B"

# Function to determine the level of change between two versions
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

# Determining the strongest overall change
if [ "$change_a" == "major" ] || [ "$change_b" == "major" ]; then
  echo "major"
elif [ "$change_a" == "minor" ] || [ "$change_b" == "minor" ]; then
  echo "minor"
elif [ "$change_a" == "patch" ] || [ "$change_b" == "patch" ]; then
  echo "patch"
else
  echo "none"
fi
