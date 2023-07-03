#!/bin/bash

# Verificar la cantidad de parámetros
if [ "$#" -ne 2 ]; then
  echo "Este script requiere exactamente dos parámetros."
  echo "Uso: $0 <archivo_origen> <archivo_destino>"
  exit 1
fi
#Obtener argumentos
archivo_origen="$1"
archivo_destino="$2"

# Verificar si el archivo de origen existe
if [ ! -f "$archivo_origen" ]; then
  echo "El archivo de origen '$archivo_origen' no existe."
  exit 1
fi

# Copiar el archivo de origen al archivo de destino
cp "$archivo_origen" "$archivo_destino"

echo "El archivo '$archivo_origen' ha sido copiado exitosamente a '$archivo_destino'."
