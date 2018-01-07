#!/usr/bin/env bash
set -e

. prechecks.sh
. print-env.sh

. github-pull.sh

. install.sh

. reinit-db.sh

. go-live.sh
