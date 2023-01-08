#!/usr/bin/env bash
#
# Install gparted.
#

echo $0: update package list
sudo apt update

echo $0: install gparted
sudo apt install -y \
    gparted \
    dosfstools \
    mtools

echo $0: done.
exit 0
