#!/bin/bash
[ -z ${DEBUG_API+x} ] && DEBUG_API=$3
totalAmount=0
function getPeers(){
      	curl -s "$DEBUG_API/chequebook/cheque" | jq -r '.lastcheques | .[].peer'
}

function getCumulativePayout() {
  local peer=$1
  local cumulativePayout=$(curl -s "$DEBUG_API/chequebook/cheque/$peer" | jq '.lastreceived.payout')
  if [ $cumulativePayout == null ]
  then
    echo 0
  else
    echo $cumulativePayout
  fi
}

function getLastCashedPayout() {
  local peer=$1
  local cashout=$(curl -s "$DEBUG_API/chequebook/cashout/$peer" | jq '.cumulativePayout')
  if [ $cashout == null ]
  then
    echo 0
  else
    echo $cashout
  fi
}

function getUncashedAmount() {
  local peer=$1
  local cumulativePayout=$(getCumulativePayout $peer)
  if [ $cumulativePayout == 0 ]
  then
    echo 0
    return
  fi

  cashedPayout=$(getLastCashedPayout $peer)
  let uncashedAmount=$cumulativePayout-$cashedPayout
  echo $uncashedAmount
}

function countUncashed() {
  for peer in $(getPeers)
  do
    totalAmount=$((totalAmount + $(getUncashedAmount $peer)))
  done
  echo $totalAmount
}

function makejson(){
  name=$2
  echo "Populating $2 data on $3"
  peers=$(curl -s $DEBUG_API/peers | jq '.peers | length')
  diskavail=$(df -P . | awk 'NR==2{print $2}')
  diskfree=$(df -P . | awk 'NR==2{print $4}')
  cheque=$(curl -s $DEBUG_API/chequebook/cheque | jq '.lastcheques | length')
  totalBZZ=$(curl -s $DEBUG_API/chequebook/balance  | jq '.totalBalance')
  availableBZZ=$(curl -s $DEBUG_API/chequebook/balance  | jq '.availableBalance')
  json='{"name":"'"$name"'","peers":'$peers',"diskavail":'$diskavail',"diskfree":'$diskfree',"cheque":'$cheque',"totalBZZ":'$totalBZZ',"availableBZZ":'$availableBZZ',"totalUncashed":'$(countUncashed)'}'
  echo $json
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
