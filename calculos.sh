#!/bin/bash
variableprimera=5
variablesegunda=3
#let variabletercera #tambien puedo crear variables con let
echo $variableprimera + $variablesegunda
echo variableprimera + variablesegunda
s=$((variableprimera + variablesegunda)) # las operaciones aritameticas van con (())
echo $s
exit 0 #termino con exito y asi lo señalo con eoxit 0, la segunda salida estandar del queda a 0
