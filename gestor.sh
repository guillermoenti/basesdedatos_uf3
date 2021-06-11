#!/bin/bash

DEBUG="1"

clear

echo "Interfaz de gestoría de Amongmeme"
echo "================================="

echo "¿Qué quieres hacer?"
echo "-------------------"

echo "1.- Mostrar personajes"
echo "2.- Mostrar items"
echo "3.- Crear personaje"
echo "4.- Crear item"
echo "5.- Dar item a personaje"
echo "6.- Eliminar personaje"
echo "Q.- Salir"
echo "--------------------"

read INPUT

clear

if [ "$INPUT" == "Q" ] || [ "$INPUT" == "Q" ] || [ "$INPUT" == "" ]; then

	echo "Bai pues"
	exit 0

fi

if [ "$INPUT" == "1" ]; then

	echo "Personajes:"
	echo "==========="

	echo "select id_character, name from characters" | mysql -u enti -penti amongmeme

elif [ "$INPUT" == "2" ]; then 

	echo "Inventario"
	echo "=========="
	echo "¿De qué personaje quieres ver el inventario?"

	read CHAR_ID

	if [ "$CHAR_ID" == "" ]; then

	echo "Has de introducir algún valor"
	exit 1

	fi

	QUERY="select * from char_item where id_character=$CHAR_ID" 
	echo $QUERY | mysql -u consulta amongmeme | cut -d $'\t' -f 4

elif [ "$INPUT" == "3" ]; then

	echo "Creación de personaje:"
	echo "======================"

	echo -n "Nombre del personaje: "
	read NAME

	echo -n "Edad del personaje: "
	read AGE

	echo -n "Puntos de vida del personaje: "
	read HP

	echo -n "Género del personaje [(M)ale, (F)emale, (N)on binary), (O)thers]: "
	read GENDER

	echo -n "Estilo de combate del personaje [(M)elee, (R)anged]: "
	read STYLE

	echo -n "Puntos de maná del personaje: "
	read MANA

	echo -n "Clase del personaje [(WA)rrior, (WI)zard, (RA)nger, (PA)ladin]: "
	read CLASS

	echo -n "Raza del personaje [(HU)man, (UN)dead, (LO)xodon, (CY)borg]: "
	read RACE

	echo -n "Puntos de experiencia del persoanje: "
	read XP

	echo -n "Nivel del personaje: "
	read LEVEL

	echo -n "Altura del personaje: "
	read HEIGHT

	QUERY="INSERT INTO characters (name, age, hp, gender,"
	QUERY="$QUERY style, mana, class, race, xp, level, height)"	
	QUERY="$QUERY VALUES ('$NAME', $AGE, $HP, '$GENDER',"
	QUERY="$QUERY '$STYLE', $MANA, '$CLASS', '$RACE', $XP, $LEVEL, $HEIGHT)" 
	
	if [ "$DEBUG" == "1" ]; then
		echo $QUERY
	fi

	echo $QUERY | mysql -u gestor amongmeme
	

#elif [ "$INPUT" == "4" ]; then



elif [ "$INPUT" == "5" ]; then

	echo "SELECT id_item, item FROM items" | mysql -u gestor amongmeme

	echo "Selecciona el ID del Item que quieres dar: "
	read ID_ITEM


	echo "SELECT id_character, name FROM characters" | mysql -u gestor amongmeme

	echo "Selecciona el ID del Personaje al que quieres dar el item: "
	read ID_CHARACTER

	QUERY="INSERT INTO characters_items (id_character, id_item)"
	QUERY="$QUERY VALUES ($ID_CHARACTER, $ID_ITEM)"
	echo $QUERY | mysql -u gestor amongmeme


elif [ "$INPUT" == "6" ]; then

	echo "Introduce el nombre de personaje a borrar: "
	read CHARACTER


	CHAR_NUMBER=`echo -n "$CHARACTER" | wc -m`

	if [ $CHAR_NUMBER -lt 4 ]; then
		echo "Error, nombre de personaje demasiado corto."
		return 1
	fi
	
	echo "DELETE FROM CHARACTERS WHERE name LIKE '$CHARACTER'" | mysql -u enti -penti amongmeme

else
	echo "Opción incorrecta"

fi
