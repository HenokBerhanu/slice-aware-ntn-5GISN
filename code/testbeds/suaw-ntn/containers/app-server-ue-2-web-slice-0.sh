#!/bin/bash
iperf -s -B 172.16.3.8 -p 8080 -b 3M -u -l 1400 -i 1 -f b --tos 0x28 > results/app-server-ue-2-web-slice-0_web_0_probes.txt