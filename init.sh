#!/bin/bash

./config/hosts.sh

echo "--------------------------------------"
echo "|      Clonando repositorios...      |"
echo "--------------------------------------"

REPOSITORIES=(
  "git@github.com:mdxfy-org/mdxfy-api.git"
  "git@github.com:mdxfy-org/mdxfy-web.git"
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
