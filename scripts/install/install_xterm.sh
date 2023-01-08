#!/usr/bin/env bash
#
# Install xterm.
#

echo $0: update package list
sudo apt update

echo $0: install ranger
sudo apt install -y \
    xterm

echo $0: $(xterm -v)

echo $0: done.
exit 0
