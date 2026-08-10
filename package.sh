#!/bin/bash

echo -e "Number of installed python packages: $(pip3 list | awk 'NR==3,NR==max {print}' | wc -l)"

#Only works on debian-based distributions e.g. Ubuntu

echo "Number of manually installed linux packages: $(apt-mark showmanual | wc -l)"
