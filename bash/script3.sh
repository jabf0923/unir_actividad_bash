#!/bin/bash

# Imprimir el nombre del script que se está ejecutando
echo "Nombre del script: $0"

# Imprimir el número de argumentos que se han pasado al script
echo "Número de argumentos: $#"

# Imprimir el primer y segundo argumentos en la misma línea
echo "Primer y segundo argumento: $1 $2"

# Imprimir los argumentos a partir del tercero en líneas separadas, si existen
if [ "$#" -gt 2 ]; then
  echo "Argumentos a partir del tercero:"
  for ((i=3; i<=$#; i++)); do
    echo "${!i}"
  done
fi
