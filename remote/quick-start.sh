#!/usr/bin/env bash
set -e

. prechecks.sh
. print-env.sh

. reinit-db.sh

. go-live.sh
