#!/bin/bash
# First argument: Client identifier
KEY_DIR=~/clients/keys
OUTPUT_DIR=~/clients/files
BASE_CONFIG=~/clients/base.conf

if [ -z "$1" ] 
then
  echo "Не введено имя-логин клиента при запуске этого скрипта"
  exit 1
fi

if [ ! -d $KEY_DIR ]
then
  echo "Отсутствует папка с ключами!"
  exit 1
fi

if [ -z $BASE_CONFIG ]
then
  echo "Отсутствует базовый конфиг!"
  exit 1
fi

if [ ! -d $OUTPUT_DIR ]
then
  echo "Нет директории для выгрузки конфига!"
  exit 1
fi

cat ${BASE_CONFIG} \
<(echo -e '<ca>') \
${KEY_DIR}/ca.crt \
<(echo -e '</ca>\n<cert>') \
${KEY_DIR}/${1}.crt \
<(echo -e '</cert>\n<key>') \
${KEY_DIR}/${1}.key \
<(echo -e '</key>\n<tls-crypt>') \
${KEY_DIR}/ta.key \
<(echo -e '</tls-crypt>') \
> ${OUTPUT_DIR}/${1}.ovpn

if [ -f ${OUTPUT_DIR}/${1}.ovpn ]
then
  echo "Файл конфигурации успешно выгружен под именем $1.ovpn"
else
  echo "Ошибка. Файл не выгружен"
fi
