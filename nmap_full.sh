#!/bin/bash

LAB_DIR='/home/parallels/Documents/OSCP_LAB/Medtech'

output=$(nmap -sT -p- $2 -T4 -oA $LAB_DIR/$1/nmap/full | tee /dev/tty )

# -Pnが必要な場合は自動で判定してnmap実行できるようにする
if [[ $output == *"blocking"* ]]; then
    # ***********rescan with -Pn*******************
    nmap -sT -p- $2 -T4 -Pn -A $2 -oA $LAB_DIR/$1/nmap/full
fi