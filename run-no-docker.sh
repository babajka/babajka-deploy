# !/bin/bash

rm -rf tmp

mkdir tmp

BACKEND_PATH=$1
FRONTEND_PATH=$2

WORK_DIR=$(pwd)

if [ -z "$BACKEND_PATH" ]
then
  cd tmp

  git clone https://github.com/babajka/babajka-backend.git || exit 1
  BACKEND_PATH="tmp/babajka-backend"

  git clone https://github.com/babajka/babajka-frontend.git || exit 1
  FRONTEND_PATH="tmp/babajka-frontend"

  cd $WORK_DIR
elif [ -z "$FRONTEND_PATH" ]
then
  # The first parameter (for backend) is provided but the second (frontend) is missing.
  echo "Bad parameters: you must specify both backend and frontend paths. It's also an option to skip both: GitHub master versions are used then."
  rm -rf tmp
  exit 1
fi

cd $BACKEND_PATH || exit 1
echo "Installing BACKEND dependencies..."
npm install || exit 1

cd $WORK_DIR
cd $FRONTEND_PATH || exit 1
echo "Installing FRONTEND dependencies..."
npm install || exit 1
bash copy-static.sh || exit 1

echo "======================="
echo "INSTALLED SUCCESSFULLY."
echo "======================="

cd $WORK_DIR

# This is to cause Ctrl+C kill both processes at once.
trap 'kill %1' SIGINT
# Running Backend and Frontend and prettifying outputs with prefixes.
npm run start-prod --prefix $BACKEND_PATH | tee tmp/babajka_backend.log | sed -e 's/^/ BACKEND |  /' & \
npm run prod --prefix $FRONTEND_PATH | tee tmp/babajka_frontend.log | sed -e 's/^/FRONTEND |  /'
