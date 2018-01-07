#!/usr/bin/env bash
set -e

BABAJKA_BACKEND='/babajka-backend'
BABAJKA_DEPLOY='/babajka-deploy'
BABAJKA_FRONTEND='/babajka-frontend'
BABAJKA_LOGS='/babajka-logs'
BABAJKA_ROOT='/babajka-root'

BACKEND_SECRET_CONFIG_FILENAME='babajka-backend-secret-config.json'
DB_INIT_PATH='db-init'
DEPLOY_CONFIG_FILENAME='deploy-config.sh'

# Colouring.
COLOUR_GREEN="\033[1;32m";
COLOUR_RED="\033[1;31m";
COLOUR_DEFAULT="\033[0m";
