while ($true) {
    Clear-Host
    Write-Output "Menu de opciones:"
    Write-Output "1) Hello World"
    Write-Output "2) Contar lineas de un archivo"
    Write-Output "3) Buscar palabra en un archivo"
    Write-Output "4) Consultar usuarios creados"
    Write-Output "5) Buscar archivos basado en sus atributos"
    Write-Output "6) Salir"
    $opcion = Read-Host "Seleccione una opcion"

    switch ($opcion) {
        1 { 
            if (Test-Path ".\hello_world.ps1") {
                .\hello_world.ps1 
            } else {
                Write-Output "El script hello_world.ps1 no existe."
            }
        }
        2 { 
            if (Test-Path ".\lineas_archivo.ps1") {
                .\lineas_archivo.ps1 
            } else {
                Write-Output "El script lineas_archivo.ps1 no existe."
            }
        }
        3 { 
            $palabra = Read-Host "Ingrese la palabra"
            $archivo = Read-Host "Ingrese el archivo"
            if (Test-Path ".\buscar_palabra.ps1") {
                .\buscar_palabra.ps1 $palabra $archivo
            } else {
                Write-Output "El script buscar_palabra.ps1 no existe."
            }
        }
        4 { 
            if (Test-Path ".\consulta_usuarios.ps1") {
                .\consulta_usuarios.ps1 
            } else {
                Write-Output "El script consulta_usuarios.ps1 no existe."
            }
        }
        5 {
            $directorio = Read-Host "Ingrese el directorio"
            $atributo = Read-Host "Ingrese el atributo"
            if (Test-Path ".\buscar_archivos.ps1") {
                .\buscar_archivos.ps1 $directorio $atributo
            } else {
                Write-Output "El script buscar_archivos.ps1 no existe."
            }
        }
        6 { exit }
        default { Write-Output "Opcion no valida" }
    }
    Pause
}