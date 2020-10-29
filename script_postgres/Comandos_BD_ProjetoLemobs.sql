DROP TABLE IF EXISTS genero;
DROP TABLE IF EXISTS plataforma;
DROP TABLE IF EXISTS jogo;

DROP VIEW IF EXISTS generos;
DROP VIEW IF EXISTS jogos_generos;
DROP VIEW IF EXISTS ps3;
DROP VIEW IF EXISTS ps4;
DROP VIEW IF EXISTS xbox360;
DROP VIEW IF EXISTS xboxone;
DROP VIEW IF EXISTS switch;

CREATE TABLE plataforma(
	plataforma_id INT GENERATED ALWAYS AS IDENTITY,
	plataforma_nome VARCHAR(30) NOT NULL,
	fabricante VARCHAR(30) NOT NULL,
	PRIMARY KEY(plataforma_id)
);

CREATE TABLE genero(
	genero_id INT GENERATED ALWAYS AS IDENTITY,
	genero_nome VARCHAR(30) NOT NULL,
	PRIMARY KEY(genero_id)
);

CREATE TABLE jogo(
	jogo_id INT GENERATED ALWAYS AS IDENTITY,
	plataforma_id INT,
	genero_id INT,
	nome_jogo VARCHAR(50) NOT NULL,
	desenvolvedor VARCHAR(40) NOT NULL,
	data_lancamento DATE NOT NULL,
	PRIMARY KEY(jogo_id),
	CONSTRAINT fk_plataforma
		FOREIGN KEY(plataforma_id) 
		REFERENCES plataforma(plataforma_id),
	CONSTRAINT fk_genero
		FOREIGN KEY(genero_id) 
		REFERENCES genero(genero_id)
);

CREATE VIEW pc AS
	SELECT DISTINCT j.nome_jogo, p.plataforma_nome
	FROM jogo j
	INNER JOIN plataforma p
	ON p.plataforma_id = j.plataforma_id
	AND p.plataforma_nome LIKE '%Windows%'
	
CREATE VIEW ps3 AS
	SELECT DISTINCT j.nome_jogo, p.plataforma_nome
	FROM jogo j
	INNER JOIN plataforma p
	ON p.plataforma_id = j.plataforma_id
	AND p.plataforma_nome LIKE '%Playstation 3%'
	
CREATE VIEW ps4 AS
	SELECT DISTINCT j.nome_jogo, p.plataforma_nome
	FROM jogo j
	INNER JOIN plataforma p
	ON p.plataforma_id = j.plataforma_id
	AND p.plataforma_nome LIKE '%Playstation 4%'
	
CREATE VIEW xbox360 AS
	SELECT DISTINCT j.nome_jogo, p.plataforma_nome
	FROM jogo j
	INNER JOIN plataforma p
	ON p.plataforma_id = j.plataforma_id
	AND p.plataforma_nome LIKE '%Xbox 360%'
	
CREATE VIEW xboxone AS
	SELECT DISTINCT j.nome_jogo, p.plataforma_nome
	FROM jogo j
	INNER JOIN plataforma p
	ON p.plataforma_id = j.plataforma_id
	AND p.plataforma_nome LIKE '%Xbox One%'
	
CREATE VIEW switch AS
	SELECT DISTINCT j.nome_jogo, p.plataforma_nome
	FROM jogo j
	INNER JOIN plataforma p
	ON p.plataforma_id = j.plataforma_id
	AND p.plataforma_nome LIKE '%Nintendo Switch%'
	
CREATE VIEW generos AS
	SELECT 
		COUNT(DISTINCT j.nome_jogo),
		g.genero_nome
	FROM jogo j
		INNER JOIN genero g
		ON g.genero_id = j.genero_id
	GROUP BY g.genero_nome
	
CREATE VIEW jogos_generos AS
	SELECT 
		j.nome_jogo,
		g.genero_nome
	FROM jogo j
		INNER JOIN genero g
		ON g.genero_id = j.genero_id

INSERT INTO plataforma(plataforma_nome, fabricante)
VALUES
	('Playstation 3', 'Sony'),
	('Playstation 4', 'Sony'),
	('Xbox 360', 'Microsoft'),
	('Xbox One', 'Microsoft'),
	('Nintendo Switch', 'Nintendo');

INSERT INTO genero(genero_nome)
VALUES
	('Ação/Aventura'),
	('Luta'),
	('Tiro/Shooter'),
	('Simulador de vida'),
	('Construção/Gerenciamento'),
	('Musica/Ritmo'),
	('Esportes'),
	('Corrida'),
	('RPG');
  
INSERT INTO jogo(plataforma_id, genero_id, nome_jogo, desenvolvedor, data_lancamento)
VALUES
	(2, 1, 'Horizon Zero Dawn', 'Guerrilla Games', '28-Feb-2017'),
	(2, 1, 'God of War', 'Santa Monica Studio', '20-Apr-2018'),
	(1, 2, 'Mortal Kombat 9', 'Netherrealm Studios', '19-Apr-2011'),
	(4, 3, 'Gears 5', 'The Coalition', '06-Sep-2019'),
	(3, 3, 'BioShock','2K', '21-Aug-2007'),
	(3, 7, 'Skate 3', 'EA', '11-May-2010'),
	(1, 3, 'Killzone 2','Guerrilla Games','26-Feb-2009'),
	(1, 1, 'Infamous 2', 'Sucker Punch Productions', '07-Jun-2011'),
	(2, 1, 'Ghost of Tsushima', 'Sucker Punch Productions', '17-Jun-2020'),
	(2, 1, 'The Last of Us 2', 'Naughty Dog', '19-Jun-2020'),
	(5, 1, 'Super Mario Odyssey', 'Nintendo', '27-Oct-2017'),
	(5, 1, 'The Legend of Zelda: Breath of the Wild', 'Nintendo', '03-Mar-2017'),
	(2, 2, 'Mortal Kombat 11', 'Netherrealm Studios', '23-Apr-2019'),
	(4, 3, 'Halo 5: Guardians', '343 Industries', '27-Oct-2015'),
	(4, 8, 'Need for Speed: Payback', 'EA', '10-Nov-2017'),
	(1, 9, 'The Elder Scrolls V: Skyrim', 'Bethesda Game Studios', '11-Nov-2011'),
