#!/usr/bin/env bash
#
# Install ranger.
#

echo $0: update package list
sudo apt update

echo $0: install ranger
sudo apt install -y \
    ranger

echo $0: $(fzf --version)

echo $0: done.
exit 0
