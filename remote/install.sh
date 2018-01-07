#!/usr/bin/env bash
set -e

BACKEND_PATH=${1:-'tmp/babajka-backend'}
FRONTEND_PATH=${2:-'tmp/babajka-frontend'}

WORK_DIR=$(pwd)

cd $BACKEND_PATH
echo "Installing BACKEND dependencies..."
npm install

if [ ! -z $BABAJKA_REINIT_DB_FROM_PATH ]; then
  cp -r $BABAJKA_REINIT_DB_FROM_PATH "${BACKEND_PATH}/src/db/"
  npm run init-db
  echo 'DB DROPPED AND REINITIALIZED.'
fi

cd $WORK_DIR
cd $FRONTEND_PATH
echo "Installing FRONTEND dependencies..."
npm install
# TODO(uladbohdan): the command below must be performed by frontend postinstall script.
bash copy-static.sh

echo "======================="
echo "INSTALLED SUCCESSFULLY."
echo "======================="

cd $WORK_DIR
