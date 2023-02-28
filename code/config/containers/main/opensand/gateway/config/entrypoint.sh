#!/bin/bash
service dbus start
service avahi-daemon start
opensand_interfaces
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
ip route add 172.16.8.0/24 via 172.20.0.2
ip route add 172.16.0.0/24 via 172.16.6.2
ip route add 172.16.1.0/24 via 172.16.6.2
sand-daemon -f
