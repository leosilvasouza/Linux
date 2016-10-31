#!/bin/bash

if [ "$#" -ne 2 ]; then
        echo "Digite seguindo exemplo ./insertmysql.sh usuário senha"
        exit 1;
fi
 
usuario=$1
senha=$2
 
mysql -u root -pPASSWORD -e "use sftpdb;
  
insert into rcvault (user,password) values ('$usuario','$senha');"
 
echo -e "Usuário $usuario adicionado com sucesso no banco"

