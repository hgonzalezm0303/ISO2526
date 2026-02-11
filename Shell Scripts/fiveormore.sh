#!/bin/bash
# Hugo González
# 10/2/2026
# FiveOrMore
function autor(){
	echo "============================="
	echo "Autor: Hugo González Martínez"
	echo "============================="
}
function txt (){
	for f in $2/*.txt
	do
		lines=$(wc -l $f | cut -d " " -f1)
		words=$(wc -c $f | cut -d " " -f1)
		if [ "$lines" -ge "5" ]
		then
			
			echo $f >> $1
			echo "$f tiene más de 5 líneas."
			echo "================================" >> $f.q.
			echo "El fichero tiene $words palabras." >> $f.q.
			echo "================================" >> $f.q.
			cat $f >> $f.q.
		fi
	done
}
clear

if [ $# != "2" ]
then
	echo "El número de parámetros no es correcto"
	exit
fi
if [ -f $1 ]
then
	echo "El fichero ya existe"
	exit
fi
if [ ! -d $2 ]
then
	echo "El directorio no existe"
	exit
fi
if [ -z $2 ]
then
	echo "El directorio está vacío"
	exit
fi
autor 
txt $1 $2
files=$(wc -l $1 | cut -d " " -f1)
echo "Han sido identificados un total de $files ficheros." >> $1
