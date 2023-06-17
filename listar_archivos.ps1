# Obtener la ruta del directorio actual
$directorioActual = Get-Location

# Obtener la lista de archivos en el directorio actual que ocupan más de 1024 bytes
$archivos = Get-ChildItem -Path $directorioActual | Where-Object {$_.Length -gt 1024}

# Mostrar el listado de archivos
$archivos | Select-Object Name, Length
