#!/bin/bash
# Hugo González
# 29/1/2026
# Agenda.
while true
do
	echo "a) Añadir una entrada."
	echo "b) Buscar por dni."
	echo "c) Ver la agenda completa."
	echo "d) Eliminar todas las entradas de la agenda."
	echo "e) Finalizar"
	read opt
	case $opt in
		a) 
			echo "Dime el DNI de la persona a dar de alta."
			read dni
			exist=$(grep $dni agenda.txt | cut -d ":" -f1)
			if [ "$exist" == "$dni" ]
			then
				echo "El DNI $dni ya está registrado."
			else
				echo "Indique el nombre de la persona."
				read name
				echo "Ahora indique sus apellidos"
				read surname
				echo "Por último indique la localidad en la que vive"
				read city
				echo "$dni:$name:$surname:$city" >> agenda.txt
				echo "La persona ha sido registrada."
			fi
		;;
		b)
			echo "Dime el DNI que quieres buscar."
			read dni
			exist=$(grep $dni agenda.txt | cut -d ":" -f1)
			if [ "$exist" == "$dni" ]
			then
				name=$(grep $dni agenda.txt | cut -d ":" -f2)
				surname=$(grep $dni agenda.txt | cut -d ":" -f3)
				city=$(grep $dni agenda.txt | cut -d ":" -f4)
				echo "La persona con DNI número $dni es: $name $surname, y vive en $city"
			else
				echo "El DNI introducido es inválido o no se encuentra."
			fi
		;;
		c)
			if [ -s agenda.txt ]
			then
				cat agenda.txt
			else
				echo "Agenda vacía."
			fi
		;;
		d)
			echo "Borrando agenda"
			> agenda.txt
		;;
		e)
			echo "Saliendo del programa..."
			exit
		;;
	esac
done
