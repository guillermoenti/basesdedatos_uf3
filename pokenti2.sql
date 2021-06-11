DROP DATABASE IF EXISTS pokenti;

CREATE DATABASE pokenti;

CREATE TABLE pokentis (
	id_pokenti INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	pokedex_number INT UNSIGNED NOT NULL, 
	name VARCHAR(16) NOT NULL, 
	weight FLOAT NOT NULL, 
	height FLOAT NOT NULL, 
	description TEXT NOT NULL, 
	sprite VARCHAR(24) NOT NULL, 
	sound VARCHAR(24) NOT NULL
);

INSERT INTO pokentis (pokedex_number, name, weight, height, description, sprite, sound)
VALUES
	(13, 'Alejandro', 1.7, 52, 'Parece ser que está vez se ha equivocado de juego, pero aún así insiste pertenecer a Pokenti.', 'alejandro.png', 'alejandro.mp3'),
	(1, 'Bulbasaur', 6.9, 0.7, 'Una rara semilla fue plantada en su espalda al nacer. La planta brota y crece con este Pokémon.', 'bulbasaur.png', 'bulbasaur.mp3'),
	(3, 'Venusaur', 100, 2, 'La planta florece cuando absorbe energía solar. Ésta le obliga a ponerse en busca de la luz solar.', 'venusaur.png', 'venusaur.mp3'),
	(2, 'Ivysaur', 13, 1, 'Cuando el bulbo de su espalda crece, parece no poder ponerse de pie sobre sus patas traseras', 'ivysaur.png', 'ivysaur.mp3'),
	(7, 'Squirtle', 9.0, 0.5, 'Tras nacer, su espalda se hincha y endurece como una concha. Echa potente espuma por la boca. PD: Vamo a calmarno', 'squirtle.png', 'squirtle.mp3'),
	(6, 'Charizard', 90.5, 1.7, 'Escupe fuego tan caliente que funde las rocas. Causa incendios forestales sin querer.', 'charizard.png', 'charizard.mp3'),
	(5, 'Charmaleon', 19, 1.1, 'Cuando balancea su ardiente cola, eleva la temperatura a niveles muy altos.', 'charmaleon.png', 'charmaleon.mp3'),
	(4, 'Charmander', 8.5, 0.6, 'Prefiere los sitios calientes. Dicen que cuando llueve sale vapor de su cola.', 'charmander.png', 'charmander.mp3'),
	(8, 'Wartortle', 22.5, 1, 'Se oculta en el agua para cazar a sus presas. Al nadar rápidamente, mueve sus orejas para nivelarse.', 'wartortle.png', 'wartortle.mp3'),
	(9, 'Blastoise', 85.5, 1.6, 'Un brutal Pokenti con reactores de agua en su caparazón. Éstos son usados para rápidos placajes.', 'blastoise.png', 'blastoise.mp3'),
	(10, 'Caterpie', 2.9, 0.3, 'Sus cortas patas están recubiertas de ventosas que le permiten subir incansable por muros y cuestas.', 'caterpie.png', 'caterpie.mp3'),
	(11, 'Metapod', 9.9, 0.7, 'Este Pokenti es vulnerable al ataque cuando su concha es blanda, dejando expuesto su frágil cuerpo.', 'metapod.png', 'metapod.mp3'),
	(12, 'Buterfree', 32, 1.1, 'En combate, aletea a gran velocidad para lanzar al aire sus tóxicos polvillos.', 'caterpie.png', 'caterpie.mp3');
	
	
	
CREATE TABLE types (
	id_type INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	type VARCHAR(12) NOT NULL
);
	
INSERT INTO types (`type`)
VALUES
	('Acero'),
	('Agua'),
	('Bicho'),
	('Dragón'),
	('Eléctrico'),
	('Fantasma'),
	('Fuego'),
	('¿Hada?'),
	('Hielo'),
	('Lucha'),
	('Normal'),
	('Planta'),
	('Psíquico'),
	('Roca'),
	('Siniestro'),
	('Tierra'),
	('Veneno'),
	('Volador'),
	('NONE');
	

