#!/bin/bash

# Verificar si se proporcionó un archivo como argumento
if [ -z "$1" ]; then
  echo "Por favor, proporciona un archivo como argumento."
  exit 1
fi

archivo="$1"
extension="${archivo##*.}"

# Convertir la extensión a minúsculas para hacer la comparación
extension="${extension,,}"

if [ "$extension" = "jpg" ]; then
  destino="$HOME/fotos"
  cp "$archivo" "$destino"
  echo "El archivo $archivo ha sido copiado en la carpeta $destino."
else
  echo "El archivo $archivo no es un archivo JPG."
fi
