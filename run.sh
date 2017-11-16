# !/bin/bash

# The script clones babajka-backend and babajka-frontend repositories
# and runs them locally with docker composition.

rm -rf tmp

BACKEND_PATH=$1
FRONTEND_PATH=$2

# This can be any available port: that's the only place where port is set.
PORT_FRONTEND_EXTERNAL="49170"
# Backend port must be syncronized with babajka-frontend configuration.
# TODO(uladbohdan): to get rid of backend port exposing: only frontend must be
# explicitly available externally.
PORT_BACKEND_EXTERNAL="49160"

if [ -z "$BACKEND_PATH" ]
then
  mkdir tmp
  cd tmp

  git clone https://github.com/babajka/babajka-backend.git || exit 1
  cp "${BABAJKA_SECRET}" "babajka-backend/secret.json" || exit 1
  BACKEND_PATH="babajka-backend"

  git clone https://github.com/babajka/babajka-frontend.git || exit 1
  FRONTEND_PATH="babajka-frontend"
elif [ -z "$FRONTEND_PATH" ]
then
  # The first parameter (for backend) is provided but the second (frontend) is missing.
  echo "Bad parameters: you must specify both backend and frontend paths. It's also an option to skip both: GitHub master versions are used then."
  exit 1
else
  mkdir tmp
  cd tmp
  # cp -r $BACKEND_PATH tmp/ || exit 1
  cp "${BABAJKA_SECRET}" "../${BACKEND_PATH}/secret.json" || exit 1
  BACKEND_PATH="../${BACKEND_PATH}"

  FRONTEND_PATH="../${FRONTEND_PATH}"
  # cp -r $FRONTEND_PATH tmp/ || exit 1
fi

# Generating tmp/docker-compose.yaml file.
cat > "docker-compose.yaml" <<- EOM
version: '3'
services:
  backend:
    build: ${BACKEND_PATH}
    ports:
      - "${PORT_BACKEND_EXTERNAL}:3000"
  frontend:
    build: ${FRONTEND_PATH}
    ports:
      - "${PORT_FRONTEND_EXTERNAL}:8080"
EOM

docker-compose up --build

# Babajka is now available on port PORT_FRONTEND_EXTERNAL.
