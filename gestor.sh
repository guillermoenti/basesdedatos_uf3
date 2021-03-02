#!/bin/bash

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
echo "6.- Salir"
echo "--------------------"

read INPUT

clear

if [ "$INPUT" == "6" ] || [ "$INPUT" == "" ]; then

	echo "Bai pues"
	exit 0

fi

if [ "$INPUT" == "1" ]; then

	echo "Personajes:"

	echo "select id_character, name from characters" | mysql -u gestor amongmeme

elif [ "$INPUT" == "2" ]; then

	echo "select id_item, item from items" | mysql -u gestor amongmeme

elif [ "$INPUT" == "3" ]; then

	echo "Nombre del personaje:"
	read NAME

	echo "Edad del personaje:"
	read AGE

	echo "Edad de nacimiento del personaje:"
	read BIRTHDATE

	echo "Puntos de vida del personaje:"
	read HP

	echo "Género del personaje:"
	read GENDER

	echo "Estilo de combate del personaje:"
	read STYLE

	echo "Puntos de maná del personaje:"
	read MANA

	echo "Clase del personaje:"
	read CLASS

	echo "Raza del personaje:"
	read RACE

	echo "Puntos de experiencia del persoanje:"
	read XP

	echo "Nivel del personaje:"
	read LEVEL

	echo "Altura del personaje:"
	read HEIGHT



	echo "insert into characters (name, age, birthdate, hp, gender, style, mana, class, race, xp, level, height) VALUES ('$NAME', $AGE, $BIRTHDATE, $HP, $GENDER, $STYLE, $MANA, $CLASS, $RACE, $XP, $LEVEL, $HEIGHT)" | mysql -u gestor amongmeme
	

elif [ "$INPUT" == "4" ]; then



elif [ "$INPUT" == "5" ]; then



else



fi
