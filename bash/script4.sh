#!/bin/bash

# Verificar el número de argumentos
if [ "$#" -ne 2 ]; then
  echo "Este script requiere exactamente dos argumentos: origen y destino."
  exit 1
fi

origen="$1"
destino="$2"

# Verificar si el origen es un archivo existente
if [ ! -f "$origen" ]; then
  echo "El archivo de origen '$origen' no existe."
  exit 1
fi

# Copiar el archivo de origen al destino
cp "$origen" "$destino"

echo "El archivo '$origen' ha sido copiado sobre '$destino'."
