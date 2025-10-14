#!/usr/bin/env bash

# Vérifie qu'un argument a été fourni
if [ $# -ne 1 ]; then
    echo "Usage: $0 <tag>"
    exit 1
fi

TAG="$1"
CHANGELOG="CHANGELOG.md"

# Vérifie que le fichier CHANGELOG.md existe
if [ ! -f "$CHANGELOG" ]; then
    echo "Erreur : $CHANGELOG introuvable."
    exit 1
fi

# Extraction de la section correspondant au tag
# La section commence par "## [TAG]" et s'arrête à la prochaine ligne commençant par "## [" ou à la fin du fichier
SECTION=$(awk -v tag="$TAG" '
    BEGIN { found=0 }
    /^## \[.*\]/ {
        if ($0 ~ "## \\[" tag "\\]") {
            found=1
            print
            next
        } else if (found==1) {
            exit
        }
    }
    found==1 { print }
' "$CHANGELOG")

# Vérifie si le tag a été trouvé
if [ -z "$SECTION" ]; then
    echo "Erreur : le tag '$TAG' n'a pas été trouvé dans $CHANGELOG."
    exit 1
fi

# Affiche la section
echo "$SECTION"
