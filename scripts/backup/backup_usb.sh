#!/usr/bin/env bash
#
# Backup list from $HOME to usb
#

function eexit() { printf "%s\n" "${0}: Error: ${@}"; exit 1; }
# function realpath () { [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"; }

# cd "$(dirname "$(readlink -f "$0")")"; pwd

DIR=$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)

FILE="${DIR}/targets.conf"
[[ -f "${FILE}" ]] || eexit "missing ${FILE}"

VOLUME="thx-backup"
[[ -d "/media/${USER}/${VOLUME}" ]] || eexit "${VOLUME} not mounted"

SOURCE="${HOME}"
DESTINATION="/media/${USER}/${VOLUME}/${USER}"
OPTIONS=(
  --archive                 # archive mode is -rlptgoD (no -A,-X,-U,-N,-H)
  --delete-during           # receiver deletes during the transfer
# --dry-run                 # perform a trial run with no changes made
  --files-from="${FILE}"    # read list of source-file names from FILE
# --log-file="${LOG}"       # log what we're doing to the specified FILE
# --progress                # show progress during transfer
  --recursive               # recurse into directories
  --stats                   # give some file-transfer stats
  --verbose                 # increase verbosity
)

echo $0: backup ${SOURCE} to ${DESTINATION}
sudo rsync "${OPTIONS[@]}" "${SOURCE}" "${DESTINATION}"

echo $0: done.
exit 0
