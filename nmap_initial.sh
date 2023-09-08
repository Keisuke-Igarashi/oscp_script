#!/bin/bash

LAB_DIR='/home/parallels/Documents/OSCP_LAB/Medtech'

mkdir -p $LAB_DIR/$1
mkdir -p $LAB_DIR/$1/nmap

output=$(nmap -sV -sT -A $2 -oA $LAB_DIR/$1/nmap/initial -T4 | tee /dev/tty )

# -Pnが必要な場合は自動で判定してnmap実行できるようにする
if [[ $output == *"blocking"* ]]; then
    # ***********rescan with -Pn*******************
    nmap -sV -sT -Pn -A $2 -oA $LAB_DIR/$1/nmap/initial -T4
fi
