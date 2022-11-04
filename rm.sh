mkdir -p /trash
echo $'if [ -f $HOME/.bash_aliases ]\nthen\n  . $HOME/.bash_aliases\nfi' > /home/ynov/.bashrc
echo 'alias remove="/usr/bin/rm"' > /home/ynov/.bash_aliases
echo $'rm () {\n        sudo mv $1 /trash/\n}' >> /home/ynov/.bash_aliases
(crontab -l 2>/dev/null; echo "0 * * * * /home/ynov/clean_trash.sh") | crontab -
exec bash