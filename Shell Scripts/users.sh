#!/bin/bash
# Hugo González
# 12/2/2026
# Users
clear
fecha=$(date +"%d-%m-%y")
hour=$(date | cut -d " " -f5)
lines=$(cat /etc/passwd)
counter=0
if [ ! $UID -eq 0 ]
then
	echo "No eres root."
	exit
fi
if [ $# -gt 1 ]
then
	echo "El número de parámetros sobrepasa el límite."
	exit
fi
if [ $# -eq 1 ]
then
	ref=$1
else
	ref=1000
fi
echo "========================================="
echo "Informe de usuarios el día $fecha a las $hour"
for l in $lines
do
	num=$(echo "$l" | cut -d ":" -f3)
	name=$(echo "$l" | cut -d ":" -f1)
	if [ "$num" -ge "$ref" ] 2>/dev/null
	then
		echo "$name - $num"
		counter=$(($counter++1))
	fi
done < /etc/passwd
echo "Total: $counter usuarios."
echo "========================================="
echo "$fecha - $hour - El usuario $USER ha solicitado un informe de usuarios" > /tmp/logeventos		
