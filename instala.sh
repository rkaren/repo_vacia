#!/bin/bash
#script para poder leer entradas
#archivo temporal donde guardar lo que vamos leyendo
OUTPUT="/tmp/input.txt"


#dibuja el InputBox
dialog --title "El nobre del admin LDAP" \
--backtitle "Parseador del CSV a lDIP" \
--inputbox "Indica el nombre del admin LDAD (suele ser admin)" 8 60 2>$OUTPUT

#lee lo que esta escribiendo el usuario
respose=$?

name=$(<$OUTPUT)
#entra en el case
case $respose in
#echo "MENU-LINEA DE COMANDOS"
echo $name
#echo "Bienvenido al dominio"
 # 0)echo  "Indicar nombre de dominio" ;;
 # 1)echo "Indicar extension del dominio" ;;
 # 2)echo "Indicar el nombre del admini de OPENLDAP" ;;
 # 3)echo "Exit" ;;
esac

rm /tmp/input.txt
