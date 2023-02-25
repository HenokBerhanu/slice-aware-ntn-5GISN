#!/bin/bash
gtp-dscp --ipv4 172.16.8.2 --offset 16
ip route add 172.16.0.0/24 via 172.16.8.3
ip route add 172.16.1.0/24 via 172.16.8.3
sleep 6
nr-gnb --config gnb.yaml