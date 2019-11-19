#!/bin/bash
#script para poder leer entradas
#archivo temporal donde guardar lo que vamos leyendo
OUTPUT="/tmp/input.txt"

#dibuja el InputBox
dialog --title "MENU DIALOG" \
--backtitle "Bienvenido al dominio" \
--menu "Escoge una opsion" 0 0 0 1 "Indica su extension" 2 "Indica su extension" 3 "indica el nombre del admin LDAP"
--inputbox "Indica el nombre del admin LDAD (suele ser admin)" 8 60 2>$OUTPUT

#lee lo que esta escribiendo el usuario
respose=$?

#lee lo que hay en output usando la redireccion $OUTPUT
name=$(<$OUTPUT)

#entra en el case
case $respose in
	0)echo "$name" ;;
esac

rm /tmp/input.txt
