mkdir /trash
echo $'if [ -f $HOME/.bash_aliases ]\nthen\n  . $HOME/.bash_aliases\nfi' > /home/ynov/.bash_rc
echo 'alias remove="/usr/bin/rm"' >> /home/ynov/.bash_aliases
echo 'alias rm="mv \\!* /trash"' >> /home/ynov/.bash_aliases
exec bash