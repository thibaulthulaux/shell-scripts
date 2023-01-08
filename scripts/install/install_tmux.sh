#!/usr/bin/env bash
#
# Install tmux.
#

echo $0: update package list
sudo apt update

echo $0: install ranger
sudo apt install -y \
    tmux

echo $0: $(tmux -V)

echo $0: cloning tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo $0: done.
exit 0
