#!/bin/bash
source color.config
if [ "x$column1_font_color" = "x" ] ; then
  font_color1=2
  default1="default"
else
  font_color1=$column1_font_color
  default1=""
fi

if [ "x$column1_background" = "x" ] ; then
  background_color1=4
  default2="default"
else
  background_color1=$column1_background
  default1=""
fi

if [ "x$column2_font_color" = "x" ] ; then
  font_color2=5
  default3="default"
else
  font_color2=$column2_font_color
  default1=""
fi

if [ "x$column2_background" = "x" ] ; then
  background_color2=1
  default4="default"
else
  background_color2=$column2_background
  default1=""
fi

case $font_color1 in
  1) tcolor=$'\e[0;97'
     f_c="white";;
  2) tcolor=$'\e[0;31'
     f_c="red";;
  3) tcolor=$'\e[0;32'
     f_c="green";;
  4) tcolor=$'\e[0;34'
     f_c="blue";;
  5) tcolor=$'\e[0;35'
     f_c="purple";;
  6) tcolor=$'\e[0;30'
     f_c="black";;
esac
case $font_color2 in
  1) t2color=$'\e[0;97'
     f_c1="white";;
  2) t2color=$'\e[0;31'
     f_c1="red";;
  3) t2color=$'\e[0;37'
     f_c1="green";;
  4) t2color=$'\e[0;34'
     f_c1="blue";;
  5) t2color=$'\e[0;35'
     f_c1="purple";;
  6) t2color=$'\e[0;30'
     f_c1="black";;
esac
case $background_color1 in
  1) bcolor=$';47m'
     b_c="white";;
  2) bcolor=$';41m'
     b_c="red";;
  3) bcolor=$';42m'
     b_c="green";;
  4) bcolor=$';44m'
     b_c="blue";;
  5) bcolor=$';45m'
     b_c="purple";;
  6) bcolor=$';40m'
     b_c="black";;
esac
case $background_color2 in
  1) b2color=$';47m'
     b_c1="white";;
  2) b2color=$';41m'
     b_c1="red";;
  3) b2color=$';42m'
     b_c1="green";;
  4) b2color=$';44m'
     b_c1="blue";;
  5) b2color=$';45m'
     b_c1="purple";;
  6) b2color=$';40m'
     b_c1="black";;
esac

if [ "$font_color1" = "$background_color1" ] || [ "$font_color2" = "$background_color2" ]; then
  echo "text color and bakground color are same, pls retry with different colors"
  exit 1
fi

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
echo -e "$rescolor GATEWAY=$rescolor1 $GATEWAY \e[0m"
RAM_TOTAL=`free -m | awk '/Mem:/ {printf "%.3f Gb", $2/1024}'`
echo -e "$rescolor RAM_TOTAL=$rescolor1 $RAM_TOTAL\e[0m"
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

if [ "$default1" = "default" ] ; then
  echo "column 1 background = ($default1) ($b_c)"
else
  echo "column 1 background = $background_color1 ($b_c)"
fi
if [ "$default2" = "default" ] ; then
  echo "column 1 font color = ($default2) ($f_c)"
else
  echo "column 1 font color = $font_color1 ($f_c)"
fi
if [ "$default3" = "default" ] ; then
  echo "column 2 background = ($default3) ($b_c1)"
else
  echo "column 2 background = $background_color2 ($b_c1)"
fi
if [ "$default4" = "default" ] ; then
  echo "column 2 font color = ($default4) ($f_c1)"
else
  echo "column 2 font color = $font_color2 ($f_c1)"
fi

