#!/bin/bash
# Ferran Sousa Lorente

clear

if (( $EUID != 0 ))
then
	echo "Aquest script ha de ser executat com a root"
	exit 1
fi

regex='^[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\.[A-Za-z]{2,63}$'
echo -n "Especifiqui el correu electrònic: "
read email

if [[ $email =~ $regex ]]
then
	echo $email >> /etc/blackmail.list
	echo 'La direcció de correu ha estat introduït dins /etc/blackmail.list'
else
	echo "La direcció de correu introduït és incorrecte"
	exit 5
fi
exit 0
