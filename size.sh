#!/bin/bash
cd /home/transistron
du -h | sort -nr > "sizes.txt"
echo -e "Top 5 files taking up the most disk space:\n"
head -n5 sizes.txt
rm -r sizes.txt
