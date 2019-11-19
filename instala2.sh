#!/bin/bash
#demo-menu shell script
#define variables
EDITOR=nano
PASSWD=/etc/passwd
RED='\033[0;41;30m]'
STD='\033[0;0;39m]'
#variables para guiardar o leido sobre el usuario LDAP
let dominio
let extension
let admin
#user defined function
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

one(){
 echo "Opcion uno, indica el nombre del dominio"
 read extension
 pause
}

two(){
 echo "Opcion uno, indica la extension del dominio"
 read admin
 pause
}

three(){
 echo "Opcion uno, indica el nombre del admin LDAP"
 read admin
 pause
}

show_menus(){
	echo "---------------------------"
	echo "-------MENU-LINEA de comandos-------"
	echo "---------------------------"
	echo "Bienvenido $admin al dominio $dominio.$extension"
	echo "1. Indicar nombre dominio"
	echo "2. Indicar extension del dominio"
	echo "4. Indicar el nombre del admini de OPENLDAP"
	echo "0. Exit"
}
#lee la accion sobre el teclado y la ejecuta
#invoca el () cuando el usuario selecciona 1 en el menu
#invoca a los dos() cuando el usuario selecciona 2 en el menu
#salir del menu cuando el usuario
read_options(){
	#creao una variable local, vive dentro de esta funcion y
	local choice
	#leo el teclado mostrando antes un mesje y lo leiso l
	read -p "Enter choice [ 1 - 0 ]" choice
	#en caso de que choice valga
	case $choice in
		1)one ;; #lanzo la funcion one
		2)two ;; #lanzo la funcion two
		3)three ;; #lanzo la funcion three
		0)exit 0 ;;
		*) echo -e "${RED}Error...${STD}" && sleep 2 #todo lo demas produce un error
	esac #fin del case
}
while true
do
	show_menus
	read_options
done
