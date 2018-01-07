#!/usr/bin/env bash
set -e

touch "${BABAJKA_LOGS}/backend.log"
touch "${BABAJKA_LOGS}/frontend.log"

# This is to cause Ctrl+C kill both processes at once.
trap 'kill %1' SIGINT
# Running Backend and Frontend and prettifying outputs with prefixes.
npm run start-prod --prefix $BABAJKA_BACKEND | tee "${BABAJKA_LOGS}/backend.log" | sed -e 's/^/ BACKEND |  /' & \
npm run prod --prefix $BABAJKA_FRONTEND | tee "${BABAJKA_LOGS}/frontend.log" | sed -e 's/^/FRONTEND |  /'
