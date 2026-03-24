#!/bin/bash

type=$1

case $type in

     volume)

        value=$( pactl list sinks )

        list_vol=$( echo "$value" | grep "Volumen:" )

        let i=0

        for value in $list_vol

        do

            if [ $i -eq 4 ]; then porcent=$value; break; fi

            let i=i+1

        done

        echo "$porcent"

     ;;

    brightness)

        brightness="$(brightlight -r)"

        value=$( echo $brightness | sed -r 's/current backlight brightness is: ([0-9]+)/\1/g' )

        porcent=$( expr $value \* 100 / 7812 )

        echo "$porcent%"

    ;;

    datetime)

        datetime=$( date '+%d/%m/%Y %H:%M' )

        echo $datetime

    ;;

    battery)
        
        info=$( upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep "percentage:" )

        echo ${info/percentage:/''}

    ;;

    restart-i3)

        i3-msg restart

    ;;

    exit-i3)
        
        i3-msg exit

    ;;

    memory)

        cpu=$( grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END { print usage }' )

        usedRam=$( vmstat -s -S M | grep "M used memory" )

        used=$( echo ${usedRam/ M used memory/""} )

        echo "CPU: $cpu% RAM: $used MB"

    ;;

    *)

        echo "No aplica el valor ingresado"

    ;;

esac
