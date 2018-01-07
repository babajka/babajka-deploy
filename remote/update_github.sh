BACKEND_PATH=${1:-'tmp/babajka-backend'}
FRONTEND_PATH=${2:-'tmp/babajka-frontend'}

WORK_DIR=$(pwd)

cd $BACKEND_PATH
git pull || exit 1

cd $WORK_DIR

cd $FRONTEND_PATH
git pull || exit 1

cd $WORK_DIR

bash install.sh $1 $2 || exit 1

bash start.sh $1 $2 || exit 1
