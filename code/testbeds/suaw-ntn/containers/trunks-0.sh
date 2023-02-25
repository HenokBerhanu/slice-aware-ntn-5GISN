#!/bin/bash
ip route add 172.16.0.0/24 via 172.16.6.2
ip route add 172.16.1.0/24 via 172.16.6.2
ip route add 172.16.8.0/24 via 172.16.5.2
trunks --config trunks.yaml