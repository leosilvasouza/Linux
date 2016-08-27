#!/bin/bash

echo -e "
	1 - Adicionar um usuário
	2 - Deletar um usuário
	3 - Verificar um usuário"
echo -n "Escolha uma opção:"
read OPT
 
case $OPT in
1)
	clear
	echo -n "Digite o nome do usuário a ser adicionado:"
	read USUARIO
	echo -n "Digite a senha:"
	read -s SENHA

	echo "Adicionando novo usuário ($USUARIO) no sistema."
	adduser $USUARIO
	echo $SENHA | passwd $USUARIO --stdin
	if [ $? -eq 0 ]; then
		echo "O usuário $USUARIO adicionado com sucesso!"
	else
		echo "Náo foi possível adicionar o usuário no sistema!"
	fi
;;
2)
	clear
	echo "Digite o nome do usuário que deseja deletar"
	read USUARIO

	echo "Deletando o usuário ($USUARIO) do sistema"
	userdel $USUARIO

	if [ $? -eq 0 ]; then
		echo "Usuário $USUARIO deletado com sucesso!"
	else
		echo "Não foi possivel deletar o usuário no sistema!"
	fi
;;
3)
	clear
	/root/verifica.sh
;;
*) echo "Escolha uma opção válida: 1|2|3"
;;
esac
