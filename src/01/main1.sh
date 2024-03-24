#!/bin/bash
str='^[0-9]+$'
if [[ $1 =~ $str ]] ; then
  echo "error: not a str"; exit 1
else
  echo "$1"
fi
