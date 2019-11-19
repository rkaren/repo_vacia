#!/bin/bash
#set an infinite loop
while :
do
	echo "si pulsas 1 sigo"
	echo "si pulsas 2 sigo"
	echo "si pulsas 4 me voy"
	read -p "Elige [ 1 2 o 4 ]" loqueeligeeluser
	#make decision using case in esac
	case $loqueeligeeluser in
		1)
			echo "has elegido 1,vuelvo a preguntar"
			;;

		2)
			echo "has elegido 2,vuelvo a preguntar"
			;;
		4)
			echo "has elegido 4, me voy"
			exit 0 #salida ordenada del script
			;;
		*)
			echo "Error: eso ni es 1 ni 4, vulevo a preguntar"
	esac	#fin del case
done #hasta aqui el bucle while
echo "si ves esto, algo ha salido mal"

