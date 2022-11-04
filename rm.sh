mkdir -p /trash
echo $'if [ -f $HOME/.bash_aliases ]\nthen\n  . $HOME/.bash_aliases\nfi' >> /home/ynov/.bashrc
echo 'alias remove="/usr/bin/rm"' > /home/ynov/.bash_aliases
echo $'rm () {\n        sudo mv $1 /trash/$1.$(date +%s)\n}' >> /home/ynov/.bash_aliases
(crontab -l 2>/dev/null; echo "0 * * * * /home/ynov/clean_trash.sh") | crontab -
exec bash

rm () {
    fichierSup200=$(($(stat -c %s $1) > 209715200))

    if (($fichierSup200 == 1)); then
        echo "remove $1"
        remove $1
    else
        echo "move $1"
        sudo mv $1 /trash/$1.$(date +%s)
    fi    
}