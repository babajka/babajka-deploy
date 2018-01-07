#!/usr/bin/env bash
set -e

echo "Installing BACKEND dependencies..."
npm install --prefix $BABAJKA_BACKEND

WORK_DIR=$(pwd)

echo "Installing FRONTEND dependencies..."
cd $BABAJKA_FRONTEND
npm install
# TODO(uladbohdan): the command below must be performed by frontend postinstall script.
bash "copy-static.sh"
cd $WORK_DIR

echo "======================="
echo "INSTALLED SUCCESSFULLY."
echo "======================="
