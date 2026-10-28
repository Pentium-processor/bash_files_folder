#!/bin/bash

lines=$(($(tput lines) / 2 + 5))
cols=$(($(tput cols) / 2 - 50))

mapfile -t logo_arr < "/home/ahan/bash_files_folder/msx_logo.txt"

function check_terminal_resolution {

  rows=$(tput lines)
  columns=$(tput cols)

  if [[ $rows -lt 27 || $columns -lt 101 ]]; then

     tput reset && printf "\033[31m Exitted due to the low terminal resolution of %ix%i \033[0m" $columns $rows
     exit 1

  fi

}

function handle_interrupt {

    tput reset
    exit 1

}

tput init
tput setab 27
tput civis
tput clear

trap handle_interrupt INT

sleep 1
tput cup "$lines" "$cols"

for ((line=18;line>0;line--)); do

    tput setab 15
    tput setaf 16

    check_terminal_resolution
    trap handle_interrupt INT
    ((lines--))
    tput cup "$lines" "$cols"
    echo "${logo_arr[line]}"
    sleep 0.04

done

lines=$(($(tput lines) / 2 + 5))
cols=$(($(tput cols) / 2 - 11))

tput setab 27
tput setaf 15

trap handle_interrupt INT
check_terminal_resolution
tput cup "$lines" "$cols" && echo "VRAM:128Kbytes"
trap handle_interrupt INT
check_terminal_resolution

sleep 1
trap handle_interrupt INT
check_terminal_resolution
tput reset
