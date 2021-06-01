#!/bin/sh

sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y
sudo wget https://raw.githubusercontent.com/doristeo/SwarmMonitoring/main/docker/docker-compose.yaml
sudo mkdir /root/swarmon/ && sudo mkdir /root/swarmon/mysql && sudo mkdir /root/swarmon/mysql/init
sudo wget https://raw.githubusercontent.com/doristeo/SwarmMonitoring/main/docker/mysql/createdb.sql -P /root/swarmon/mysql/init
sudo mkdir /root/swarmon/grafana
sudo wget https://github.com/doristeo/SwarmMonitoring/raw/main/docker/grafana/grafana.tar.gz
sudo tar -zxvf grafana.tar.gz -C /
sudo docker-compose up -d
echo "-------------------------------------------------------------------------------------------------------"
ip=$(curl -s api.infoip.io/ip)
echo "My Public IP is "$ip", remember it! It will need to be specified in the script on each node!"
echo "My Grafana http://"$ip":3000/"
echo "-------------------------------------------------------------------------------------------------------"
 
