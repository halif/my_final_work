#!/bin/bash
read -p "Введите месторасположение папки easy-rsa с управляющим скриптом" a
conf=/usr/share/doc/openvpn/examples/sample-config-files/client.conf

mkdir -p ~/clients/keys
chmod -R 700 ~/clients

sudo usermod -aG nogroup nobody

cd $a && ./easyrsa init-pki && ./easyrsa gen-req server nopass && ./easyrsa sign-req server server
cd /usr/bin && openvpn --genkey --sevret ta.key
cd $a && sudo cp ta.key /etc/openvpn/server
cp $a/pki/issued/server.crt /etc/openvpn/server
cd $HOME/clients && mkdir files




# проверка существования файла server.crt
if [ -e /etc/openvpn/server/server.crt ]
then
echo "Файл server.crt существует "
else
echo "Файл server.crt не существует в /etc/openvpn/server, скопируйте его из директории easy-rsa/pki/issued/server.crt или запустите скрипт через sudo"
fi

if [ -e /etc/openvpn/server/ca.crt ]
then
echo "Файл ca.crt существует"
else
echo "Файл ca.crt не существует в /etc/openvpn/server, скопируйте его из директории easy-rsa/pki/issued/server.crt или запустите скрипт через sudo"
fi

if [ -e /etc/openvpn/server/ta.key ]
then
echo "Файл ta.key существует"
else
echo "Файл ta.key не существует в /etc/openvpn/server, скопируйте его из директории easy-rsa/pki/issued/server.crt или запустите скрипт через sudo"
fi
