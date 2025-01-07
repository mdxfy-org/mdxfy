#!/bin/bash

echo "--------------------------------------"
echo "|      Removendo contêineres...      |"
echo "--------------------------------------"

docker remove mdxfy-nginx mdxfy-php-fpm mdxfy-postgres mdxfy-redis mdxfy-data-bucket create-bucket mdxfy-web mdxfy-portfolio mdxfy-socket
