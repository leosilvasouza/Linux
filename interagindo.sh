#!/bin/bash
#sistema - script que mostra informações sobre o sistema
#Autor: Leonardo Souza

#Pede uma confirmação do usuário antes de executar
echo "Buscar dados do sistema? [s ou n]"
read RESPOSTA

#Se ele digitou 'n', script é interrompido
test "$RESPOSTA" = "n" && exit

#O date mostra a data e a hora correntes
echo "Data e Horário:"
date
echo

#O df mostra as partições e quanto cada uma ocupa no disco
echo "Uso do disco:"
df
echo

#O w mostra os usuários que estão conectados na máquina
echo "Usuários conectados:"
w
