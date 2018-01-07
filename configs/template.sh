#!/usr/bin/env bash
set -e

# This is an example of file which may act as DEPLOY_CONFIG.

### MANDATORY VARIABLE TO SET:

export BABAJKA_BACKEND_URL=''
export DEPLOY_MODE='development'

### OPTIONAL VARIABLES TO SET:

# Only takes effect if in 'development' mode.
export REINIT_DATABASE='yes'
