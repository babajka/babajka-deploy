#!/usr/bin/env bash
set -e

WORK_DIR=$(pwd)

cd $BABAJKA_BACKEND
git pull

cd $BABAJKA_FRONTEND
git pull

cd $WORK_DIR
