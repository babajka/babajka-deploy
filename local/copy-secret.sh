# Run it as:
# bash copy-secret.sh [HOST]

source '../common/vars.sh'

WIR_SHARED="${HOME}/Google Drive/Wir Project Documents"
CONFIGS_DRIVE_PATH='development/configs/remote-presets/development'

HOST=$1
if [ -z $HOST ]; then
  echo 'Bad parameters.'
  exit 1
fi

echo "Connecting to host: ${HOST}"

if [ ! -d "${WIR_SHARED}/${CONFIGS_DRIVE_PATH}" ]; then
  echo "BAD PATH: ${WIR_SHARED}/${CONFIGS_DRIVE_PATH}"
  exit 1
fi

# One needs ssh key to complete the action.
scp -rp "${WIR_SHARED}/${CONFIGS_DRIVE_PATH}" root@$HOST:$BABAJKA_ROOT

printf "${COLOUR_GREEN}COPIED SUCCESSFULLY${COLOUR_DEFAULT}\n"
