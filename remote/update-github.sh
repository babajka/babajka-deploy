#!/usr/bin/env bash
set -e

. prechecks.sh
. print-env.sh

BACKEND_PATH=${1:-'tmp/babajka-backend'}
FRONTEND_PATH=${2:-'tmp/babajka-frontend'}

WORK_DIR=$(pwd)

cd $BACKEND_PATH
git pull

cd $WORK_DIR

cd $FRONTEND_PATH
git pull

cd $WORK_DIR

. install.sh $1 $2

. reinit-db.sh $1 $2

. start.sh $1 $2
