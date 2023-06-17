function Mostrar-Menu {
    Clear-Host
    Write-Host "Menu Principal"
    Write-Host "1. Listar los servicios arrancados."
    Write-Host "2. Mostrar la fecha del sistema."
    Write-Host "3. Ejecutar el Bloc de notas."
    Write-Host "4. Ejecutar la Calculadora."
    Write-Host "5. Salir."
    Write-Host
    $opcion = Read-Host "Selecciona una opcion (1-5)"
    Ejecutar-Opcion -Opcion $opcion
}

function Ejecutar-Opcion {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateRange(1,5)]
        [int]$opcion
    )

    switch ($opcion) {
        1 {
            Get-Service | Where-Object {$_.Status -eq "Running"} | Select-Object Name, Status
        }
        2 {
            [datetime]::Today.ToString('M-d-yyyy')
        }
        3 {
            Start-Process notepad
        }
        4 {
            Start-Process calc
        }
        5 {
            exit
        }
        default {
            Write-Host "Opcion no valida. Por favor, selecciona una opcion valida (1-5)"
        }
    }
}

do {
    Mostrar-Menu
    Write-Host
    Write-Host "Presiona Enter para volver al menu principal."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp")
} while ($true)
