#!/bin/bash
#set an infinite loop
while :
do
	echo "Pulsa 1 para ingresar la uid: "  
	echo "pulsa 2 para ingresar la unidad organizativa: "
	echo "Pulsa 3 para ingresar el controlador del dominio: "
	echo "Pulsa 4 para ingresar el controlador del dominio: "
	read -p "Elige [ 1 2 3 4 o 5 ]" loqueeligeeluser
	#make decision using case in esac
	case $loqueeligeeluser in
		1)
			read -p  "escribe la uid: " varuid
			;;

		2)
			read -p "escribe la uo: " varuo
			;;
		3)
			read -p "escribe el dc: " vardc
			;;
		4)
			read -p "escribe dc2: " vardc2
			;;
		5)	
			echo "salir"
			exit 0 #salida ordenada del script
			;;
		*)
			echo "Error: eso ni es 1 ni 4, vulevo a preguntar"
	esac	#fin del case
done #hasta aqui el bucle while
echo "si ves esto, algo ha salido mal"

