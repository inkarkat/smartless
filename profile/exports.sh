#!/bin/sh source-this-script

# Use smartless (https://github.com/inkarkat/smartless) for paging. It is a
# wrapper around less that correctly implements the --quit-if-one-screen without
# resorting to --no-init; i.e. still shows small output that fits the terminal,
# yet does not show browsed text fragments because it uses the alternate screen.
# (http://unix.stackexchange.com/questions/107315/less-quit-if-one-screen-without-no-init/107355)
export PAGER=smartless
export SMARTLESS_PAGER='less' # the pager to be used
export SMARTLESS_PAGER_ARGUMENTS='--RAW-CONTROL-CHARS' # the default arguments to the pager
export SMARTLESS_COLOR='[3;36m'
export SMARTLESS_CAPTURE_DIR="${XDG_RUNTIME_DIR:-${TMPDIR:-/tmp}/${UID:-$USER}}/smartless"
[ -d "$SMARTLESS_CAPTURE_DIR" ] || \
    mkdir -p "$SMARTLESS_CAPTURE_DIR" 2>/dev/null || \
    unset SMARTLESS_CAPTURE_DIR
