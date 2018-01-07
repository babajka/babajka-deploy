#!/usr/bin/env bash
set -e

# The script checks if the system is ready to perform the rest of the actions.

source ../common/vars.sh

fail_with_message()
{
  printf "PRECHECKS ${COLOUR_RED}FAILED${COLOUR_DEFAULT}: $1\n"
}

cat << EOF
===============================================================================
Running prechecks normally means you're about to reload the whole system.
Good luck with it!
===============================================================================
EOF

# TODO(uladbohdan): to check if the software is installed: git, npm, node, tmux, ...

# TODO(uladbohdan): to check 80 -> 3000 port forwarding enabled.

if [ -z $BABAJKA_ROOT ]; then
  fail_with_message '$BABAJKA_ROOT must be set and contain a set of necessary configs'
  exit 1
fi

# BABAJKA_ROOT (files copied to machine from secret sources)
# -- BACKEND_SECRET_CONFIG
# -- DEPLOY_CONFIG
# -- DB_INIT_PATH

export BABAJKA_SECRET="${BABAJKA_ROOT}/${BACKEND_SECRET_CONFIG_FILENAME}"
if [ ! -f $BABAJKA_SECRET ]; then
  fail_with_message 'Backend Secret Config is absent.'
  exit 1
fi

if [ ! -f "${BABAJKA_ROOT}/${DEPLOY_CONFIG_FILENAME}" ]; then
  fail_with_message 'Deployment configuration must be provided. Prechecks FAILED.'
  exit 1
fi

source "${BABAJKA_ROOT}/${DEPLOY_CONFIG_FILENAME}"
# Variables that must be set in DEPLOY_CONFIG. Check out configs/template.sh
if [ -z $BABAJKA_BACKEND_URL ]; then
  fail_with_message 'BABAJKA_BACKEND_URL is not set. Prechecks FAILED.'
  exit 1
fi
if [[ ! "$DEPLOY_MODE" =~ ^(development|production)$ ]]; then
  fail_with_message "$DEPLOY_MODE is not set properly"
  exit 1
fi
if [ $DEPLOY_MODE == 'production' ] && [ ! -z $REINIT_DATABASE ]; then
  fail_with_message 'Forbidden to reinit DB in production.'
  exit 1
fi
if [ $DEPLOY_MODE == 'development' ] && [ $REINIT_DATABASE == 'yes' ]; then
  if [ -d "${BABAJKA_ROOT}/$DB_INIT_PATH" ]; then
    # All conditions for DB reinit satisfied.
    export BABAJKA_REINIT_DB_FROM_PATH="${BABAJKA_ROOT}/${DB_INIT_PATH}/"
  else
    fail_with_message 'Reinit requested but data was not provided'
    exit 1
  fi
fi

printf "ALL PRECHECKS ${COLOUR_GREEN}PASSED${COLOUR_DEFAULT}\n"
