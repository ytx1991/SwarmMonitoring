#!/bin/sh

mkdir ~/swarmon
sudo mkdir /root/swarmon/prometheus
cd ~/swarmon
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/server/grafana/dashboard.json
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/server/docker-compose.yaml
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/server/prometheus.yml
sudo cp prometheus.yml /root/swarmon/prometheus
