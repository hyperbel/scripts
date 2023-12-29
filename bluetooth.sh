#!/bin/sh

arr=$(bluetoothctl devices)
choice=$(printf '%s\n' "${arr[*]}" | awk '{ print $3 " " $2 }' | dmenu -l 10 -p "Select Device")

mac=$(echo $choice | awk '{ print $2 }')

logfile=`mktemp`

bluetoothctl connect $mac > $logfile 2&>1
