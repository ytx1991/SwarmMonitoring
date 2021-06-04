#!/bin/sh

mkdir ~/swarmon && mkdir ~/swarmon/prometheus && cd ~/swarmon
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/server/grafana/dashboard.json
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/server/docker-compose.yaml
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/server/prometheus.yml
cp prometheus.yml ~/swarmon/prometheus
