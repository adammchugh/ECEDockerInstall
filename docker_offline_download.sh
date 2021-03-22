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

docker pull docker.elastic.co/cloud-enterprise/elastic-cloud-enterprise:2.8.1
docker pull docker.elastic.co/cloud-assets/elasticsearch:7.11.1-0
docker pull docker.elastic.co/cloud-assets/kibana:7.11.1-0
docker pull docker.elastic.co/cloud-assets/apm:7.11.1-0
docker pull docker.elastic.co/enterprise-search/enterprise-search:7.11.1
docker pull docker.elastic.co/cloud-assets/elasticsearch:6.8.14-0
docker pull docker.elastic.co/cloud-assets/kibana:6.8.14-0

docker save -o ece.2.8.1.tar docker.elastic.co/cloud-enterprise/elastic-cloud-enterprise:2.8.1
docker save -o es.7.11.1-0.tar docker.elastic.co/cloud-assets/elasticsearch:7.11.1-0
docker save -o kibana.7.11.1-0.tar docker.elastic.co/cloud-assets/kibana:7.11.1-0
docker save -o apm.7.11.1-0.tar docker.elastic.co/cloud-assets/apm:7.11.1-0
docker save -o enterprise-search.7.11.1.tar docker.elastic.co/enterprise-search/enterprise-search:7.11.1
docker save -o es.6.8.14-0.tar docker.elastic.co/cloud-assets/elasticsearch:6.8.14-0
docker save -o kibana.6.8.14-0.tar docker.elastic.co/cloud-assets/kibana:6.8.14-0

curl -L -O https://download.elastic.co/cloud/elastic-cloud-enterprise.sh
