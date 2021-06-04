#!/bin/bash
#One node per line, $1 = Remote Grafana host, $2 = node name, $3 = node debug api
pkill -f send.sh*
pkill -f mtail*
#Add your nodes debug api here
nodes=(127.0.0.1:1635 127.0.0.1:1735)
names=(bee1 bee2)


total=${#nodes[*]}
for (( i=0; i<=$(( $total -1 )); i++ ))
do
    nohup watch -n 10 "~/swarmon_client/get_metrics.sh ${nodes[$i]} ${names[$i]} > ~/swarmon_client/logs/${names[$i]}.log" &
done

nohup ~/swarmon_client/mtail --progs ~/swarmon_client --logs ~/swarmon_client/logs/*.log --poll_interval 10000ms &