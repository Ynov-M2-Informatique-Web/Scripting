#!/bin/bash

if [ ! "$BASH_VERSION" ]; then
    exec /bin/bash "$0" "$@"
fi

TIMEFORMAT=%3lR

time echo -n "afficher l'heure au format \"00:00:00\" | $(date +%H:%M:%S) | " 

time echo -n "afficher le nombre d'user avec un uid pair | $(gawk -F: '{  if ($3 % 2 == 0) print $3 }' /etc/passwd | wc -l) | "

time echo -n "afficher le nombre de group avec gid impair | $(gawk -F: '{  if ($3 % 2 == 1) print $3 }' /etc/group | wc -l) | "

time echo -n "afficher le nombre de fichier | $(find / -type f -level0 | wc -l) | "

time echo -n "afficher le nombre de fichier | $(find / -type f -level3 | wc -l) | "