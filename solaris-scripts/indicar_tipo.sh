#!/bin/sh
clear
if [ -f "$2/$1" ]; then
    echo "$1 es un archivo"
elif [ -d "$2/$1" ]; then
    echo "$1 es un directorio"
else
    echo "$1 es otro tipo de elemento"
fi