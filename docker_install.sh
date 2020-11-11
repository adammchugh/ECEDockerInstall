#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
sudo apt-get install curl apt-transport-https ca-certificates software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update -y
apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo systemctl status docker
sudo docker run hello-world
sudo usermod -aG docker $USER
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo 'vm.max_map_count=262144' | sudo tee -a /etc/sysctl.conf
sudo sysctl -w vm.max_map_count=262144
sudo mkdir /mnt/data
sudo chown 1000:1000 /mnt/data/

echo "bash <(curl -fsSL https://download.elastic.co/cloud/elastic-cloud-enterprise.sh) install --coordinator-host <hostname of first host> --roles-token 'TOKEN'"
