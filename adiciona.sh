#!/bin/bash

echo "Realizando a leitura do arquivo usuarios.txt"
echo
for DANADA in $(cat /root/usuarios.txt); do
	USUARIO=$(cat /etc/passwd | grep ^$DANADA | cut -d: -f1)
	test -z $USUARIO
	if [ $? -eq 0 ]; then
		echo
		echo "O usuário $DANADA não está cadastrado"
		echo "Para cadastrar o usuário pressione ENTER"
		read $DANADA
		echo "Usuário $DANADA Cadastrado com sucesso!"
	else
		echo "O usuário $DANADA já está cadastrado"
	fi
done	 
