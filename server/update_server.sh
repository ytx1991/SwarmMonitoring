#!/bin/bash
cd ~/swarmon_server
rm grafana.db
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/server/grafana/grafana.db
sudo cp grafana.db /root/swarmon/grafana/grafana.db
sudo chmod -R 777 /root/swarmon/grafana