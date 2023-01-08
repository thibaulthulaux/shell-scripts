#!/usr/bin/env bash
#
# Install fzf.
#

echo $0: update package list
sudo apt update

echo $0: install fzf
sudo apt install -y \
    fzf

echo $0: $(fzf --version)

echo $0: done.
exit 0
