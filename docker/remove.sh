#!/bin/bash

echo "--------------------------------------"
echo "|      Removendo contêineres...      |"
echo "--------------------------------------"

docker remove mdxfy-nginx mdxfy-php-fpm mdxfy-postgres mdxfy-data-bucket mdxfy-web mdxfy-api
