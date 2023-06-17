#!/bin/bash

# Verificar si se proporcionó una ruta como argumento
if [ -z "$1" ]; then
  echo "Por favor, proporciona una ruta como argumento."
  exit 1
fi

ruta="$1"

# Verificar el tipo de archivo
if [ -f "$ruta" ]; then
  echo "$ruta es un archivo normal."
elif [ -d "$ruta" ]; then
  echo "$ruta es un directorio."
else
  echo "$ruta es otro tipo de archivo."
fi

# Ejecutar el comando 'ls' en formato largo
ls -l "$ruta"
