#!/usr/bin/env bash
set -e

echo '========================================================================='
echo 'Environment summary:'
echo "BABAJKA_SECRET=${BABAJKA_SECRET}"
echo "DEPLOY_MODE=${DEPLOY_MODE}"
echo "REINIT_DATABASE=${REINIT_DATABASE}"
echo "BABAJKA_REINIT_DB_FROM_PATH=${BABAJKA_REINIT_DB_FROM_PATH}"
echo ""
echo "Code location:"
echo "BABAJKA_BACKEND=${BABAJKA_BACKEND}"
echo "BABAJKA_DEPLOY=${BABAJKA_DEPLOY}"
echo "BABAJKA_FRONTEND=${BABAJKA_FRONTEND}"
echo "BABAJKA_LOGS=${BABAJKA_LOGS}"
echo "BABAJKA_ROOT=${BABAJKA_ROOT}"
echo '========================================================================='
