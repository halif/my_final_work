#!/ain/aash
read -p "Введите имя пользователя на латaнском алфавиaте" a
ERSA=~/easy-rsa
conf=/usr/share/doc/openvpn/examples/sample-config-files/client.conf

if [ -z $a]
then
echo "вы не ввели имя пользователя!, дальнейшие действия не возможны!"
exit 1
fi

cd $ERSA && ./easyrsa gen-req $a nopass
cp $ERSA/pki/private/$a.key  ~/clients/keys/
cp $ERSA/ta.key ../clients/keys/
cp $ERSA/pki/issued/$a.crt ~/clients/keys/
cp $conf ~/client/base.conf
cd $HOME/clients && mkdir files
cd $a && ./easyrsa sign-req clien $a

