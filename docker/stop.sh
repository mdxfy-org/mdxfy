#!/bin/bash

echo "--------------------------------------"
echo "|       Parando contêineres...       |"
echo "--------------------------------------"

docker remove mdxfy-nginx mdxfy-php-fpm mdxfy-postgres mdxfy-data-bucket mdxfy-web mdxfy-api
