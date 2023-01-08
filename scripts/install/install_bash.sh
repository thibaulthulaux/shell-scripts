#!/usr/bin/env bash
#
# Install bash.
#

echo $0: update package list
sudo apt update

echo $0: install bash
sudo apt install -y \
    bash

echo $0: $(bash --version)

echo $0: done.
exit 0
