#!/bin/bash
cd ~/swarmon_client
cd progs
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/client/swarm.mtail
cd ..
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/client/run_datacollector.sh
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/client/stop_datacollector.sh
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/client/get_metrics.sh
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/client/update.sh
chmod +x stop_datacollector.sh
chmod +x run_datacollector.sh
chmod +x get_metrics.sh
chmod +x update.sh