#!/bin/bash



clear

echo "Esto es el inventario de AmongMeme, the Game"
echo "============================================"

echo "¿Qué quieres hacer?"
echo "-------------------"

echo "1.- Mostrar Personajes"
echo "2.- Mostrar Inventario de un Personaje"
echo "3.- Salir"
echo "-------------------"

read INPUT

clear

if [ "$INPUT" == "3" ] || [ "$INPUT" == "" ]; then
	
	echo "Pos bai"
	exit 0

fi

if [ "$INPUT" == "1" ]; then

	echo "Personajes:"

	echo "select id_character,name from characters" | mysql -u consulta amongmeme 

elif [ "$INPUT" == "2" ]; then 

	echo "Inventario"
	echo "=========="
	echo "¿De qué personaje quieres ver el inventario?"

	read CHAR_ID

	if [ "$CHAR_ID" == "" ]; then

	echo "Has de introducir algún valor"
	exit 1

	fi

	echo "select * from char_item where id_character=$CHAR_ID" | mysql -u consulta amongmeme | cut -d $'\t' -f 4

else

	echo "Opción incorrecta"

fi

