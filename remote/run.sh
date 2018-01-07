#!/usr/bin/env bash
set -e

. prechecks.sh
. print-env.sh

# Cloning from GitHub unless parameters are provided.
. init.sh $1 $2

BACKEND_PATH=${1:-'tmp/babajka-backend'}
FRONTEND_PATH=${2:-'tmp/babajka-frontend'}

. install.sh $1 $2

. reinit-db.sh $1 $2

. go_live.sh $1 $2
