#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Utilizar: $0 <archivo>"
	exit 1
fi

archivo=$1

if [ ! -e "$archivo" ]; then
	echo "El archivo no existe. Reviselo."
	exit 1
fi

# Queremos saber el propietario del archivo

owner=$(stat -c "%U" "$archivo")
grupo=$(stat -c "%G" "$archivo")
perm=$(ls -l "$archivo" | awk '{print $1}')


perm_owner=$(echo "$perm" | cut -c2-4)
perm_grupo=$(echo "$perm" | cut -c5-7)
perm_otros=$(echo "$perm" | cut -c8-10)

usuarios=$(getent passwd | awk -F: '$3 >= 1000 {print $1}')

for usuario in $usuarios; do
	if [ "$usuario" == "$owner" ]; then
		echo "$usuario, $perm_owner"
	elif id -nG "$usuario" | grep -qw "$grupo"; then
		echo "$usuario, $perm_grupo"
	else
		echo "$usuario, $perm_otros"
	fi
done





