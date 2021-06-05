#!/bin/bash
#Only for Linux x86, change the mtail link if you are running on a different OS
mkdir ~/swarmon_client
cd ~/swarmon_client
mkdir logs
mkdir progs
cd progs
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/client/swarm.mtail
cd ..
wget https://github.com/google/mtail/releases/download/v3.0.0-rc45/mtail_3.0.0-rc45_Linux_x86_64.tar.gz
tar -xf mtail_3.0.0-rc45_Linux_x86_64.tar.gz
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/client/run_datacollector.sh
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/client/stop_datacollector.sh
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/client/get_metrics.sh
chmod +x stop_datacollector.sh
chmod +x run_datacollector.sh
chmod +x get_metrics.sh