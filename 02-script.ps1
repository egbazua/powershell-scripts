# Autor: Enrique Gómez Bazúa

<# Escribe un script que renombre todos los ficheros con
extensión JPG del directorio actual, añadiendo un prefijo
con la fecha en formato año, mes, día. Por ejemplo, un
fichero con nombre imagen1.jpg pasaría a llamarse 
20200413-image1.jpg, si el script se ejecuta el 13 de abril
del año 2020. #>

$fechaActual = Get-Date -Format "yyyyMMdd"

$archivosJPG = Get-ChildItem -Filter "*.jpg" -File

foreach ($archivo in $archivosJPG) {
    $nuevoNombre = "{0}-{1}" -f $fechaActual, $archivo.Name
    Rename-Item -Path $archivo.FullName -NewName $nuevoNombre
}

Write-Host "Se han renombrado los archivos con éxito."
