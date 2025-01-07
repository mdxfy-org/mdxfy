#!/bin/bash

echo "--------------------------------------"
echo "|     Instalando dependencias...     |"
echo "--------------------------------------"

declare -A dependencies=(
  ["$(pwd)/mdxfy-api"]="composer install"
  ["$(pwd)/mdxfy-web"]="npm install"
)

for dir in "${!dependencies[@]}"; do
  if [ -d "$dir" ]; then
    echo "Instalando dependências em $dir"
    (cd "$dir" && ${dependencies[$dir]})
  else
    echo "Diretório '$dir' não existe"
  fi
done
