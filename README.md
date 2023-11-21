# Simple Docker Composition for ProcessWire

Not for production environments!

## Configuration (.env file)

- PW_VERSION: the version of ProcessWire you want to run (has to exist as a tag in
  the [ProcessWire GitHub](https://github.com/processwire/processwire) repository).
- WEB_USER_ID: the user ID to use for both web and database containers. This should be your host user ID (e.g. `id -u`)
  to ensure read&write access on the host.

You can refer to `.env-default` for a template for your `.env` file.

## First-time installation

Run the composition normally (see "Running ProcessWire" below)

Head to http://localhost:8080 in a browser and complete the ProcessWire installation.

Use `docker` for database name, user and password. Use `database` for database host.

## Running ProcessWire

Create and run containers for the composition with `docker compose up`

- ProcessWire runs at http://localhost:8080
- phpmyadmin runs at http://localhost:8081

## Handling the database for commits

In the `dbdump.sh` and `dbrestore.sh` files, set the `DB_CONTAINER` variable to the name or id of your database container.

With the database container running,
- executing the `dbdump.sh` script will dump the database into `database.sql` in the `data` folder.
- executing the `dbrestore.sh` script will restore the database from `database.sql` in the `data` folder.


## Handling the assets for commits

In the `assetsdump.sh` and `assetsrestore.sh` files, set the `WEB_CONTAINER` variable to the name or id of your web container.

With the web container running,
- executing the `assetsdump.sh` script will dump the assets into `files.tar.gz` in the `data` folder.
- executing the `assetsrestore.sh` script will restore the assets from `files.tar.gz` in the `data` folder.
