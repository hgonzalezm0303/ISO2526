#!/bin/bash
# Hugo González
# 4/2/2026
# Calculadora
if [ $# -ne 2 ]
then
	echo "El número de parámetros es incorrecto."
	exit
fi
if [ -f $1 ]
then
	echo "El fichero indicado ya existe."
	exit
fi
cont=1
ruta=$(realpath "$1")
while [ $cont -le $2 ]
do
	echo "Operación Op1 Op2"
	read op op1 op2
	case $op in
		S)
			res=$(($op1+$op2))
			echo "$op1 + $op2 = $res"
			cont=$(($cont+1))
			echo "$op $op1 $op2" >> $1
		;;
		R)
			res=$(($op1-$op2))
			echo "$op1 - $op2 = $res"
			cont=$(($cont+1))
			echo "$op $op1 $op2" >> $1
		;;
		M)
			res=$(($op1*$op2))
			echo "$op1 x $op2 = $res"
			cont=$(($cont+1))
			echo "$op $op1 $op2" >> $1
		;;
		D)
			res=$(($op1/$op2))
			resto=$(($op1%$op2))
			echo "$op1 : $op2 = $res"
			echo "El resto es $resto"
			cont=$(($cont+1))
			echo "$op $op1 $op2" >> $1
		;;
		X)
			echo "La ruta del fichero es $ruta"
			cat $1
			echo "Saliendo..."
			exit
		;;
		*)
			echo "Te has confundido, vuelve a intentarlo"
		;;
	esac
done
echo "La ruta del fichero es $ruta"
cat $ruta
