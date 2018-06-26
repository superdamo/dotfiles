#!/bin/bash

state=$(amixer -D pulse get Master | grep Left: | grep -o on)
sta=($state)

volume=$(amixer -D pulse get Master | grep -o -E [[:digit:]]+%)
vol=($volume)

if [[ ${sta[1]} == "on" ]]
then
	echo " "${vol[1]}
else
	echo " Mute"
fi
