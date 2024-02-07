#!/bin/sh

backupsrv=/etc/systemd/system/backup.service
timer=/etc/systemd/system/backup.timer

if [ ! -f $backupsrv ]
then
   echo "не удалось создать службу для бэкапа"
   exit 1
fi

if [ ! -f $timer ]
then
   echo "Не удалось создать таймер"
   exit 1
fi

sudo systemctl enable backup.timer"
sudo systemctl start backup.timer
sudo systemctl enable backup.service"
sudo systemctl start backup.service"
