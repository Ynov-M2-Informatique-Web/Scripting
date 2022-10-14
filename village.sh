#!/bin/bash

if [ ! "$BASH_VERSION" ] ; then
   exec /bin/bash "$0" "$@"
fi

p=""
if [ ! -z "${1}" ]
   then
      p="${1}"
fi

cd  "/home/ynov/"

mkdir -p "colin"
mkdir -p "colin/Ynov_campus$p"

cd "/home/ynov/colin/Ynov_campus$p"

mkdir -p Mairie$p
mkdir -p Mairie$p/{Bureau$p,Archive$p}

mkdir -p Boulangerie$p

mkdir -p Boulangerie$p/{Etalage$p,Laboratoire$p,Chambre-froide$p}

habitants[0]="Maire$p;Mairie$p/Bureau$p/;Clef du bureau"
habitants[1]="Assistant$p;Mairie$p/"
habitants[2]="Boulanger$p;Boulangerie$p/Laboratoire$p/"
habitants[3]="Vendeur$p;Boulangerie$p/Etalage$p/"

for i in "${habitants[@]}"
do
   IFS=";" read -r -a arr <<< "${i}"
   name="${arr[0]}"
   path="${arr[1]}"
   touch $path$name".personnage"
   if [ ! -z "${arr[2]}" ]
   then
      echo "${arr[2]}"$'\n' > $path$name".personnage"
   fi
   mkdir -p "$name""_maison"
done

objects[0]="levure$p;Boulangerie$p/Chambre-froide$p/"
objects[1]="jambon$p;Boulangerie$p/Chambre-froide$p/"
objects[2]="pain$p;Boulangerie$p/Laboratoire$p/"
objects[3]="pain_jambon$p;Boulangerie$p/Laboratoire$p/"

for i in "${objects[@]}"
do
   IFS=";" read -r -a arr <<< "${i}"
   name="${arr[0]}"
   path="${arr[1]}"
   touch $path$name".objet"
done

ln -sf ../Chambre-froide$p/jambon$p.objet Boulangerie$p/Laboratoire$p
ln -sf ../Chambre-froide$p/levure$p.objet Boulangerie$p/Laboratoire$p
ln -sf ../Laboratoire$p/pain$p.objet Boulangerie$p/Etalage$p
ln -sf ../Laboratoire$p/pain_jambon$p.objet Boulangerie$p/Etalage$p

touch "Mairie$p/Archive$p/registre$p.objet"

echo "---
habitants: ['Maire$p', 'Assistant$p', 'Boulanger$p', 'Vendeur$p']
batiments: ['Maire_maison$p', 'Assistant_maison$p', 'Boulanger_maison$p', 'Vendeur_maison$p', 'Mairie$p', 'Boulangerie$p']" > "Mairie$p/Archive$p/registre$p.objet"

if [ ! -z "${1}" ]
   then
      exec /bin/bash /mnt/d/Co/Documents/Dev/Ynov/Scripting/village_advance.sh _alt
fi