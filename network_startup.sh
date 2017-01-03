#! /bin/bash

ip link set eth1 up &&

ip route list dev eth1 &&

ip addr add 192.168.1.143/24 dev eth1 &&

ip route add 0/0 via 192.168.1.1 dev eth1
