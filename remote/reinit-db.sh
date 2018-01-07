#!/usr/bin/env bash
set -e

if [ ! -z $BABAJKA_REINIT_DB_FROM_PATH ]; then
  cp -r "${BABAJKA_REINIT_DB_FROM_PATH}." "${BABAJKA_BACKEND}/src/db/"
  npm run init-db --prefix $BABAJKA_BACKEND
  echo 'DB DROPPED AND REINITIALIZED.'
fi
