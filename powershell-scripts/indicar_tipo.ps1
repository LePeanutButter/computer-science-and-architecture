Clear-Host
if (-Not (Test-Path $args[1])) {
    Write-Output "La ruta $args[1] no existe."
    exit
}
$name = $args[0]
$path = $args[1]
$fullPath = Join-Path -Path $path -ChildPath $name
if (Test-Path $fullPath -PathType Leaf) {
    Write-Output "$fullPath es un archivo"
} elseif (Test-Path $fullPath -PathType Container) {
    Write-Output "$fullPath es un directorio"
} else {
    Write-Output "$fullPath es otro tipo de elemento"
}