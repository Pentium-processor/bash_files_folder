#!/bin/bash
echo "PROCESS NAME:"

read proc_name
pipe_operation="$(ps -axww | grep -w $proc_name)"

echo "$pipe_operation"
touch proc.txt
echo "$pipe_operation" > proc.txt
instances="$(cat proc.txt | wc -l)"
sleep 1
clear
sleep 1

PID="${pipe_operation:0:8}"
if [[ "$instances" -ge 3 ]]; then
 echo "DO YOU WANT TO KILL ALL INSTANCES OF THE PROCESS Y/N:"
 read kill_all
 if [[ "$kill_all" == "n" ]]; then

  kill -TERM $PID

 elif [[ "$kill_all" == "y" ]]; then
     killall $proc_name

 fi

else
  kill -TERM $PID
fi

if [[ "$?" -eq 0  ]]; then
   echo " Process $proc_name was killed successfully"

   echo " Process  $proc_name was killed successfully" | espeak

else
   echo "Program executed with errors"

   echo "Program executed with errors" | espeak

fi
