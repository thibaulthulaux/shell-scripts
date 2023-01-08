#!/usr/bin/env sh
#
#

set -o errexit
set -o nounset

# ------------------------------------------------------------------- Globals -
readonly PROGNAME="$(basename "$(readlink -f "${0}")")"
readonly WORKINGDIR="$(pwd)"

readonly GITUSERID="thibaulthulaux"
readonly GITREPOID="$(basename "${WORKINGDIR}").git"

# ----------------------------------------------------------------- Functions -
eexit() { printf "%s\n" "${PROGNAME}: Exit: ${*}" 1>&2; exit 1; }
info() { printf "%s\n" "${PROGNAME}: ${*}" >&2; }

user_confirm() {
  printf "%s" "${PROGNAME}: ${*} (y/n): " >&2; read -r reply
  case "${reply}" in
    y|Y ) return 0;;
    * ) return 1;;
  esac
}

# create_remote_repository() {
# curl -u "${GITUSERID}" "https://api.github.com/user/repos" \
#     -d "{\"name\": \"${WORKINGDIR##*/}\", \"description\": \"${2}\", \"private\": true, \"has_issues\": true, \"has_downloads\": true, \"has_wiki\": false}"
# }

# ---------------------------------------------------------------------- Main -
main() {
  [ -d "${WORKINGDIR}/.git" ] \
    || eexit "Not a git repository, run 'git init' first"

  user_confirm "Setup remote 'all' ?" \
    || eexit "User interrupted"

  info "Add github as remote 'all'"
  git remote add \
    all "git@github.com:${GITUSERID}/${GITREPOID}"

  info "Re-register github as 'all' push URL"
  git remote set-url --add --push \
    all "git@github.com:${GITUSERID}/${GITREPOID}"

  info "Add gitlab as 'all' push URL"
  git remote set-url --add --push \
    all "git@gitlab.com:${GITUSERID}/${GITREPOID}"
    
  info "Done"
}

# ------------------------------------------------------------------- Runtime -
main
exit 0