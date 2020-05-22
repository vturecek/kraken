#!/bin/bash

#color1=()

liquidctl initialize all
liquidctl set logo color off
liquidctl set ring color fixed 3490c1
liquidctl set fan  speed 25 20  30 50  34 80  40 90  50 100 -v
liquidctl set pump speed 25 60  30 70  34 85  40 100 -v

while true
do
    temp=$(liquidctl status | grep -oP '(?<=Liquid temperature)\s*[0-9]+\.[0-9]*' | tr -d [:space:])

    next="$temp+10" | bc

    echo $next
   # color=$(printf "%02x" $(($RANDOM % 255)))$(printf "%02x" $(($RANDOM % 255)))$(printf "%02x" $(($RANDOM % 255)))
   # liquidctl set ring color fixed $color
    sleep 5
done