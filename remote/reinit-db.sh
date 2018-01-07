#!/usr/bin/env bash
set -e

BACKEND_PATH=${1:-'tmp/babajka-backend'}
FRONTEND_PATH=${2:-'tmp/babajka-frontend'}

if [ ! -z $BABAJKA_REINIT_DB_FROM_PATH ]; then
  WORK_DIR=$(pwd)
  cp -r "${BABAJKA_REINIT_DB_FROM_PATH}." "${BACKEND_PATH}/src/db/"
  cd $BACKEND_PATH
  npm run init-db
  echo 'DB DROPPED AND REINITIALIZED.'
  cd $WORK_DIR
fi
