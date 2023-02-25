#!/bin/bash
ip route add 172.16.8.0/24 via 172.16.0.13
amf --config amfcfg.yaml