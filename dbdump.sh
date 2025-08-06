#!/bin/bash

set -e

# the name or id of the database container for this composition
DB_CONTAINER=$(docker compose ps -q | xargs docker inspect --format "{{.Name}}" | grep database)

# export the schema
docker exec "$DB_CONTAINER" sh -c 'mariadb-dump --no-data -udocker -pdocker docker' > ./data/database.sql

# add the data, ignoring caches
docker exec "$DB_CONTAINER" sh -c 'mariadb-dump --no-create-info --ignore-table=docker.caches -udocker -pdocker docker' >> ./data/database.sql
