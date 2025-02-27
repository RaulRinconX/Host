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
permisos=$(ls -l "$archivo" | awk '{print $1}' | cut -c2-4)

echo "$owner, $permisos"


# Queremos saber la lista de usuarios con acceso

grupo=$(stat -c "%G" "$archivo")
permisos_grupo=$(ls -l "$archivo" | awk '{print $1}' | cut -c5-7)

for user in $(getent group "$grupo" | cut -d: -f4 | tr ',' ' '); do
	echo "$user, $permisos_grupo"
done






