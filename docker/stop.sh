#!/bin/bash

echo "--------------------------------------"
echo "|       Parando contêineres...       |"
echo "--------------------------------------"

docker stop mdxfy-nginx mdxfy-php-fpm mdxfy-postgres mdxfy-redis mdxfy-data-bucket create-bucket mdxfy-web mdxfy-portfolio mdxfy-socket
