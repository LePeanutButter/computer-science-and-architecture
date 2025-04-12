Clear-Host
$archivo = "C:\Windows\System32\drivers\etc\hosts"
if (-Not (Test-Path $archivo)) {
    Write-Output "El archivo $archivo no existe."
    exit
}
$lineas = (Get-Content $archivo).Count
Write-Output "El numero de lineas del archivo $archivo es: $lineas"