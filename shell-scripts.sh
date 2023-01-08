#!/usr/bin/env sh
#
#

set -o errexit
set -o nounset

# ------------------------------------------------------------------- Globals -
readonly AUTHOR="Thibault HULAUX"
readonly DATE="2023-01-07"
readonly VERSION="0.1.0"

readonly ARGS="${*}"
readonly PROGDIR="$(cd "$(dirname "$(readlink -f "${0}")")" && pwd)"
readonly PROGNAME="$(basename "$(readlink -f "${0}")")"

readonly SRC="${PROGDIR}/scripts"
readonly DEST="${HOME}/bin"
readonly SUFFIX=".sh"

# ----------------------------------------------------------------- Functions -
eexit() { printf "%s\n" "${PROGNAME}: Exit: ${*}" 1>&2; exit 1; }
info() { printf "%s\n" "${PROGNAME}: ${*}"; }

helptext() {
  cat >&2 << EOF
===============================================================================
$PROGNAME($VERSION) - $DATE $AUTHOR
-------------------------------------------------------------------------------
Install / uninstall scripts symlinks (*${SUFFIX})

Source: ${SRC}
Destination: ${DEST}

Usage: ${PROGNAME} [-i] [--install] [-u] [--uninstall] [-h] [--help]

Options:
  -i, --install       Install links
  -u, --uninstall     Uninstall links
  -h, --help          Display this screen.

EOF
}

usage() {
  cat >&2 << EOF
Usage: ${PROGNAME} [-i] [--install] [-u] [--uninstall] [-h] [--help]
EOF
}

create_links() {
  [ -d "${DEST}" ] || eexit "${DEST} doesn't exist."
  files=$(find "${SRC}" -name "*${SUFFIX}")
  for file in ${files}; do
    chmod a+x "${file}"
    target="${DEST}/$(basename -s ".sh" "${file}")"
    if [ -e "${target}" ]; then
      info "${target} already exists."
    else
      info "Create ${target}"
      ln -s "${file}" "${target}"
    fi
  done
}

remove_links() {
  files=$(find "${SRC}" -name "*${SUFFIX}")
  for file in ${files}; do
    chmod a-x "${file}"
    target="${DEST}/$(basename -s ".sh" "${file}")"
    if [ -e "${target}" ] && [ -h "${target}" ]; then
      info "Remove ${target}"
      rm "${target}"
    fi
  done
}

# ---------------------------------------------------------------------- Main -
main() {
  case "${1}" in
    "-i" | "--install" )
    create_links
    ;;
    "-u" | "--uninstall" )
    remove_links
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
main "${ARGS}"
exit 0
