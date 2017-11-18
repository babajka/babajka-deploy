The repository contains scripts to build/run/deploy Babajka project.

# Running in Production mode.

## locally without Docker

`bash run-no-docker.sh` - gets code from GitHub (`master` branches) and runs it
in one terminal.

`bash run-no-docker.sh ../babajka-backend/ ../babajka-frontend/` -
runs code from specified local directories in one terminal.

Once the script is executed with no failures, Babajka is available on port 3000.

## locally with Docker Compose

`bash run-docker-compose.sh` - gets code from GitHub (`master` branches)
and runs it.

`bash run-docker-compose.sh ../babajka-backend/ ../babajka-frontend/` -
runs code from specified local directories.

Once the script is executed with no failures, Babajka is available on
PORT_FRONTEND_EXTERNAL (specified in run.sh file).
