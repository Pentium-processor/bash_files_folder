#!/bin/bash
pip list > py_packages.txt
number_of_py_packages=$(awk "NR==3,NR=max{print}" py_packages.txt | wc -l)
apt-mark showmanual > installed_packages.txt
number_of_linux_packages=$(cat installed_packages.txt | wc -l)
echo -e  "\nnumber of python packages installed :$number_of_py_packages"
echo  "number of linux packages manually installed:$number_of_linux_packages "
rm -r py_packages.txt installed_packages.txt
