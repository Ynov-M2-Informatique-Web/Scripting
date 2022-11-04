mkdir /trash
echo 'alias remove="/usr/bin/rm"' >> /home/ynov/.bash_aliases
echo 'alias rm="mv \\!* /trash"' >> /home/ynov/.bash_aliases
exec bash