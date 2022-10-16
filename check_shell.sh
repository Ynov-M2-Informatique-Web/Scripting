#!/bin/bash

if [ ! "$BASH_VERSION" ]; then
    exec /bin/bash "$0" "$@"
fi

TIMEFORMAT=%3lR

r=`{ time date +%H:%M:%S ;} 2> time`
echo "afficher l'heure au format \"00:00:00\" | $r | `cat time`" 

`{ time cut -d: -f3 /etc/passwd | while read -r line; do if [ $(expr $line % 2) -eq 0 ]; then ((e=e+1)); echo $e > count ; fi; done } 2> time`
echo "afficher le nombre d'user avec un uid pair | `cat count` | `cat time`"