# Simple Docker Configuraton for ProcessWire

Not for production environments!

## Configuration (.env file)

- PW_VERSION: the version of ProcessWire you want to run (has to exist as a tag in the [ProcessWire GitHub](https://github.com/processwire/processwire) repository).
- WEB_USER_ID: the user ID to use for both web and database containers. This should be your host user ID (e.g. `id -u`) to ensure read&write access on the host.

## First-time installation

Run the composition normally (see "Running ProcessWire" below)

Head to http://localhost:8080 in a browser and complete the ProcessWire installation.

Use `docker` for database name, user and password. Use `database` for database host.

## Running ProcessWire

Create and run containers for the composition with `docker compose up`

ProcessWire runs at http://localhost:8080

phpmyadmin runs at http://localhost:8081
