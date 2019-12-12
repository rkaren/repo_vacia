# repo_vacia
#Estudiante: KAREN MARTINEZ MENDOZA
#Repositorios para automatizar creación fichero .ldif 

Este repositorio contiene ejercicios basicos y preparatorios cuyo objetivo persigue crear un menu en dialog, que me permita ingresar informacion para la cabecera y cuerpo del fichero .ldif que sera de gran ayuda cuando necesitemos ingresar grandes cantidades de usuarios en un servidor de directorio LDAP, El objetivo de los ejercicios preparatorios se centra en 2 SCRIPTS: 

1)usuariosldif.sh-----> que permite parsear un archivo csv a un archivo ldif, el cual podremos usar en nuestro servidor ldap. 
2)menudialog2.sh----> que es quien contiene el menu principal, e incluye parte del codigo usuariosldif.sh para automatizar 
                      por completo nuestra solución.
 Asi mismo adjuntamos archivito.csv que contiene la informacion de ejemplo para realizar nuestras pruebas en ambos scripts.
 Y el archivo resultado usuarios.ldif  que contendra todas las lineas que involucra el formato del archivo LDIF para cada usuario contenido en nuestro csv, y finalmente ejecutarlo en nuestro servidor LDAP.
 
