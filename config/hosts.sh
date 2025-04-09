#!/bin/bash

HOSTS_ENTRY=(
  "127.0.0.1 local.mdxfy.com"
  "127.0.0.1 local.api.mdxfy.com"
)

for ENTRY in "${HOSTS_ENTRY[@]}"; do
  if ! grep -q "$ENTRY" /etc/hosts; then
    echo "$ENTRY" | sudo tee -a /etc/hosts > /dev/null
  fi
done
