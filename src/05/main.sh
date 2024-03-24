#!/bin/bash

. ./files_find

start=$(cat /proc/uptime | awk '{print $1}')
echo "Total number of folders (including all nested ones) =  $(find $1 -type d | wc -l)"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
top5_names=( $( du -h $1 | sort -rh | head -5 | awk '{print $2}') )
top5_size=( $( du -h $1 | sort -rh | head -5 | awk '{print $1}') )
for (( i=0; i<${#top5_names[@]}; i++ ))
    do
        echo -e "$((i+1)) - ${top5_names[i]}, ${top5_size[i]}b"
done

echo "Total number of files = $(ls -laR $1 | grep ^- | wc -l)"
echo "Number of:"
echo "$(types $1 "conf")"
echo "$(types $1 "txt")"
echo "$(types $1 "execut")"
echo "$(types $1 "log")"
echo "$(types $1 "arch")"
echo "$(types $1 "symb")"

echo -e "TOP 10 files of maximum size arranged in descending order (path, size and type): \n$(top $1)"

echo -e "TOP 10 executable files of maximum size arranged in descending order (path, size and MD5 hash of file): \n$(top_find $1)"

end="$(cat /proc/uptime |awk '{print$1}')"
awk "BEGIN {printf \"Script execution time (in seconds) = %.2f\n\", ${end}-${start}}"
