#!/bin/bash
#One node per line, $1 = Remote Grafana host, $2 = node name, $3 = node debug api
nohup watch -n 10 "./send.sh http://localhost:8080 bee1 http://localhost:1635" &
nohup watch -n 10 "./send.sh http://localhost:8080 bee2 http://localhost:1735" &