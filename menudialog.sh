#!/bin/bash
#script para poder leer entradas
#archivo temporal donde guardar lo que vamos leyendo
#INPUT=/tmp/menu.sh.$$
INPUT=/tmp/menu.sh.$$
#OUTPUT=/tmp/output.sh.$$
OUTPUT=/tmp/output.sh.$$

#>$OUTPUT


#dibuja el InputBox
#while true
#do
dialog --title "PROGRAMA -- PRINCIPAL" \
--backtitle "PROGRAMA PARSEADOR" \
--menu "Elige una opcion"  15 50 4 \
	Nombre "indica el nombre del admin LDAP" \
	Servidor "Indica el nombre sel servidor" \
	Extension "Indica su extension" \
	Origen "Indica el nombre del fichero CSV  a leer" \
	Salir "Salir del Script" 2> "${INPUT}"

#lee lo q escriben
menuitem=$(<"${INPUT}")
#name=$(<$OUTPUT)


#entra en el case
case $menuitem in
	NOMBRE) echo "Elegiste nombre";;
	SERVIDOR) echo "Elegiste servidor";;
	EXTENSION) echo "Elegiste extension";;
	NOMBRE) echo "Elegiste origen";;
	EXIT) echo "Bye"; break;;
esac
#done



