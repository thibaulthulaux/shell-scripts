#!/usr/bin/env sh
#
#

set -o errexit
set -o nounset

# ------------------------------------------------------------------- Globals -
readonly AUTHOR="Thibault HULAUX"
readonly DATE="2023-01-07"
readonly VERSION="0.0.0"

readonly ARGS="${*}"
readonly PID="${$}"
readonly PROGDIR="$(cd "$(dirname "$(readlink -f "${0}")")" && pwd)"
readonly PROGNAME="$(basename "$(readlink -f "${0}")")"
readonly WORKINGDIR="$(pwd)"


# ----------------------------------------------------------------- Functions -
eexit() { printf "%s\n" "${PROGNAME}: Error: ${*}" 1>&2; exit 1; }
info() { printf "%s\n" "${PROGNAME}: ${*}"; }

helptext() {
  cat >&2 << EOF
===============================================================================
$PROGNAME($VERSION) - $DATE $AUTHOR
-------------------------------------------------------------------------------
Short description goes here.

Usage: ${PROGNAME} [--help] <command> [<args>]

Options:
    --help        Display this screen.

Commands:
    install       Create links
    uninstall     Remove links
EOF
}

usage() {
  cat >&2 << EOF
Usage: ${PROGNAME} [--help] <command> [<args>]
Commands: [install|uninstall]
EOF
}

# ---------------------------------------------------------------------- Main -
main() {
  case "${1}" in
    "1")
    # something
    ;;
    "2")
    # something else
    ;;
    "-h" | "--help" )
    helptext
    ;;
    * )
    usage
    ;;
  esac
}

# ------------------------------------------------------------------- Runtime -
main "${*}"
exit 0