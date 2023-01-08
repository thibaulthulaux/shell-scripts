#!/usr/bin/env bash
#
# Install and configure docker.
#

echo $0: update package list
sudo apt update

echo $0: install docker
sudo apt install -y \
    docker.io \
    docker-compose

echo $0: create docker group
[[ $(grep docker /etc/group) ]] \
    || sudo groupadd docker

echo $0: add ${USER} to docker group
[[ $(groups ${USER} | grep docker) ]] \
    || sudo usermod -aG docker ${USER}

echo $0: restart docker engine
sudo systemctl restart docker

echo $0: $(docker --version)

echo $0: done.
exit 0
