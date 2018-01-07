#!/usr/bin/env bash
set -e

echo "Installing BACKEND dependencies..."
npm install --prefix $BABAJKA_BACKEND

echo "Installing FRONTEND dependencies..."
npm install --prefix $BABAJKA_FRONTEND
# TODO(uladbohdan): the command below must be performed by frontend postinstall script.
bash "${BABAJKA_FRONTEND}/copy-static.sh"

echo "======================="
echo "INSTALLED SUCCESSFULLY."
echo "======================="
