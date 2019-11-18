#!/bin/bash
variableprimera=4
variablesegunda=6
let variabletercera #tambien puedo crear variables con let
echo $variableprimera + $variablesegunda
echo variableprimera + variablesegunda
((variabletercera = variableprimera+variablesegunda)) # las operaciones aritameticas van con (())
echo $variabletercera
exit 0 #termino con exito y asi lo señalo con eoxit 0, la segunda salida estandar del queda a 0
