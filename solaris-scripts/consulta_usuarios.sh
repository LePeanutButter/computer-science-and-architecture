#!/bin/sh
awk -F: '{print $1, $5}' /etc/passwd > usuarios.txt