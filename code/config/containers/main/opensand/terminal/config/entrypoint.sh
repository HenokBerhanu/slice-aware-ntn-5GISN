#!/bin/bash
service dbus start
service avahi-daemon start
opensand_interfaces
ip route add 172.16.8.0/24 via 172.16.5.2
ip route add 172.16.0.0/24 via 172.16.100.2
ip route add 172.16.1.0/24 via 172.16.100.2
sand-daemon -f
