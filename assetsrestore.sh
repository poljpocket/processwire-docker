#!/bin/bash

set -e

# the name or id of the web container for this composition
WEB_CONTAINER=_web_container_name_or_id_

# one way to get the above automatically
# this only works if there is only one running container with 'web' in it's name
#DB_CONTAINER=$(docker ps --filter "name=web" --format {{.ID}} --filter status=running)

# import the files
docker cp data/files.tar.gz $WEB_CONTAINER:/var/www/html/site/assets/
docker exec --workdir "/var/www/html/site/assets" $WEB_CONTAINER sh -c 'rm -rf files'
docker exec --workdir "/var/www/html/site/assets" $WEB_CONTAINER sh -c 'tar -xzf files.tar.gz'
docker exec --workdir "/var/www/html/site/assets" $WEB_CONTAINER sh -c 'rm -f files.tar.gz'
