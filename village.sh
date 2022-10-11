#!/bin/bash

if [ ! "$BASH_VERSION" ] ; then
   exec /bin/bash "$0" "$@"
fi

cd  "/home/ynov/"

mkdir -p "colin"
mkdir -p "colin/Ynov_campus"

cd "/home/ynov/colin/Ynov_campus"

mkdir -p Mairie
batiments_it=1
batiments[0]="Mairie"
mkdir -p Mairie/{Bureau,Archive}

mkdir -p Boulangerie

batiments[1]="Boulangerie"
mkdir -p Boulangerie/{Etalage,Laboratoire,Chambre-froide}

habitants[0]='Maire;Mairie/Bureau/;Clef du bureau'
habitants[1]='Assistant;Mairie/'
habitants[2]='Boulanger;Boulangerie/Laboratoire/'
habitants[3]='Vendeur;Boulangerie/Etalage/'

batiments_it=2
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
   batiments[$batiments_it]=$name"_maison"
   batiments_it=$((batiments_it+1))
done

objects[0]='levure;Boulangerie/Chambre-froide/'
objects[1]='jambon;Boulangerie/Chambre-froide/'
objects[2]='pain;Boulangerie/Laboratoire/'
objects[3]='pain_jambon;Boulangerie/Laboratoire/'

for i in "${objects[@]}"
do
   IFS=";" read -r -a arr <<< "${i}"
   name="${arr[0]}"
   path="${arr[1]}"
   touch $path$name".objet"
done

ln -sf ../Chambre-froide/jambon.objet Boulangerie/Laboratoire
ln -sf ../Chambre-froide/levure.objet Boulangerie/Laboratoire
ln -sf ../Laboratoire/pain.objet Boulangerie/Etalage
ln -sf ../Laboratoire/pain_jambon.objet Boulangerie/Etalage

touch "Mairie/Archive/registre.objet"

echo "---
habitants: ['Maire', 'Assistant', 'Boulanger', 'Vendeur']
batiments: ['Maire_maison', 'Assistant_maison', 'Boulanger_maison', 'Vendeur_maison', 'Mairie', 'Boulangerie']" > "Mairie/Archive/registre.objet"

