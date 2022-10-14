#!/bin/bash

if [ ! "$BASH_VERSION" ]; then
    exec /bin/bash "$0" "$@"
fi

cd "/home/ynov/colin/Ynov_campus"

getent passwd Archive || echo ynov | sudo -S useradd Archive
echo ynov | sudo -S usermod -a -G Archive ynov

for i in Boulangerie Mairie; do
    getent passwd $i || echo ynov | sudo -S useradd $i
    echo ynov | sudo -S usermod -a -G $i ynov
    echo ynov | sudo -S chown -R $i:$i $i
done
echo ynov | su ynov &> /dev/null

path=$(find . -type f -name \*.personnage)

for i in $path; do
    name=$(basename $i .personnage)
    getent passwd $name || echo ynov | sudo -S useradd $name
    echo ynov | sudo -S chown $name:$name $i
    echo ynov | sudo -S chown -R $name:$name $name"_maison"
    echo ynov | sudo -S usermod -a -G $name ynov
done

getent passwd Ynov_campus || echo ynov | sudo -S useradd Ynov_campus
echo ynov | sudo -S usermod -a -G Ynov_campus ynov
echo ynov | sudo -S chown Ynov_campus:Ynov_campus "/home/ynov/colin/Ynov_campus"
echo ynov | sudo -S chmod 750 -R "/home/ynov/colin/Ynov_campus"
echo ynov | sudo -S find . -type f -exec chmod 660 -- {} +

echo ynov | su ynov &> /dev/null