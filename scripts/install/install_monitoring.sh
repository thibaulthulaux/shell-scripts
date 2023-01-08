#!/usr/bin/env bash
#
# Install monitoring tools.
#

echo $0: update package list
sudo apt update

echo $0: install monitoring tools
sudo apt install -y \
    htop \
    iotop \
    ncdu \
    nethogs

echo $0: done.
exit 0
