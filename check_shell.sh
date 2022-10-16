#!/bin/bash

if [ ! "$BASH_VERSION" ]; then
    exec /bin/bash "$0" "$@"
fi

TIMEFORMAT=%3lR

r=`{ time date +%d:%m:%y ;} 2> time`
echo "afficher l'heure au format \"00:00:00\" | $r | `cat time`" 