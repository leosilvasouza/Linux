#!/bin/bash
echo "Digite o nome do usuário para consulta:"
read USUARIO

RESULTADO=$( getent passwd | grep ^$USUARIO | cut -d: -f1 )

test -z $RESULTADO
if [ $? -eq 0 ]; then
	echo "O usuário $USUARIO não existe!"
else
	echo "O usuário $USUARIO existe"	
fi
