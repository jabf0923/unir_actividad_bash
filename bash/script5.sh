#!/bin/bash

# Obtener la fecha actual en formato año, mes, día
fecha_actual=$(date +"%Y%m%d")

# Recorrer todos los archivos JPG en el directorio actual
for archivo in *.jpg; do
  # Verificar si el archivo es un archivo regular
  if [ -f "$archivo" ]; then
    # Obtener el nombre del archivo sin la extensión
    nombre_archivo="${archivo%.*}"
    # Obtener la extensión del archivo
    extension="${archivo##*.}"
    # Crear el nuevo nombre de archivo con el prefijo de fecha
    nuevo_nombre="${fecha_actual}-${nombre_archivo}.${extension}"
    # Renombrar el archivo
    mv "$archivo" "$nuevo_nombre"
    echo "El archivo $archivo ha sido renombrado a $nuevo_nombre"
  fi
done
