# Autor: Enrique Gómez Bazúa

<# Programa un script en PowerShell que muestre los discos
duros con un porcentaje de espacio libre inferior a un
paramétro dado. El script debe imprimir la letra de la
unidad y los valores en GB de espacio libre y tamaño sin
decimales. La expresión Get-WmiObject Win32_LogicalDisk
recupera la información de los discos del sistema. #>

param (
    [int]$porcentajeMinimoEspacioLibre
)

$discos = Get-WmiObject Win32_LogicalDisk | Where-Object { $_.DriveType -eq 3 }

function Convertir-BytesAGB {
    param (
        [int64]$bytes
    )
    $gb = $bytes / 1GB
    [int]$gb
}

foreach ($disco in $discos) {
    $espacioLibreGB = Convertir-BytesAGB $disco.FreeSpace
    $tamanoTotalGB = Convertir-BytesAGB $disco.Size
    $porcentajeEspacioLibre = ($disco.FreeSpace / $disco.Size) * 100

    if ($porcentajeEspacioLibre -lt $porcentajeMinimoEspacioLibre) {
        Write-Host "Unidad: $($disco.DeviceID)"
        Write-Host "Espacio libre: $espacioLibreGB GB"
        Write-Host "Tamano total: $tamanoTotalGB GB"
        Write-Host "Porcentaje de espacio libre: $($porcentajeEspacioLibre.ToString("N2"))%"
        Write-Host "-----------------------------"
    }
}

