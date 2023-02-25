#!/bin/bash
ETH=$(ip a | grep 172.16.3.2 | awk '{print($7)}')
iptables -t nat -A POSTROUTING -o $ETH -j MASQUERADE
ip route add 172.16.8.0/24 via 172.16.1.3
free5gc-upfd -c upfcfg.yaml