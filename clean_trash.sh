// les fichiers doivent etre vieux d\'au moins 2 jours ainsi que son contenu
find -O3 /trash -type f | while read file; do 
    timestamp2jourEnPlus=$(($(stat -c %Z $file)+172800))
    fichierOld2Jour=$(($(date +%s) > $timestamp2jourEnPlus))
    # rootFile=$(($(stat -c %U $file) == "root"))

    # echo $fichierOld2Jour
    # echo $rootFile

    if (($fichierOld2Jour == 1)); then
        echo "remove $file"
        remove $file
    else
        echo "no remove $file"
    fi
done