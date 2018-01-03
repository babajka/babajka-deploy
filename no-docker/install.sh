BACKEND_PATH=${1:-'tmp/babajka-backend'}
FRONTEND_PATH=${2:-'tmp/babajka-frontend'}

WORK_DIR=$(pwd)

cd $BACKEND_PATH || exit 1
echo "Installing BACKEND dependencies..."
npm install || exit 1

cd $WORK_DIR
cd $FRONTEND_PATH || exit 1
echo "Installing FRONTEND dependencies..."
npm install || exit 1
# TODO(uladbohdan): the command below must be performed by frontend postinstall script.
bash copy-static.sh || exit 1

echo "======================="
echo "INSTALLED SUCCESSFULLY."
echo "======================="

cd $WORK_DIR
