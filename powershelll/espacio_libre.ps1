# Parámetro: Porcentaje mínimo de espacio libre
$porcentajeMinimoEspacioLibre = 150

# Obtener la lista de discos duros del sistema
$discos = Get-WmiObject Win32_LogicalDisk | Where-Object {$_.DriveType -eq 3}

# Recorrer y mostrar los discos con porcentaje de espacio libre inferior al valor dado
foreach ($disco in $discos) {
    # Calcular el porcentaje de espacio libre
    $porcentajeEspacioLibre = ($disco.FreeSpace / $disco.Size) * 100

    # Verificar si el porcentaje de espacio libre es inferior al mínimo
    if ($porcentajeEspacioLibre -lt $porcentajeMinimoEspacioLibre) {
        # Obtener la letra de la unidad, el espacio libre y el tamaño en GB sin decimales
        $letraUnidad = $disco.DeviceID
        $espacioLibreGB = [math]::Round($disco.FreeSpace / 1GB, 0)
        $tamanioGB = [math]::Round($disco.Size / 1GB, 0)

        # Imprimir la información del disco
        Write-Host "Unidad: $letraUnidad"
        Write-Host "Espacio libre: $espacioLibreGB GB"
        Write-Host "Tamaño: $tamanioGB GB"
        Write-Host "Porcentaje de espacio libre: $porcentajeEspacioLibre%"
        Write-Host
    }
}
