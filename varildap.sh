#!/bin/bash
let varuid
let varou
let vardc
let vardc2
read -p "di la uid" varuid
read -p "di la ou" varou
read -p "di la dc" vardc
read -p "di la dc2" vardc2
#varuid=pilotodos
#varou=pilotos
#vardc=korriban
#vardc2=sith
echo "dn: uid="$varuid",ou="$varou",dc="$vardc",dc="$vardc2 >>  ./prueba.ldif
echo "ObjectClass: inetOrgPerson"  >>  ./prueba.ldif
echo "ObjectClass: posixAccount"  >>  ./prueba.ldif
echo "ObjectClass: shadowAccount"  >>  ./prueba.ldif
echo "cn: "$varuid  >>  ./prueba.ldif
echo "sn: "$varuid  >>  ./prueba.ldif
echo "uid: "$varuid  >>  ./prueba.ldif
echo "uidNumber: "3000  >>  ./prueba.ldif
echo "gidNumber: "3000  >>  ./prueba.ldif
echo "userPassword: "$varuid  >>  ./prueba.ldif
echo "homeDirectory: /home/"$varuid  >>  ./prueba.ldif
echo "loginShell: /bin/bash"  >>  ./prueba.ldif
echo "gecos: "$varuid  >>  ./prueba.ldif
echo "descripcion: User account"  >>  ./prueba.ldif
exit 0



