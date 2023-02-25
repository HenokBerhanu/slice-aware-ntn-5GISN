#!/bin/bash
BIND_0=$1
ip route add 172.16.3.0/24 via $BIND_0
iperf -c 172.16.3.5 -B $BIND_0 -p 5060 --trip-times --tos 0xb8 -i 1 -u -l 1400 --reverse -t 30s -b 128k -f b > results/ue-1_voip_0_probes.txt &
iperf -c 172.16.3.6 -B $BIND_0 -p 8080 --trip-times --tos 0x28 -i 1 -u -l 1400 --reverse -t 30s -b 3M -f b > results/ue-1_web_0_probes.txt &