#!/bin/bash
sudo pkill -f get_metrics
sudo pkill -f mtail
cd ~/swarmon_client
cd progs
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/client/swarm.mtail -O swarm.mtail
cd ..
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/client/stop_datacollector.sh -O stop_datacollector.sh
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/client/get_metrics.sh -O get_metrics.sh
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/client/update_client.sh -O update_client.sh
chmod +x run_datacollector.sh
chmod +x get_metrics.sh
chmod +x update_client.sh