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

time echo -n "afficher le nom du cpu | $(cat /proc/cpuinfo | grep 'model name' | sed 's/model name[ \t]:[ \t]//g') | "

time echo -n "afficher les variables d'environnment | $(printenv) | "

time echo -n "créer le fichier random_text | $(touch random_text)"

time echo -n "ecrire dans random_text au moins 46076442 charactere | $(dd if=/dev/urandom of=random_text count=90 bs=1000000 &> /dev/null)"

time echo -n "afficher la taille du fichier en mode human_readeable | $(ls -lh random_text | cut -d " " -f5) | "

time echo -n "afficher le nombre de ligne de la commande man man | $(man -wa man | xargs -L1 zcat | wc -l) | "

time echo -n "compter combien de fois le mot man est présent dans la commande man man | $(man -wa man | xargs -L1 zcat | grep man -ciow) | "

time echo -n "cloner le repos grafana de github | $(wget -qO- https://github.com/grafana/grafana/archive/refs/heads/main.tar.gz | tar xz)"

time echo -n "ajouter le fichier random_text dans le repo cloner | $(mv random_text grafana-main/random_text)"

time echo -n "récuperer ce fichier https://www.elastic.co/guide/en/elasticsearch/reference/8.4/release-notes-8.4.3.html | $(wget -q https://www.elastic.co/guide/en/elasticsearch/reference/8.4/release-notes-8.4.3.html)"

time echo -n "récuperer ce fichier https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.4.3-darwin-x86_64.tar.gz | $(wget -q https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.4.3-darwin-x86_64.tar.gz)"

time echo -n "Faire des 4 etapes precedentes un zip | $(zip -qq r.zip grafana-main release-notes-8.4.3.html elasticsearch-8.4.3-darwin-x86_64.tar.gz)"

time echo -n "afficher le nom du physical volume | $(pvs -o pv_name --no-heading | sed 's/^ *//g') | "

time echo -n "afficher l'uuid du volume group | $(vgdisplay | grep "VG UUID" | sed 's/[ \t]*VG UUID[ \t]*//g') | "

time echo -n "afficher le path du lv rootp | $(lvdisplay | grep "LV Path" | sed 's/[ \t]*LV Path[ \t]*//g') | "

time echo -n "afficher le nombre de paquet perdu en ping 8.8.8.8 | $(ping -c 1 -q 8.8.8.8 | grep -oP '[\d+.,]+(?=% packet loss)') | "

time echo -n "afficher l'heure \"00:00:00\" | $(date +%H:%M:%S) | "

echo -e '\033[0m'

# echo 'PS1="colin_varange>"' >> ~/.bashrc
# source ~/.bashrc
# su ynov