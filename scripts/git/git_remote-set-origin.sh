#!/usr/bin/env sh
# shellcheck disable=SC2155
#

set -o errexit

# ------------------------------------------------------------------- Globals -
readonly PROGNAME="$(basename "$(readlink -f "${0}")")"
readonly WORKINGDIR="$(pwd)"

readonly GITUSERID="thibaulthulaux"
readonly GITREPOID="$(basename "${WORKINGDIR}").git"

# ----------------------------------------------------------------- Functions -
eexit() { printf "%s\n" "${PROGNAME}: Exit: ${*}" 1>&2; exit 1; }
info() { printf "%s\n" "${PROGNAME}: ${*}" >&1; }

user_confirm() {
  printf "%s" "${PROGNAME}: ${*} (y/n): " >&1; read -r reply
  case "${reply}" in
    y|Y ) return 0;;
    * ) return 1;;
  esac
}

# ---------------------------------------------------------------------- Main -
main() {
  [ -d "${WORKINGDIR}/.git" ] \
    || eexit "Not a git repository, run 'git init' first"

  user_confirm "Setup remote 'origin' ?" \
    || eexit "User interrupted"

  info "Add github as remote 'origin'"
  git remote add \
    origin "git@github.com:${GITUSERID}/${GITREPOID}"

  info "Re-register github as 'origin' push URL"
  git remote set-url --add --push \
    origin "git@github.com:${GITUSERID}/${GITREPOID}"

  info "Add gitlab as 'origin' push URL"
  git remote set-url --add --push \
    origin "git@gitlab.com:${GITUSERID}/${GITREPOID}"

  info "Done"
}

# ------------------------------------------------------------------- Runtime -
main
exit 0