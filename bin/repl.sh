#!/bin/sh

command="${*}"
printf "Initialized REPL for [%s]\n" "$command"
printf "%s> " "$command"
read -r input
while [ "$input" != "" ];
do
    eval "$command $input"
    printf "\n%s> " "$command"
    read -r input
done
