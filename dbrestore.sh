#!/bin/bash

set -e

DB_CONTAINER=$(docker compose ps -q | xargs docker inspect --format {{.Name}} | grep database)

# empty the database first
docker exec -i $DB_CONTAINER sh -c 'mariadb -udocker -pdocker docker -e "DROP DATABASE docker; CREATE DATABASE docker;"'

# import the data
docker exec -i $DB_CONTAINER sh -c 'mariadb -udocker -pdocker docker' < ./data/database.sql
