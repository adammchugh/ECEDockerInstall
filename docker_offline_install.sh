#!/bin/bash
sudo apt update -y
sudo apt upgrade -y

sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt-get install -y docker-ce docker-ce-cli containerd.io

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo 'vm.max_map_count=262144' | sudo tee -a /etc/sysctl.conf
sudo sysctl -w vm.max_map_count=262144

sudo usermod -aG docker $USER

docker load < FILE_PATH/ece.2.8.1.tar
docker load < FILE_PATH/es.7.11.1-0.tar
docker load < FILE_PATH/kibana.7.11.1-0.tar
docker load < FILE_PATH/apm.7.11.1-0.tar
docker load < FILE_PATH/enterprise-search.7.11.1.tar
docker load < FILE_PATH/es.6.8.14-0.tar
docker load < FILE_PATH/kibana.6.8.14-0.tar
