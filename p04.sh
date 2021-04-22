#!/bin/bash
# Ferran Sousa Lorente

clear

if (( $EUID != 0 ))
then
	echo "Aquest script ha de ser executat com a root"
	exit 1
fi

numero=0

while [ $numero = 0 ]
do
	echo -n "Especifiqui el nom del fitxer dins /etc: "
	read fitxer

	if [[ -e /etc/$fitxer ]]
	then
		cp /etc/$fitxer /etc/$fitxer.orig
		gzip /etc/$fitxer.orig
		mida=$(ls -ls /etc/$fitxer.orig.gz | cut -d " " -f 6)
		echo "La mida del fitxer /etc/$fitxer.orig.gz és $mida"
	else
		echo 'El fitxer no existeix'
	fi

	echo -n 'Vol continuar? '
	read continuar
	if [[ $continuar = 0 ]]
	then
		numero=0
	else
		numero=1
	fi
done

exit 15
