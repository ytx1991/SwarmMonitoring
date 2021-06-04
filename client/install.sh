#!/bin/bash
#Only for Linux x86, change the mtail link if you are running on a different OS
mkdir ~/swarmon_client && cd ~/swarmon_client
mkdir logs
wget https://github.com/google/mtail/releases/download/v3.0.0-rc46/mtail_3.0.0-rc46_Linux_x86_64.tar.gz
tar -xf mtail_3.0.0-rc46_Linux_x86_64.tar.gz
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/client/run_datacollector.sh
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/client/get_metrics.sh
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/client/swarm.mtail
chmod +x run_datacollector.sh
chmod +x get_metrics.sh