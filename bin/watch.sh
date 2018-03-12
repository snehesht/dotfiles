#!/bin/bash

INTERVAL=$1 # in secs
COMMAND="${@:2:$#}"

eval $COMMAND

while [[ $INTERVAL -ne 0 ]]; do
    #echo -e "\033c"
    tput reset
    bash -c $COMMAND
    sleep $INTERVAL
done
