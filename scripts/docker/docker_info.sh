#!/usr/bin/env bash
echo_line() {
  local linechar="${1:-=}"
  local width=$(stty size | cut -d ' ' -f 2)
  local span
  local i
  for i in $(seq 1 ${width} ); do span+="${linechar}"; done
  printf "%s\n" "${span}"
}

echo_header_center() {
  local string=" ${1} "
  local linechar="${2:-=}"
  local width=$(stty size | cut -d ' ' -f 2)
  if (( $(( (${width}-${#string}) % 2  )) != 0 )); then string+="${linechar}"; fi
  local span
  local i
  for i in $(seq 1 $(( ( ${width} - ${#string} ) / 2 )) ); do span+="${linechar}"; done
  printf "%s\n" "${span}${string}${span}"
}

echo_header_left() {
  local string=" ${1} "
  local linechar="${2:-=}"
  local width=$(stty size | cut -d ' ' -f 2)
  if (( $(( (${width}-${#string}) % 2  )) != 0 )); then string+="${linechar}"; fi
  local span
  local i
  for i in $(seq 1 $(( ${width} - ${#string} - 1 )) ); do span+="${linechar}"; done
  printf "%s\n" "${linechar}${string}${span}"
}

echo_header_right() {
  local string=" ${1} "
  local linechar="${2:-=}"
  local width=$(stty size | cut -d ' ' -f 2)
  if (( $(( (${width}-${#string}) % 2  )) != 0 )); then string+="${linechar}"; fi
  local span
  local i
  for i in $(seq 1 $(( ${width} - ${#string} - 1 )) ); do span+="${linechar}"; done
  printf "%s\n" "${span}${string}${linechar}"
}

echo_header_center "HOST SYSTEM"
  hostnamectl 
  printf "           Network: %s\n" "$(hostname -I)"
  printf "     Docker engine: %s\n" "$(docker --version)"
  echo
echo_header_center 'CONTAINERS'
  docker container ls
  echo_header_center 'all' '-'
  docker container ls --all --size
  echo
echo_header_center 'IMAGES'
  docker image ls
  echo_header_center 'all' '-'
  docker image ls --all --digests
  echo
echo_header_center 'NETWORKS'
# ip address | grep 'inet ' | sort | awk '{$1=$1;print}'
  ip address | grep 'inet ' | sort | sed 's/^[[:blank:]]*//;'
  echo_header_center 'docker' '-'
  docker network ls
  echo
echo_header_center 'VOLUMES'
  docker volume ls

exit 0
