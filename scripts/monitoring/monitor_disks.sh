#!/usr/bin/env bash

echo $0: df -h
df -h
echo

echo $0: ls -la
ls -la /dev/mm*
ls -la /dev/sd*
echo

echo $0: fdisk -l
sudo fdisk -l /dev/mm*
sudo fdisk -l /dev/sd*
echo

exit 0
