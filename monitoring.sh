#!/bin/bash

#Armazenando resultado dos comandos
data=`date ; echo`
disk=`df ; echo`
users=`w ; echo`

echo -e "To: leonardo.souza@easytaxi.com.br\nSubject: Log de monitoração\n\nLog de: "$data" \n\nAnálise dos discos: \n"$disk" \n\nUsuários logados: \n"$users"." > log.txt
ssmtp leonardo.souza@easytaxi.com.br < log.txt

