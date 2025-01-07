#!/bin/bash

HOSTS_ENTRY=(
  "127.0.0.1 local.api.mdxfy.com"
  "127.0.0.1 local.console.mdxfy.com"
  "127.0.0.1 local.storage.mdxfy.com"
  "127.0.0.1 local.web.mdxfy.com"
)

for ENTRY in "${HOSTS_ENTRY[@]}"; do
  if ! grep -q "$ENTRY" /etc/hosts; then
    echo "$ENTRY" | sudo tee -a /etc/hosts > /dev/null
  fi
done
