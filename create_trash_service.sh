echo $'[Unit]\nDescription=MyTrash Daemon Colin\n[Service]\nType=simple\nUser=ynov\nExecStart=/home/ynov/colin/rm.sh\nRestart=on-failure\n\n[Install]\nWantedBy=default.target' > /etc/systemd/system/my_trash.service
systemctl daemon-reload
systemctl enable my_trash.service