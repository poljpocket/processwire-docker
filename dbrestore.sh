#!/bin/bash

set -e

# the name or id of the database container for this composition
DB_CONTAINER=_database_container_name_or_id_

# one way to get the above automatically
# this only works if there is only one running container with 'database' in it's name
#DB_CONTAINER=$(docker ps --filter "name=database" --format {{.ID}} --filter status=running)

docker exec -i $DB_CONTAINER sh -c 'mariadb -udocker -pdocker docker -e "DROP DATABASE docker; CREATE DATABASE docker;"'

docker exec -i $DB_CONTAINER sh -c 'mariadb -udocker -pdocker docker' < ./data/database.sql
