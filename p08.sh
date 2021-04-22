#!/bin/bash
# Ferran Sousa Lorente

clear

if (( $EUID != 0 ))
then
	echo "Aquest script ha de ser executat com a root"
	exit 1
fi

cat /etc/fstab | grep '^UUID=' | cut -d " " -f 1
awk 'BEGIN {count=0;} /^UUID=/ {count+=1;} END {printf "%d UUIDs trobats\n",count;}' /etc/fstab

exit 0
