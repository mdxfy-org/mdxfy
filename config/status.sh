#!/bin/bash

declare -A dependencies=(
  [api]="$(pwd)/mdxfy-api"
  [web]="$(pwd)/mdxfy-web"
)

for dir in "${dependencies[@]}"; do
  if [ -d "$dir" ]; then
    echo "========================================"
    status=$(cd "$dir" && git status --porcelain)
    if [ -n "$status" ]; then
      echo "Changes in $dir:"
      echo "$status"
    else
      echo "No changes in $dir"
    fi
    echo "========================================"
  else
    echo "Directory $dir does not exist"
  fi
done
