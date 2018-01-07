#!/usr/bin/env bash
set -e

. prechecks.sh
. print-env.sh

. go_live.sh $1 $2
