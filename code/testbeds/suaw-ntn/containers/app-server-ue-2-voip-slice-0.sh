#!/bin/bash
iperf -s -B 172.16.3.7 -p 5060 -u -l 1400 -i 1 -f b --tos 0xb8 > results/app-server-ue-2-voip-slice-0_voip_0_probes.txt