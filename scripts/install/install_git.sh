#!/usr/bin/env bash
#
# Install and configure git.
#

readonly USER_EMAIL="thibault.hulaux@gmail.com"
readonly USER_NAME="Thibault HULAUX"
readonly BRANCH_NAME="main"

echo $0: update package list
sudo apt update

echo $0: install git
sudo apt install -y \
    git \
    git-lfs

echo $0: $(git --version)

echo $0: setup globals
git config --global user.email "${USER_EMAIL}"
git config --global user.name "${USER_NAME}"
git config --global init.defaultBranch "${BRANCH_NAME}"

echo $0: done.
unset USER_EMAIL
unset USER_NAME
exit 0
