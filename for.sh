#!/bin/bash

for i in 1 2 3 4 5; do
	echo $i;
done

#proximo script é identico ao primeiro contudo usa o seq = sequencia

for i in $(seq 5); do
	echo $i;
done
