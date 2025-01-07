#!/bin/bash

declare -A dependencies=(
  [api]="$(pwd)/mdxfy-api"
  [web]="$(pwd)/mdxfy-web"
)

for dir in "${dependencies[@]}"; do
  if [ -d "$dir" ]; then
    echo "Updating $dir"
    (cd "$dir" && git pull)
  else
    echo "Directory $dir does not exist"
  fi
done
