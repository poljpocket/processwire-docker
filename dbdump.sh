#!/bin/bash

# the name of the database container for this composition
DB_CONTAINER_NAME=

docker exec $DB_CONTAINER_NAME sh -c 'mariadb-dump -udocker -pdocker docker' > ./data/docker-dump.sql
