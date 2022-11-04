mkdir -p /trash
echo $'if [ -f $HOME/.bash_aliases ]\nthen\n  . $HOME/.bash_aliases\nfi' >> /home/ynov/.bashrc
echo 'alias remove="/usr/bin/rm"' > /home/ynov/.bash_aliases
echo 'alias rm="rmm"' >> /home/ynov/.bash_aliases
echo $'rmm () {\nfichierSup200=$(($(stat -c %s $1) > 209715200))\n\n    if (($fichierSup200 == 1)); then\n        echo "remove $1"\n        remove $1\n    else\n        echo "move $1"\n        sudo mv $1 /trash/$1.$(date +%s)\n    fi\n}' >> /home/ynov/.bash_aliases
(crontab -l 2>/dev/null; echo "0 * * * * /home/ynov/clean_trash.sh") | crontab -
exec bash

// JUSTE POUR ECRIRE
rmm () {
    fichierSup200=$(($(stat -c %s $1) > 209715200))

    if (($fichierSup200 == 1)); then
        echo "remove $1"
        remove $1
    else
        echo "move $1"
        sudo mv $1 /trash/$1.$(date +%s)
    fi    
}