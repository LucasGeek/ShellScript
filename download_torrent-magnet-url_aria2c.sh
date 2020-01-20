#!/bin/bash

echo "Este script verifica se o pacote esta ou não instalado, posteriormente instala o mesmo se necessário"
echo
pacote = $(dpkg --get-selections | grep "aria2" ) 
echo 
echo -n "Verificando se o Pacote 'aria2' esta instalado."
sleep 2
if [ -n $pacote ] ;
then echo
     echo "Pacote 'aria2' já instalado"
else echo
     echo "Pacote 'aria2' Necessário -> Não instalado"
     echo "Instalando automaticamente o Pacote..."
     sudo apt-get install aria2
fi

read -a LIST_URL -p "Informe as Magnet url(s) do torrent que deseja baixar, caso queira baixar mais de 1 arquivo os separe por virgula: "
for item in ${LIST_URL[@]}
do
    aria2c "$item"
done