#!/bin/bash
NOW=$(date +%Y%m%d%H%M)
MNOW=$(date +%Y%m)

BACKUP_SO="/home/ildar/source.cnf"
ARCHIVES_DIR=/tmp/backup/

DOW=`date +%a`              # Day of the week e.g. Mon
DOM=`date +%d`              # Date of the Month e.g. 27
DM=`date +%d%b`             # Date and Month e.g. 27Sep

if [[ ! -d ${ARCHIVES_DIR}${MNOW} ]]
  then
    mkdir -p ${ARCHIVES_DIR}${MNOW}
  else
    echo &>/dev/null
fi

sudo chown $USER ${ARCHIVES_DIR}${MNOW}

tar --files-from=/home/ildar/source.cnf -v -z --create --file ${ARCHIVES_DIR}${MNOW}/${NOW}.tar.gz --listed-incremental=${ARCHIVES_DIR}${MNOW}/${MNOW}.snar $BACKUP_HOME &> ${ARCHIVES_DIR}${MNOW}/${NOW}.log

if [ ! -f ${ARCHIVES_DIR}${MNOW}/${NOW}.tar.gz ]
then
    echo 'FAIL create backup file!'
else
    echo 'Success file was created'
    bash -c find $HOME/Yandex.Disk -type d -mtime +5 -delete
    bash -c "cp -r ${ARCHIVES_DIR}${MNOW} $HOME/Yandex.Disk"
    rm -rf ${ARCHIVES_DIR}/*
exit 1
fi
