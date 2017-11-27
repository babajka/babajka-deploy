BACKEND_PATH="babajka-backend"
FRONTEND_PATH="babajka-frontend"

# This is to cause Ctrl+C kill all processes at once.
trap 'kill %1' SIGINT
# Running Backend and Frontend and prettifying outputs with prefixes.
npm run start-prod --prefix $BACKEND_PATH | tee logs/babajka_backend.log | sed -e 's/^/ BACKEND |  /' & \
npm run prod --prefix $FRONTEND_PATH | tee logs/babajka_frontend.log | sed -e 's/^/FRONTEND |  /'
