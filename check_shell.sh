#!/bin/bash

if [ ! "$BASH_VERSION" ]; then
    exec /bin/bash "$0" "$@"
fi

TIMEFORMAT=%3lR

r=`{ time date +%H:%M:%S ;} 2> t`
echo "afficher l'heure au format \"00:00:00\" | $r | `cat t`" 
unset r

# `{ time cut -d: -f3 /etc/passwd | while read -r line; do if [ $(expr $line % 2) -eq 0 ]; then ((e=e+1)); echo $e > count ; fi; done } 2> time`
# echo "afficher le nombre d'user avec un uid pair | `cat count` | `cat time`"

# `{ time cut -d: -f3 /etc/passwd | while read -r line; do echo $(expr $line % 2); done | $(grep -o 0 | wc -l > count) ;} 2> time`
# echo "afficher le nombre d'user avec un uid pair | `cat count` | `cat time`"

`{ time cut -d: -f3 /etc/passwd | xargs -I {} expr {} % 2 | $(grep -c 0 > c) ;} 2> t`
echo "afficher le nombre d'user avec un uid pair | `cat c` | `cat t`"

`{ time cut -d: -f3 /etc/group | xargs -I {} expr {} % 2 | $(grep -c 1 > c) ;} 2> t`
echo "afficher le nombre de group avec gid impair | `cat c` | `cat t`"