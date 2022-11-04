echo $'[Unit]\nDescription=MyTrash Daemon Colin\n[Service]\nType=simple\nUser=root\nExecStart=/usr/bin/sh /home/ynov/colin/clean_trash.sh\nRestart=on-failure\n\n[Install]\nWantedBy=default.target' > /etc/systemd/system/my_trash.service
systemctl daemon-reload
systemctl enable my_trash.service
systemctl start my_trash.service

mkdir -p /trash
echo $'if [ -f /home/ynov/.bash_aliases ]\nthen\n  . /home/ynov/.bash_aliases\nfi' >> /home/ynov/.bashrc
echo 'alias remove="/usr/bin/rm"' > /home/ynov/.bash_aliases
echo 'alias rm="rmm"' >> /home/ynov/.bash_aliases
echo $'rmm () {\nfichierSup200=$(($(stat -c %s $1) > 209715200))\n\n    if (($fichierSup200 == 1)); then\n        echo "remove $1"\n        remove $1\n    else\n        echo "move $1"\n        sudo mv $1 /trash/$1.$(date +%s)\n    fi\n}' >> /home/ynov/.bash_aliases
# (crontab -l 2>/dev/null; echo "0 * * * * /home/ynov/clean_trash.sh") | crontab -
source /home/ynov/.bashrc