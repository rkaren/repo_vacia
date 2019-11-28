#!/bin/bash
#script para poder leer entradas
#archivo temporal donde guardar lo que vamos leyendo
#INPUT=/tmp/menu.sh.$$
#INPUT=/tmp/menu.sh.$$
#OUTPUT=/tmp/output.sh.$$
#OUTPUT=/tmp/output.sh.$$

#variable que coge lo que se ingresa en cada opcion
salir=7
let administrador
let servidor
let extension
#let csvarchivo


#nombre del admin llama a esta
function_admin(){
   	OUTPUT="/tmp/input.txt"
	#ingresamos admin
	dialog --title "Ingresa el nombre del administrador OpenLDAP" \
	--backtitle "PROGRAMA PARSEADOR" \
	--inputbox "Indica el nombre del administrador OpenLDAP" 8 60 2>$OUTPUT
	#lee lo q se escribe
	respose=$?
	#lee lo q hay en output usando redirect $output
	name=$(<$OUTPUT)
	#entra en el case
	case $respose in
		0)echo "$hola $name" ;;
		1) echo "cancel pressed" ;;
		255) echo "[ESC] key pressed"
	esac
	rm /tmp/input.txt
	#y almacenamos lo recibido en
	administrador=$name
}

# nombre del servidor llama a
function_servidor(){
    OUTPUT="/tmp/input.txt"
    # Dibuja el InpuntBox
    dialog --title "El servidor del dominio" \
    --backtitle "PROGRAMA PARSEADOR" \
    --inputbox "Indica nombre del controlador del dominio" 8 60 2>$OUTPUT
    # lee lo que se esta escribiendo
    respose=$?
    # lee lo que  escribe
    name=$(<$OUTPUT)
    # Entra en el case
    case $respose in
      0) echo "hola $name" ;;
      1) echo "Cancel pressed." ;;
      255) echo "[ESC] key pressed."
    esac
    rm /tmp/input.txt
    servidor=$name
}

function_extension(){
    OUTPUT="/tmp/input.txt"
    # Dibuja el InpuntBox
    dialog --title "La segunda parte del nombre del dominio" \
    --backtitle "Parseador de CSV a LDIP" \
    --inputbox "Indica la segunda parte del nombre de tu dominio (ally, local)" 8 60 2>$OUTPUT
    # lee lo que está escribiendo el usuario
    respose=$?
    # lee lo que hay en OUTPUT  y lo redirige
    name=$(<$OUTPUT)
    # Entra en el case
    case $respose in
      0) echo "hola $name" ;;
      1) echo "Cancel pressed." ;;
      255) echo "[ESC] key pressed."
    esac
    rm /tmp/input.txt
    extension=$name
}


#dibuja  menu
function_menu(){
	INPUT=/tmp/menu.sh.$$
        dialog --clear --title "PROGRAMA -- PRINCIPAL" \
	--backtitle "PROGRAMA PARSEADOR" \
	--menu "Elige una opcion" 20 50 10 \
		Nombre "indica el nombre del admin LDAP" \
		Servidor "Indica el nombre sel servidor" \
		Extension "Indica su extension" \
		Origen "Indica el nombre del fichero CSV  a leer" \
		Salir "Salir del Script" 2> "${INPUT}"

	#lee lo q escriben
	menuitem=$(<"${INPUT}")
	#name=$(<$OUTPUT)
	echo $menuitem
	#entra en el case
	case $menuitem in
		NOMBRE) echo "Elegiste nombre"; function_admin;;
		SERVIDOR) echo "Elegiste servidor"; function_servidor;;
		EXTENSION) echo "Elegiste extension";;
		ORIGEN) echo "Elegiste origen";;
		EXIT) echo "Bye"; break;;
	esac
}

while [ $salir -eq 7 ]
do
	function_menu;
done


