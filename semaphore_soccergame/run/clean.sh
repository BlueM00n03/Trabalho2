#!/bin/bash

rm -f error*
rm -f core

killall player referee goalie
sleep 1
killall -9 player referee goalie

#unsafe
key=$(ipcs | grep " 120 " | grep -v "0000000" | cut -d\  -f1)

if [[ -z $key ]]
then
   echo Did not find soccergame IPC resources
   exit 1
fi

ipcrm -S $key
ipcrm -M $key

