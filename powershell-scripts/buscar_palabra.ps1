Clear-Host
if (-Not (Test-Path $args[1])) {
    Write-Output "El archivo $args[1] no existe."
    exit
}
Select-String -Pattern $args[0] -Path $args[1]