#!/bin/bash
[ -z ${DEBUG_API+x} ] && DEBUG_API=$1
nodeName=$2
totalAmount=0
MIN_BZZ_UNIT=1000000000
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
  echo "Populating $DEBUG_API data..."
  peers=$(curl -s $DEBUG_API/peers | jq '.peers | length')
  if [ -z "$peers" ]
  then
        peers=0
  fi
  diskavail=$(df -P . | awk 'NR==2{print $2}')
  diskfree=$(df -P . | awk 'NR==2{print $4}')
  cheque=$(curl -s $DEBUG_API/chequebook/cheque | jq '.lastcheques | length')
  if [ -z "$cheque" ]
  then
        cheque=0
  fi
  totalBZZ=$(curl -s $DEBUG_API/chequebook/balance  | jq '.totalBalance')
  if [ -z "$totalBZZ" ]
  then
        totalBZZ=0
  fi
  availableBZZ=$(curl -s $DEBUG_API/chequebook/balance  | jq '.availableBalance')
  if [ -z "$availableBZZ" ]
  then
        availableBZZ=0
  fi
  uncashedBZZ=$(countUncashed)
  if [ -z "$uncashedBZZ" ]
  then
        uncashedBZZ=0
  fi
  json='{"name":"'"$nodeName"'","peers":'$peers',"diskavail":'$diskavail',"diskfree":'$diskfree',"cheque":'$cheque',"total_bzz":'$(($totalBZZ/$MIN_BZZ_UNIT))',"available_bzz":'$(($availableBZZ/$MIN_BZZ_UNIT))',"total_uncashed":'$(($uncashedBZZ/$MIN_BZZ_UNIT))'}'
  echo $json
}

makejson
