# Autor: Enrique Gómez Bazúa

<# Programa un script que muestre un menú con las siguientes
opciones, de manera que se ejecute la opción asociada al
número que introduzca el usuario: 

1. Listar los servicios arrancados.
2. Mostrar la fecha del sistema.
3. Ejecutar el Bloc de notas.
4. Ejecutar la Calculadora.
5. Salir.

#>

do {
    Write-Host "Menú de opciones:"
    Write-Host "1. Listar los servicios arrancados."
    Write-Host "2. Mostrar la fecha del sistema."
    Write-Host "3. Ejecutar el Bloc de notas."
    Write-Host "4. Ejecutar la Calculadora."
    Write-Host "5. Salir."

    $opcion = Read-Host "Introduce el número de la opción que deseas ejecutar"

    switch ($opcion) {
        1 {
            Get-Service | Where-Object { $_.Status -eq "Running" } | Format-Table Name, DisplayName, Status -AutoSize
        }
        2 {
            $fechaSistema = Get-Date | Out-String
            Write-Host "Fecha del sistema: $fechaSistema"
        }
        3 {
            Start-Process notepad.exe
        }
        4 {
            Start-Process calc.exe
        }
        5 {
            Write-Host "Saliendo del menú."
        }
        default {
            Write-Host "Opción no válida. Por favor, selecciona un número del 1 al 5."
        }
    }

    Write-Host "Presiona una tecla para continuar..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

    Clear-Host

} while ($opcion -ne "5")
