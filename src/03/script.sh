#!/bin/bash

if [ $1 = $2 ] || [ $3 = $4 ]; then
  echo "text color and bakground color are same, pls retry with different colors"
  exit 1
fi
case $1 in
  1) tcolor=$'\e[0;97';;
  2) tcolor=$'\e[0;31';;
  3) tcolor=$'\e[0;32';;
  4) tcolor=$'\e[0;34';;
  5) tcolor=$'\e[0;35';;
  6) tcolor=$'\e[0;30';;
esac
case $3 in
  1) t2color=$'\e[0;97';;
  2) t2color=$'\e[0;31';;
  3) t2color=$'\e[0;37';;
  4) t2color=$'\e[0;34';;
  5) t2color=$'\e[0;35';;
  6) t2color=$'\e[0;30';;
esac
case $2 in
  1) bcolor=$';47m';;
  2) bcolor=$';41m';;
  3) bcolor=$';42m';;
  4) bcolor=$';44m';;
  5) bcolor=$';45m';;
  6) bcolor=$';40m';;
esac
case $4 in
  1) b2color=$';47m';;
  2) b2color=$';41m';;
  3) b2color=$';42m';;
  4) b2color=$';44m';;
  5) b2color=$';45m';;
  6) b2color=$';40m';;
esac

rescolor="$tcolor$bcolor"
rescolor1="$t2color$b2color"
HOSTNAME=`sudo hostname`
echo -e "$rescolor HOSTNAME=$rescolor1 $HOSTNAME"
TIMEZONE=`sudo timedatectl | grep zone`
echo -e $tcolor$bcolor TIMEZONE=$rescolor1 $TIMEZONE
USER=`whoami`
echo -e "$rescolor USER"="$rescolor1 $USER"
OS=`hostnamectl | grep Operating`
echo -e "$rescolor OS"="$rescolor1 $OS"
DATE=`date`
echo -e $rescolor DATE=$rescolor1 $DATE
UPTIME=`uptime`
echo -e $rescolor UPTIME=$rescolor1 $UPTIME
UPTIME_SEC=`awk '{print $1}' /proc/uptime`
echo -e $rescolor UPTIME_SEC=$rescolor1 $UPTIME_SEC
IP=`ifconfig enp0s3 | grep -e inet -e "([0-9]{1,3}\.){3}[0-9]{1,3}"| head -1 | awk ' {print $2}'`
echo -e "$rescolor IP=$rescolor1 $IP"
MASK=`ifconfig enp0s3 | grep netmask | awk '{print $4}'`
echo -e $rescolor MASK=$rescolor1 $MASK
GATEWAY=`ip r | grep default | awk '{print $3}'`
echo -e "$rescolor GATEWAY=$rescolor1 $GATEWAY"
RAM_TOTAL=`free -m | awk '/Mem:/ {printf "%.3f Gb", $2/1024}'`
echo -e "$rescolor RAM_TOTAL=$rescolor1 $RAM_TOTAL"
RAM_USED=`free -m | awk /Mem:/'{printf "%.3f Gb", $3/1024}'`
echo -e "$rescolor RAM_USED=$rescolor1 $RAM_USED \e[0m"
RAM_FREE=`free -m | awk /Mem:/'{printf "%.3f Gb", $4/1024}'`
echo -e "$rescolor RAM_FREE=$rescolor1 $RAM_FREE \e[0m"
SPACE_ROOT=`df / | awk '/dev/ {printf "%.3f Mb", $2/1024}'`
echo -e "$rescolor SPACE_ROOT=$rescolor1 $SPACE_ROOT \e[0m"
SPACE_ROOT_USED=`df / | awk '/dev/ {printf "%.3f Mb", $3/1024}'`
echo -e "$rescolor SPACE_ROOT_USED=$rescolor1 $SPACE_ROOT_USED \e[0m"
SPACE_ROOT_FREE=`df / | awk '/dev/ {printf "%.3f Mb", $4/1024}'`
echo -e "$rescolor SPACE_ROOT_FREE=$rescolor1 $SPACE_ROOT_FREE \e[0m\n"
