# Obtener la fecha actual en formato año, mes, día
$fechaActual = Get-Date -Format "yyyyMMdd"

# Obtener la lista de archivos JPG en el directorio actual
$archivos = Get-ChildItem -Path $PWD -Filter "*.jpg"

# Recorrer y renombrar los archivos
foreach ($archivo in $archivos) {
    # Obtener el nombre del archivo sin la extensión
    $nombreArchivo = $archivo.BaseName
    # Obtener la extensión del archivo
    $extension = $archivo.Extension
    # Crear el nuevo nombre de archivo con el prefijo de fecha
    $nuevoNombre = "$fechaActual-$nombreArchivo$extension"
    # Renombrar el archivo
    Rename-Item -Path $archivo.FullName -NewName $nuevoNombre
    Write-Host "El archivo $($archivo.Name) ha sido renombrado a $nuevoNombre"
}
