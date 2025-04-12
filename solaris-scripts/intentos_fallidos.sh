#!/bin/sh
clear
grep "failed" /var/log/syslog | awk '{print $1, $2, $3}' | {
    total=0
    while read -r mes dia hora; do
        echo "Fecha: $mes $dia, Hora: $hora, Intento fallido."
        total=$((total + 1))
    done
    echo "Total de intentos fallidos: $total"
}