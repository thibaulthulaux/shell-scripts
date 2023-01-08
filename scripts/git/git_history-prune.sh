#!/usr/bin/env sh
# shellcheck disable=SC2155
#

set -o errexit

# ------------------------------------------------------------------- Globals -
readonly PROGNAME="$(basename "$(readlink -f "${0}")")"
readonly WORKINGDIR="$(pwd)"

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

  user_confirm "Prune local and remote history ?" \
    || eexit "User interrupted"

  info "Create temporary branch 'tmp-main'"
  git checkout --orphan tmp-main

  info "Stage all files"
  git add -A

  info "Commit"
  git commit -m 'First commit'

  info "Delete branch 'main'"
  git branch -D main

  info "Rename current branch to 'main'"
  git branch -m main

  info "Force push main branch"
  git push -f origin main

  info "Done"
}

# ------------------------------------------------------------------- Runtime -
main
exit 0