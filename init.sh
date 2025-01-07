#!/bin/bash

./config/hosts.sh

echo "--------------------------------------"
echo "|      Clonando repositorios...      |"
echo "--------------------------------------"

REPOSITORIES=(
  "git@github.com:iloElias/mdxfy-api.git"
  "git@github.com:iloElias/mdxfy-web.git"
)

for REPO in "${REPOSITORIES[@]}"; do
  REPO_NAME=$(basename "$REPO" .git)
  if [ -d "$REPO_NAME" ]; then
    echo "O repositório $REPO_NAME já existe. Pulando..."
  else
    git clone "$REPO"
  fi
done

./config/dependencies.sh
