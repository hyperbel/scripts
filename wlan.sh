#!/bin/sh
arr=$(echo '1. Open nmtui\n2. Restart NetworkManager')
opt=$(echo ${arr[@]} | dmenu -l 2 | awk '{ print $1 }')
if [ $opt = '1.' ]; then
$(bspc rule -a \* -o state=floating && st nmtui) > `mktemp` 2&>1
else
    $(bspc rule -a \* -o state=floating && st sudo systemctl restart NetworkManager && st nmtui) > `mktemp` 2&>1
fi
