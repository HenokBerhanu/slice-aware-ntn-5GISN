#!/bin/bash
echo 10 link_0 >> /etc/iproute2/rt_tables
ip rule add from 172.16.0.10 lookup link_0
ip rule add from 172.16.1.2 lookup link_0
ip route add default via 172.16.6.3 table link_0
ETH=$(ip a | grep 172.16.1.3 | awk '{print ($7)}')
iptables -t mangle -A POSTROUTING -o $ETH -p udp --dport 2152 --sport 2152 -m dscp --dscp 0x2e -j DSCP --set-dscp 0x2c
iptables -t mangle -A POSTROUTING -o $ETH -p udp --dport 2152 --sport 2152 -m dscp --dscp 0xa -j DSCP --set-dscp 0xa
ETH=$(ip a | grep 172.16.0.13 | awk '{print ($7)}')
iptables -t mangle -A POSTROUTING -o $ETH -p udp --dport 2152 --sport 2152 -m dscp --dscp 0x2e -j DSCP --set-dscp 0x2c
iptables -t mangle -A POSTROUTING -o $ETH -p udp --dport 2152 --sport 2152 -m dscp --dscp 0xa -j DSCP --set-dscp 0xa
ETH=$(ip a | grep 172.16.6.2 | awk '{print ($7)}')
iptables -t mangle -A POSTROUTING -o $ETH -p udp --dport 2152 --sport 2152 -m dscp --dscp 0x2c -j DSCP --set-dscp 0x2e
iptables -t mangle -A POSTROUTING -o $ETH -p udp --dport 2152 --sport 2152 -m dscp --dscp 0xa -j DSCP --set-dscp 0xa
ETH=$(ip a | grep 172.16.1.3 | awk '{print($7)}')
ip link add ifb0 type ifb
ip link set dev ifb0 up
tc qdisc add dev ifb0 root sfq perturb 10
tc qdisc add dev $ETH handle ffff: ingress
tc filter add dev $ETH parent ffff: u32 match u32 0 0 action mirred egress redirect dev ifb0
ETH=$(ip a | grep 172.16.0.13 | awk '{print($7)}')
ip link add ifb1 type ifb
ip link set dev ifb1 up
tc qdisc add dev ifb1 root sfq perturb 10
tc qdisc add dev $ETH handle ffff: ingress
tc filter add dev $ETH parent ffff: u32 match u32 0 0 action mirred egress redirect dev ifb1
classifier-runtime --config classifier.yaml