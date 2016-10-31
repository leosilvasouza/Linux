#!/bin/bash
while true
do

echo -e "
	Escolha uma opção: Para não replicar oque subiu, recomendamos seguir os passos 1 e em seguida o 2.

	1 - Limpar repositório ./Downloads/uploadrcvault/*
	2 - Adicionar novo Batch de ./Downloads/uploadrcvalt para AWS/.../rcvault
	3 - Listar conteúdo de /Downloads/upload/rcvault/*
	4 - Sair
	
	"
read answer

case $answer in

1) clear
	echo -e "Você tem certeza que deseja limpar ./uploadrcvault? [1=SIM ou 2=Não]"
		read apagar

	if [ $apagar -eq '1' ]; then
	rm -fR /home/lsouza/Downloads/uploadrcvault/*.*
	echo -e "Comando executado com sucesso"
		elif [ $apagar -eq '2' ]; then
			echo -e "Limpeza cancelada"
				else
					echo -e "Escholha uma opção válida S ou N "
	fi
;;

2) clear
	echo -e "O arquivo Batch_****.zip já foi copiado para ./uploadrcvault? [1=S ou 2=N]"
	read adicionar

	if [ $adicionar -eq '1' ]; then
	scp /home/lsouza/Downloads/uploadrcvault/* lsouza@rcvault.easytaxi.com.br:/home/lsouza/
	echo -e "Comando executado com sucesso"
		elif [ $adicionar -eq '2' ]; then
			echo -e "Upload de arquivo(s) cancelado pelo operador!"
				else
					echo -e "Upload cancelado"
	fi
	exit
;;

3) clear
	ls -l /home/lsouza/Downloads/uploadrcvault/
	exit
;;

4) exit
;;
*) echo "Escolha uma opção válida: 1 | 2 | 3"
;;
esac
done
