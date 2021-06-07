#!/bin/sh

mkdir ~/swarmon_server
sudo mkdir /root/swarmon/prometheus
sudo mkdir /root/swarmon/grafana

cd ~/swarmon_server
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/server/grafana/grafana.db
sudo cp grafana.db /root/swarmon/grafana/grafana.db
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/server/docker-compose.yaml
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/server/prometheus.yml
sudo cp prometheus.yml /root/swarmon/prometheus
sudo chmod -R 777 /root/swarmon/grafana