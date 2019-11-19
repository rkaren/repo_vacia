#!/bin/bash
if [ $1 -gt 100 ] #si lo que hay en $1, es Greater than 100
then
echo es un numero grande 
#else 
#echo es un numero pequeño
fi #indica que ya estoy dentro del if

if [ $1 -lt 100 ] #si lo que hay en $1, es Greater than 100
then
echo es un numero pequeño
fi

exit 0

