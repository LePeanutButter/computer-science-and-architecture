try {
    Get-LocalUser | Select-Object Name, Description | Out-File usuarios.txt
} catch {
    Write-Output "Error al consultar usuarios locales."
}