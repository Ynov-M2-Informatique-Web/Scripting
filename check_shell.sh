#!/bin/bash

if [ ! "$BASH_VERSION" ]; then
    exec /bin/bash "$0" "$@"
fi

TIMEFORMAT=%3lR

echo -e '\033[1;32m'

time echo -n "afficher l'heure au format \"00:00:00\" | $(date +%H:%M:%S) | " 

time echo -n "afficher le nombre d'user avec un uid pair | $(gawk -F: '{  if ($3 % 2 == 0) print $3 }' /etc/passwd | wc -l) | "

time echo -n "afficher le nombre de group avec gid impair | $(gawk -F: '{  if ($3 % 2 == 1) print $3 }' /etc/group | wc -l) | "

time echo -n "afficher le nombre de fichier | $(find -O3 / -type f | wc -l) | "

time echo -n "afficher le nombre de répertoire | $(find -O3 / -type d | wc -l) | "

time echo -n "afficher la version du kernel | $(uname -r) | "

time echo -n "afficher le nom du cpu | $(lscpu | grep 'Model name' | sed 's/Model name:[ \t]*//g') | "

echo -e '\033[0m'

echo 'PS1="colin_varange>"' >> ~/.bashrc
source ~/.bashrc
su ynov