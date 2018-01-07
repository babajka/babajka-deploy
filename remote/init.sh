WORK_DIR=$(pwd)

if [ -z "$BACKEND_PATH" ]
then
  # Using master branched from GitHub.
  rm -rf tmp
  mkdir tmp
  cd tmp

  git clone https://github.com/babajka/babajka-backend.git || exit 1

  git clone https://github.com/babajka/babajka-frontend.git || exit 1

  cd $WORK_DIR
elif [ -z "$FRONTEND_PATH" ]
then
  # The first parameter (for backend) is provided but the second (frontend) is missing.
  echo "Bad parameters: you must specify both backend and frontend paths. It's also an option to skip both: GitHub master versions are used then."
  rm -rf tmp
  exit 1
fi
