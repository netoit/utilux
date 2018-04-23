#!/bin/bash

if [ "$(cat /opt/utilux/system/TouchpadOff)" == "0" ]
 then
  synclient TouchpadOff=1
  if [ "$?" == "0" ]
   then
    echo -n "1" > /opt/utilux/system/TouchpadOff
    echo "Touchpad disabled"
  else
    echo "Something was wrong..!"
  fi
else
  synclient TouchpadOff=0
  if [ "$?" == "0" ]
   then
    echo -n "0" > /opt/utilux/system/TouchpadOff
    echo "Touchpad enabled"
  else
    echo "Something was wrong..!"
  fi
fi
