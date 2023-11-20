#!/bin/bash

# the name or id of the database container for this composition
DB_CONTAINER=_database_container_name_or_id_

# one way to get the above automatically
# this only works if there is only one running container with 'database' in it's name
#DB_CONTAINER=$(docker ps --filter "name=database" --format {{.ID}} --filter status=running)

# export the schema
docker exec $DB_CONTAINER sh -c 'mariadb-dump --no-data -udocker -pdocker docker' > ./data/docker-dump.sql

# add the data, ignoring caches
docker exec $DB_CONTAINER sh -c 'mariadb-dump --no-create-info --ignore-table=docker.caches -udocker -pdocker docker' >> ./data/docker-dump.sql
