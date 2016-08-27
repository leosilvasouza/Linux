#!/bin/bash
echo "Digite seu nome:"
read ALUNO
echo "Por favor, digite sua primeira nota:"
read n1
echo "Agora digite sua segunda nota:"
read n2
soma=$(echo "$n1 + $n2" | bc)
media=$(echo "scale=2;$soma / 2" | bc)

echo -e "A soma das notas totaliza '$soma' \nA sua media é '$media'"

if [ $media >= 7.0 ]; then
echo "Parabéns você foi APROVADO!!!"
else
echo "Sinto muito você foi REPROVADO :("
fi
