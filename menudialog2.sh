#!/bin/bash
#script para poder leer entradas
#archivo temporal donde guardar lo que vamos leyendo
#INPUT=/tmp/menu.sh.$$
#INPUT=/tmp/menu.sh.$$
#OUTPUT=/tmp/output.sh.$$
#OUTPUT=/tmp/output.sh.$$

#variable que coge lo que se ingresa en cada opcion(por ende en cada funcion)
#function_admin
let administrador
#function_servidor
let controladordc
#function extension
let extension
#function selectcsv
let csvarchivo


#nombre del admin llama a esta
function_admin(){
   	OUTPUT="/tmp/input.txt"
	#dibuja el submenu para ingresar admin
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

# nombre del controlador del dominio se llama a
function_controlador(){
    OUTPUT="/tmp/input.txt"
    # Dibuja el submenu inputbox controlador
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
    controladordc=$name
}

function_extension(){
    OUTPUT="/tmp/input.txt"
    # Dibuja el submenu inputbox extension
    dialog --title "La extension del dominio" \
    --backtitle "PROGRAMA PARSEADOR" \
    --inputbox "Indica la extension del dominio" 8 60 2>$OUTPUT
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
function_selectcsv(){
 OUTPUT="/tmp/input.txt"
    # Dibuja submenu inputbox para seleccionar archivo csv
    dialog --title "El nombre del archivo csv" \
    --backtitle "PROGRAMA PARSEADOR" \
    --inputbox "Indica nombre del archivo CSV" 8 60 2>$OUTPUT
    # lee lo que se esta escribiendo
    respose=$?
    # lee lo que  escribe Y ASIGNA A 
    name=$(<$OUTPUT)
    # Entra en el case
    case $respose in
      0) echo "hola $name" ;;
      1) echo "Cancel pressed." ;;
      255) echo "[ESC] key pressed."
    esac
    rm /tmp/input.txt
    csvarchivo=$name

}

function_csvarchivo(){
  #ingreso de usuarios de dominio establecido alderaan
  #variable q almacena linea a linea e inserta tbn linea a linea
  let fila
  #archivo CSV a leer con cat muestra100curada.csv lo reemplazamos x el q  ahora sera seleccionado
  #declarado arriba E INGRESADO EN EL SUBMENU  selectcsv
  cat $csvarchivo
  #bucle para leer campos
  #IFS  es separador interno de campo como en /etc/passwd hay :
  # leera read user uid gid 
  # determinamos q mientras IFS=, leer num usua, usu grupusu
  while IFS=, read numusu usu grupusu
  do
  # para separar cada declaracion de usuario en el archivo ldif
   printf "\n" >>usuarios.ldif
  #y reemplaza el valorvariable en cada linea del formato Ldif para luego pasarlo$
  #traemos 2 datos funciones controladordominio y extension
  fila="dn: uid=$usu,ou=people,dc=$controladordc,dc=$extension"
  #quien luego es redireccionada al archivo usuarios.ldif
  echo $fila >>usuarios.ldif
  fila="objectClass: inetOrgPerson"
  echo $fila >>usuarios.ldif
  fila="objectClass: posixAccount"
  echo $fila >>usuarios.ldif
  fila="objectClass: shadowAccount"
  echo $fila >>usuarios.ldif
  fila="cn: $usu"
  echo $fila >>usuarios.ldif
  fila="sn: $usu"
  echo $fila >>usuarios.ldif
  fila="uid: $usu"
  echo $fila >>usuarios.ldif
  fila="uidNumber: $numusu"
  echo $fila >>usuarios.ldif
  fila="gidNumber: $grupusu"
  echo $fila >>usuarios.ldif
  fila="userPassword: $usu"
  echo $fila >>usuarios.ldif
  fila="homeDirectory: /home/$usu"
  echo $fila >>usuarios.ldif
  fila="loginShell: /bin/bash"
  echo $fila >>usuarios.ldif
  fila="gecos: $usu"
  echo $fila >>usuarios.ldif
  fila="description: User account"
  echo $fila >>usuarios.ldif
  done
exit 0
}

#dibuja  menu principal
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
		Nombre) echo "Elegiste nombre"; function_admin;;
		Servidor) echo "Elegiste servidor"; function_controlador;;
		Extension) echo "Elegiste extension";function_extension;;
		Origen) echo "Elegiste origen";function_csvarchivo;;
		Exit) echo "Bye"; break;;
	esac
}
#salir=7
#while [ $salir -eq 7 ]
while true
do
	function_menu
done


