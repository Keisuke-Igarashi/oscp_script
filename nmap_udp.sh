#!/bin/bash

LAB_DIR='/home/parallels/Documents/OSCP_LAB/Medtech'

output=$(sudo nmap -sU -v -p 1-1000 $2 -oA $LAB_DIR/$1/nmap/udp | tee /dev/tty )

# -Pnが必要な場合は自動で判定してnmap実行できるようにする
if [[ $output == *"blocking"* ]]; then
    # ***********rescan with -Pn*******************
    sudo nmap -sU -v -Pn -p 1-1000 $2 -oA $LAB_DIR/$1/nmap/udp -T4
fi