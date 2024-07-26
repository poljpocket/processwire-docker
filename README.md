# Docker Composition for ProcessWire

Important: this repo does not apply any security measures. ___It is not meant for production environments!___

## Configuration (.env file)

- ProcessWire version: Use the `image` line in `docker-compose.yml` to specify the version to use. Refer to https://hub.docker.com/r/poljpocket/processwire for available tags.
- Web user ID: To allow files be edited locally and also altered by ProcessWire, you need to specify the `WEB_USER_ID` environment variable. You can get your local users' ID by running `id -u` in a terminal.

## First-time installation

Note: You can pre-populate the `site` folder with a site profile of your choice. If you don't, the default site profile will be installed automatically.

Run the composition normally (see "Running ProcessWire" below).

Head to http://localhost:8080 in a browser and complete the ProcessWire installation.

Use `docker` for database name, user and password. Use `database` for database host.

## Running ProcessWire

Create and run containers for the composition with `docker compose up -d`.

- ProcessWire runs at http://localhost:8080
- phpmyadmin runs at http://localhost:8081

## Handling the database for commits

In the `dbdump.sh` and `dbrestore.sh` files, set the `DB_CONTAINER` variable to the name or id of your database container.

With the database container running,
- executing the `dbdump.sh` script will dump the database into `database.sql` in the `data` folder.
- executing the `dbrestore.sh` script will restore the database from `database.sql` in the `data` folder.

## Large files

Consider using git LFS for the `/site/assets/files` folder where all the uploads are located.
