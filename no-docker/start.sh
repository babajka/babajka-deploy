BACKEND_PATH=${1:-'tmp/babajka-backend'}
FRONTEND_PATH=${2:-'tmp/babajka-frontend'}

# This is to cause Ctrl+C kill both processes at once.
trap 'kill %1' SIGINT
# Running Backend and Frontend and prettifying outputs with prefixes.
npm run start-prod --prefix $BACKEND_PATH | tee tmp/babajka_backend.log | sed -e 's/^/ BACKEND |  /' & \
npm run prod --prefix $FRONTEND_PATH | tee tmp/babajka_frontend.log | sed -e 's/^/FRONTEND |  /'
