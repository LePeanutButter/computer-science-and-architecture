Clear-Host
$currentUser = $env:USERNAME
$eventos = Get-EventLog -LogName Security |
    Where-Object { $_.Message -like "*An account failed to log on*" } |
    Select-Object TimeGenerated, ReplacementStrings
$contador = 0
if ($eventos.Count -gt 0) {
    Write-Output "Intentos fallidos para el usuario actual ($currentUser):"
    foreach ($evento in $eventos) {
        $usuarioEvento = $evento.ReplacementStrings[5]

        if ($usuarioEvento -eq $currentUser) {
            Write-Output "Fecha y Hora: $($evento.TimeGenerated)"
            $contador++
        }
    }
    Write-Output "Cantidad total de intentos fallidos: $contador"
} else {
    Write-Output "No se encontraron intentos fallidos para el usuario actual ($currentUser)."
}