CREATE TABLE types_combinations (
	id_type_combination INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	id_pokenti INT UNSIGNED NOT NULL, 
	FOREIGN KEY (id_pokenti) REFERENCES pokentis(id_pokenti),
	id_type_primary INT UNSIGNED NOT NULL, 
	FOREIGN KEY (id_type_primary) REFERENCES types(id_type),
	id_type_secondary INT UNSIGNED, 
	FOREIGN KEY (id_type_secondary) REFERENCES types(id_type)
);

INSERT INTO types_combinations (id_pokenti, id_type_primary, id_type_secondary)
VALUES
	(1, 11, 19),
	(2, 12, 17),
	(3, 12, 17),
	(4, 12, 17),
	(5, 2, 19),
	(6, 7, 18),
	(7, 7, 19),
	(8, 7, 19),
	(9, 2, 19),
	(10, 2, 19),
	(11, 3, 19),
	(12, 3, 19),
	(13, 3, 18);
	
	
CREATE TABLE evolutions (
	id_evolution INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	id_pokenti INT UNSIGNED NOT NULL, 
	FOREIGN KEY (id_pokenti) REFERENCES pokentis(id_pokenti),
	id_pokenti_evolution INT UNSIGNED NOT NULL, 
	FOREIGN KEY (id_pokenti_evolution) REFERENCES pokentis(id_pokenti),
	`level` INT NOT NULL
);

INSERT INTO evolutions (id_pokenti, id_pokenti_evolution, level)
VALUES
	(2, 4, 16),
	(4, 3, 32),
	(5, 9, 16),
	(9, 10, 32),
	(8, 7, 16),
	(7, 6, 32),
	(11, 12, 7),
	(12, 13, 10);
	
	
CREATE TABLE items (
	id_item INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	item VARCHAR(16) NOT NULL,
	cost INT,
	consumable BOOLEAN NOT NULL,
	equipable BOOLEAN NOT NULL,
	description TEXT NOT NULL,
	`image` VARCHAR(24) NOT NULL
);

INSERT INTO items (item, cost, consumable, equipable, description, `image`)
VALUES
	('Baya aranja', 100, true, true, 'Una baya particular. Crece en medio día y tiene mezcla de sabores.', 'baya_aranja.png'),
	('Garra rápida', 50, false, true, 'Al equiparlo en un Pokenti, tendrá un 20% de posibilidad de ir primero.', 'garra_rapida.png'),
	('Pokeball', 100, true, true, 'Sirve para cazar Pokentis.', 'pokeball.png');
	
CREATE TABLE natures (
	id_nature INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	nature VARCHAR(16) NOT NULL
);

INSERT INTO natures (nature)
VALUES 
	('Activa'),
	('Amable'),
	('Floja'),
	('Mansa'),
	('Plácida'),
	('Afable'),
	('Audaz'),
	('Fuerte'),
	('Miedosa'),
	('Rara'),
	('Agitada'),
	('Cauta'),
	('Grosera'),
	('Modesta'),
	('Serena'),
	('Alegre'),
	('Dócil'),
	('Huraña'),
	('Osada'),
	('Seria'),
	('Alocada'),
	('Firme'),
	('Ingenua'),
	('Pícara'),
	('Tímida');
	
		
CREATE TABLE abilities (
	id_ability INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	ability VARCHAR(16) NOT NULL
);

INSERT INTO abilities (ability)
VALUES 
	('Espesura'),
	('Clorofila'),
	('Mar llamas'),
	('Poder solar'),
	('Torrente'),
	('Cura lluvia'),
	('Polvo escudo'),
	('Fuga'),
	('Mudar'),
	('Ojo compuesto'),
	('Cromolente');
	
	
CREATE TABLE pokentis_captured (
	id_pokenti_captured INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	id_pokenti INT UNSIGNED NOT NULL, 
	FOREIGN KEY (id_pokenti) REFERENCES pokentis(id_pokenti),
	id_ability INT UNSIGNED NOT NULL, 
	FOREIGN KEY (id_ability) REFERENCES abilities(id_ability),
	id_nature INT UNSIGNED NOT NULL, 
	FOREIGN KEY (id_nature) REFERENCES natures(id_nature),
	id_item_carried INT UNSIGNED, 
	FOREIGN KEY (id_item_carried) REFERENCES items(id_item)
);

