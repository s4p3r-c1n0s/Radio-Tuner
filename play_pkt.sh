#!/bin/bash
array=($(find ~ -maxdepth 1 -name "*.mp3" -printf "%f\n" |   gawk -F"." '{ print $1 }'  | sort -g ))
timezone=$(date --date="now + 299 min" +"%s")
for index in ${!array[*]}
do
    if [ ${array[$index]} -gt $timezone ]
        then
        echo "/home/ubuntu/"${array[$index]}".mp3"
        break
    fi
done
