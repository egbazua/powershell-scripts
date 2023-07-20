# Autor: Enrique Gómez Bazúa

<# Escribe un script que muestre un listado de los ficheros
 del directorio actual que ocupe más de 1024 bytes. #>

$files = Get-ChildItem -File | Where-Object { $_.Length -gt 1024 }

if ($files.Count -gt 0) {
    Write-Host "Archivos con más de 1024 bytes en el directorio actual:"
    
    foreach ($file in $files) {
        Write-Host "- $file.Name (Tamaño: $($file.Length) bytes)"
    }
} else {
    Write-Host "No se encontraron archivos con más de 1024 bytes en el directorio actual."
}