INSERT INTO pokentis_captured (id_pokenti, id_ability, id_nature, id_item_carried)
VALUES 
	(1, 8, 10, 2),
	(6, 2, 22, NULL),
	(10, 4, 2, 1),
	(4, 8, 11, 1),
	(11, 2, 21, 2),
	(10, 8, 17, 1),
	(12, 11, 15, NULL),
	(12, 4, 12, NULL),
	(12, 1, 2, 3),
	(13, 5, 3, 1);
	
CREATE TABLE stats (
	id_stat INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	experience INT NOT NULL,
	`level` INT NOT NULL,
	actual_health_points INT NOT NULL,
	max_health_points INT NOT NULL,
	attack INT NOT NULL,
	defence INT NOT NULL,
	special_attack INT NOT NULL,
	special_defence INT NOT NULL,
	speed INT NOT NULL,
	id_pokenti_captured INT UNSIGNED NOT NULL, 
	FOREIGN KEY (id_pokenti_captured) REFERENCES pokentis_captured(id_pokenti_captured)
);

INSERT INTO stats (id_pokenti_captured, experience, `level`, actual_health_points, max_health_points, attack, defence, special_attack, special_defence, speed)
VALUES 
	(1, 0, 1, 12, 12, 12,12,12,12,12),
	(2, 300, 40, 432,432,543,233,112,21,100),
	(3, 2222, 75, 324,324,223,124,543,21,121),
	(4, 23, 42, 517, 517,241,24,124,241,111),
	(5, 1778, 85, 432, 432,432,121,121,321,312),
	(6, 2345, 21, 231, 231,333,312,111,321,321),
	(7, 2451, 20, 11, 11,23,21,31,15,71),
	(8, 1111, 11, 72, 72,61,31,18,54,1),
	(9, 666, 3, 6, 6,66,666,66,6,1),
	(10, 24314, 99, 2, 2,1,1,1,1,1);
	
	
CREATE TABLE pokentis_equiped (
	id_pokenti_equiped INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	id_pokenti_captured INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_pokenti_captured) REFERENCES pokentis_captured(id_pokenti_captured)
);

INSERT INTO pokentis_equiped (id_pokenti_captured)
VALUES 
	(4),
	(8);
	

DELIMITER $$

CREATE PROCEDURE equip_pokenti (IN in_id_pokenti INT UNSIGNED)
	BEGIN
		SET @number_pokenti := 0;
		SELECT COUNT(id_pokenti_equiped) INTO @number_pokenti FROM pokentis_equiped;
		IF @number_pokenti < 6 THEN 
			INSERT INTO pokentis_equiped (id_pokenti_captured)
				VALUES (in_id_pokenti);
		END IF;
	END$$
	
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE unequip_pokenti (IN in_id_pokenti INT UNSIGNED)
	BEGIN
			DELETE FROM pokentis_equiped
				WHERE id_pokenti_equiped=in_id_pokenti;
	END$$
	
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE heal_pokenti (IN in_id_pokenti INT UNSIGNED)
	BEGIN
		SET @max_points := 0;
		SET @this_id_stat := 0;
		
		SELECT max_health_points INTO @max_points FROM pokentis_equiped 
		LEFT JOIN pokentis_captured 
		ON pokentis_equiped.id_pokenti_captured=pokentis_captured.id_pokenti_captured
		LEFT JOIN stats
		ON stats.id_pokenti_captured=pokentis_equiped.id_pokenti_captured
		WHERE pokentis_equiped.id_pokenti_equiped=in_id_pokenti;
		
		SELECT id_stat INTO @this_id_stat FROM pokentis_equiped 
		LEFT JOIN pokentis_captured 
		ON pokentis_equiped.id_pokenti_captured=pokentis_captured.id_pokenti_captured
		LEFT JOIN stats
		ON stats.id_pokenti_captured=pokentis_equiped.id_pokenti_captured
		WHERE pokentis_equiped.id_pokenti_equiped=in_id_pokenti;
				
		UPDATE stats
		SET actual_health_points=@max_points
		WHERE id_pokenti_captured=@this_id_stat;
	END$$
	
DELIMITER ;