#!/bin/bash
# disable the auto upgrade to aviod the apt lock situation
sudo sed -i "s/1/0/g" /etc/apt/apt.conf.d/20auto-upgrades && \
systemctl disable {snapd,snapd.socket,snapd.snap-repair.timer} && \
sudo apt update && \
sudo apt install docker.io docker-compose -y && \
sudo usermod ubuntu -aG docker && \
sudo su - ubuntu && \
cd /home/ubuntu/docker-wp-compose && \
docker-compose up -d
