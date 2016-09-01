#!/bin/bash

echo -n "Digite o arquivo: "
read ARQUIVO

test -d "$ARQUIVO" && echo "$ARQUIVO é um diretório" #se o valor digitado for um diretorio (-d )ele exibirá o texto (&&)
test -f "$ARQUIVO" && echo "$ARQUIVO é um arquivo" #se o valor digitado for um arquivo (-f) ele exibirá o texto (&&)

#Independente do resultado acima ele continuará a leitura do script

#Se o valor digitado sendo arquivo (-f) ou (-0) se o valor digitado sendo diretorio (-d) ele não executará o texto solicitado no echo ( || ) (O || é a expressão inversa de && 
test -f "$ARQUIVO" -o -d "$ARQUIVO" || echo "O arquivo '$ARQUIVO' não foi encontrado"
echo
