Clear-Host

if (-not (Test-Path $args[0])) {
    Write-Output "El directorio $($args[0]) no existe."
    exit
}
Get-ChildItem -Path $args[0] -File | ForEach-Object {
    $acl = Get-Acl $_.FullName
    foreach ($access in $acl.Access) {
        if ($access.FileSystemRights.ToString() -match $args[1]) {
            Write-Host "El archivo $($_.FullName) tiene el permiso $($args[1])"
            break
        }
    }
}