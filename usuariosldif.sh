 #!/bin/bash
  #ingreso de usuarios de dominio establecido alderaan
  #variable q almacena linea a linea e inserta tbn linea a linea
  let fila
  #archivo CSV a leer con cat
  #bucle para leer campos
  #IFS  es separador interno de campo como en /etc/passwd hay :
  # leera read user uid gid 
  # determinamos q mientras IFS=, leer num usua, usu grupusu
  cat archivito.csv |  while IFS=, read numusu usu grupusu
  do
  # para separar cada declaracion de usuario en el archivo ldif
   printf "\n" >>usuarios.ldif
  #y reemplaza el valorvariable en cada linea del formato Ldif para luego pasarlo a la variable contenedoora fila
  fila="dn: uid=$usu,ou=people,dc=alderaan,dc=ally"
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


