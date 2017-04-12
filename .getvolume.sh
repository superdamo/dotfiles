#!/bin/bash

state=$(amixer -D pulse get Master | grep Left: | grep -o on)
sta=($state)

volume=$(amixer -D pulse get Masster | grep -o -E [[:digit:]]+%)
vol=($volume)

if [[ ${sta[1])} == "on" ]]
then
    echo "Volume: "${vol[1]}
else
    echo "Volume: Mute"
fi
