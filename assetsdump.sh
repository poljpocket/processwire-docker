#!/bin/bash

set -e

# the name or id of the web container for this composition
WEB_CONTAINER=_web_container_name_or_id_

# one way to get the above automatically
# this only works if there is only one running container with 'web' in it's name
#DB_CONTAINER=$(docker ps --filter "name=web" --format {{.ID}} --filter status=running)

# export the files
docker exec --workdir "/var/www/html/site/assets" $WEB_CONTAINER sh -c 'tar -czf files.tar.gz files'
docker cp $WEB_CONTAINER:/var/www/html/site/assets/files.tar.gz data/
docker exec --workdir "/var/www/html/site/assets" $WEB_CONTAINER sh -c 'rm -f files.tar.gz'
