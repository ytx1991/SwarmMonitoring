#!/bin/bash

function makejson(){
  name=$2
  echo "Populating $2 data on $3"
  peers=$(curl -s $3/peers | jq '.peers | length')
  diskavail=$(df -P . | awk 'NR==2{print $2}')
  diskfree=$(df -P . | awk 'NR==2{print $4}')
  cheque=$(curl -s $3/chequebook/cheque | jq '.lastcheques | length')
  json='{"name":"'"$name"'","peers":'$peers',"diskavail":'$diskavail',"diskfree":'$diskfree',"cheque":'$cheque'}'
}

if [ $# -eq 0 ]
  then
    echo "I need URL of your Rest API!"
    exit 1
fi
#1 = Granaga host, 2 = node name, 3 = node debug api
makejson $1 $2 $3
curl -i \
-H "Accept: application/json" \
-H "Content-Type:application/json" \
-X POST --data ""$json"" ""$1""
