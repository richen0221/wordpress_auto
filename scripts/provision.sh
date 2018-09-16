#!/bin/bash
# disable the auto upgrade to aviod the apt lock situation
sudo sed -i "s/1/0/g" /etc/apt/apt.conf.d/20auto-upgrades && \
systemctl disable {snapd,snapd.socket,snapd.snap-repair.timer} && \
sudo apt update && \
sudo apt-get remove docker docker-engine docker.io -y && \
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" && \
sudo apt-get update && \
sudo apt-get install docker-ce docker-compose -y && \
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.22.0/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose && \
sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
sudo chmod +x /usr/local/bin/docker-compose && \
# sudo apt install docker.io docker-compose -y && \
sudo usermod ubuntu -aG docker && \
sudo su - ubuntu && \
cd /home/ubuntu/docker-wp-compose && \
docker-compose up -d
