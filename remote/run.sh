bash prechecks.sh || exit 1

# Cloning from GitHub unless parameters are provided.
bash init.sh $1 $2 || exit 1

BACKEND_PATH=${1:-'tmp/babajka-backend'}
FRONTEND_PATH=${2:-'tmp/babajka-frontend'}

bash install.sh $1 $2 || exit 1

bash go_live.sh $1 $2 || exit 1
