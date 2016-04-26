#!/bin/bash
INTF=$1
ifconfig "$INTF" 2>&1 | grep -q no\ wireless\ extensions\. && {
  echo wired
  exit 0
}

essid=$(/sbin/ifconfig "$INTF" | grep 'ESSID:' | cut -d' ' -f 2- | sed 's/^ *//g' | cut -d' ' -f 4- | sed 's/ *$//g')
essid="${essid:7:(-1)}"
quality=$(/sbin/ifconfig "$INTF" | grep 'Link Quality' | sed 's/^ *//g' | cut -d'=' -f2 | cut -d' ' -f1)
cur=$(echo "$quality" | cut -d'/' -f1)
max=$(echo "$quality" | cut -d'/' -f2)
bars=$((cur*10/max))

case $bars in
  0)  bar='[----------]' ;;
  1)  bar='[#---------]' ;;
  2)  bar='[##--------]' ;;
  3)  bar='[###-------]' ;;
  4)  bar='[####------]' ;;
  5)  bar='[#####-----]' ;;
  6)  bar='[######----]' ;;
  7)  bar='[#######---]' ;;
  8)  bar='[########--]' ;;
  9)  bar='[#########-]' ;;
  10) bar='[##########]' ;;
  *)  bar='' ;;
esac

echo "$essid $bar"

exit 0
