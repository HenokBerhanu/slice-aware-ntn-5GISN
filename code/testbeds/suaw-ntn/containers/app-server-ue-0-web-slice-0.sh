#!/bin/bash
iperf -s -B 172.16.3.4 -p 8080 -b 3M -u -l 1400 -i 1 -f b --tos 0x28 > results/app-server-ue-0-web-slice-0_web_0_probes.txt