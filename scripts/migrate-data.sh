#!/usr/bin/env bash
set -e

# Script to migrate from one server to another.

# Configuration:

SOURCE_HOST=prod.wir.by
SOURCE_USER=wir-prod

DESTINATION_HOST=46.101.109.182
DESTINATION_USER=wir-prod

# Code:

SOURCE_HOME=/home/${SOURCE_USER}/
DESTINATION_HOME=/home/${DESTINATION_USER}/

# '-3' option redirects all traffic through your local machine.
# Without the option, one should put ssh keys to a source machine to be able to write to destination machine.

scp -3 ${SOURCE_USER}@${SOURCE_HOST}:${SOURCE_HOME}/sitemap.xml ${DESTINATION_USER}@${DESTINATION_HOST}:${DESTINATION_HOME}/sitemap.xml
scp -3 ${SOURCE_USER}@${SOURCE_HOST}:${SOURCE_HOME}/secret-production.json ${DESTINATION_USER}@${DESTINATION_HOST}:${DESTINATION_HOME}/secret-production.json
echo "[OK] Single files copied."

scp -3 -r  ${SOURCE_USER}@${SOURCE_HOST}:${SOURCE_HOME}/images-cache ${DESTINATION_USER}@${DESTINATION_HOST}:${DESTINATION_HOME}/
echo "[OK] Images cache copied."