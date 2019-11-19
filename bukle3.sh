#!/bin/bash
#set an infinite loop
funcion_dibujar(){
	echo "Pulsa 1 para ingresar la uid: "  
	echo "pulsa 2 para ingresar la unidad organizativa: "
	echo "Pulsa 3 para ingresar el controlador del dominio: "
	echo "Pulsa 4 para ingresar el controlador del dominio: "
	echo "pulsa 5  para salir"
}
funcion_read(){
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
			echo "Error: eso ni es 1 ni 5, vulevo a preguntar"
	esac	#fin del case
}
while :
do
	

done #hasta aqui el bucle while
echo "si ves esto, algo ha salido mal"

