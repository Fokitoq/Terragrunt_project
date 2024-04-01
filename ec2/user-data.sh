#!/bin/bash
apt-get update
apt-get install -y cloud-utils apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update -y
apt-get install -y docker-ce
usermod -aG docker ubuntu
systemctl start docker
systemctl enable docker
docker run -p 3000:3000 ghcr.io/benc-uk/nodejs-demoapp:latest