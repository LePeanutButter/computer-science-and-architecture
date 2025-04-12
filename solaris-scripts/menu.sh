#!/bin/sh
while true; do
    clear
    printf "Menu de opciones:\n"
    printf "1) Hello World\n"
    printf "2) Contar lineas de un archivo\n"
    printf "3) Buscar palabra en un archivo\n"
    printf "4) Consultar usuarios creados"
    printf "5) Buscar archivos basado en sus atributos\n"
    printf "6) Salir\n"
    printf "Seleccione una opción: "
    read -r opcion

    case $opcion in
        1) ./hello_world.sh;;
        2) ./lineas_archivo.sh;;
        3) printf "Ingrese la palabra: "
           read -r palabra
           printf "Ingrese el archivo: "
           read -r archivo
           ./buscar_palabra.sh "$palabra" "$archivo";;
        4) ./consulta_usuarios.sh;;
        5) printf "Ingrese el directorio: "
           read -r directorio
           printf "Ingrese el atributo: "
           read -r atributo
           ./buscar_archivo.sh "$directorio" "$atributo";;
        6) exit;;
        *) echo "Opción no válida";;
    esac
    printf "Presione Enter para continuar..."
    read -r _
done