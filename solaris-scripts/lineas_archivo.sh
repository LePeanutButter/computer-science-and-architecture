#!/bin/sh
clear
echo "El numero de líneas del archivo /etc/profile es: $(wc -l /etc/profile | awk '{print $1}')"