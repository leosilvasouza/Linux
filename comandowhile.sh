#!/bin/bash
#Sistema testa arquivo
#Autor: Leonardo Souza


des_cont="s"  #Inicio o programa informando que a variável tem um valor para a condição while iniciar/continuar o script

while [ "$des_cont" = "s" ];do

	echo "Digite o arquivo:" 
	read resp_arq
	res_find=$(find -name $resp_arq)

	if [ "$res_find"="" ]; then
		echo "Arquivo $resp_arq não encontrado" 
	fi
		
	echo "Deseja continuar? [s ou n]?"
	read des_cont
done 
exit



