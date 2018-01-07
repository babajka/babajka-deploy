#!/usr/bin/env bash
set -e

# This is to cause Ctrl+C kill both processes at once.
trap 'kill %1' SIGINT
# Running Backend and Frontend and prettifying outputs with prefixes.
npm run start-prod --prefix $BABAJKA_BACKEND | tee tmp/babajka_backend.log | sed -e 's/^/ BACKEND |  /' & \
npm run prod --prefix $BABAJKA_FRONTEND | tee tmp/babajka_frontend.log | sed -e 's/^/FRONTEND |  /'
