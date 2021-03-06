#!/bin/bash

echo "Este script verifica se o pacote esta ou não instalado, posteriormente instala o mesmo se necessário"
echo
pacote = $(dpkg --get-selections | grep "aria2" ) 
echo 
echo -n "Verificando se o Pacote 'aria2' esta instalado."
sleep 2
if [ -n "$pacote" ] ;
then echo
     echo "Pacote 'aria2' já instalado"
else echo
     echo "Pacote 'aria2' Necessário -> Não instalado"
     echo "Instalando automaticamente o Pacote..."
     sudo apt-get install aria2
fi

for i in $(seq 1 20); do
    echo "Começou o item $i"

    aria2c http://200.152.38.155/CNPJ/DADOS_ABERTOS_CNPJ_$([ $i < 10 ] && echo "$i" || echo "0$i").zip

    echo "Terminou o item $i"
done

exit