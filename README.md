# Simple Docker Configuraton for ProcessWire

Not for production environments!

## Building the images

Run `build.sh` to build the images.

This will install the empty site profile in `site`.

## First-time installation

Run the composition normally (see "Running ProcessWire" below)

Head to http://localhost:8080 in a browser and complete the ProcessWire installation.

Use `docker` for database name, user and password. Use `database` for database host.

## Running ProcessWire

Create and run containers for the composition with `docker compose up`

ProcessWire runs at http://localhost:8080

phpmyadmin runs at http://localhost:8081
