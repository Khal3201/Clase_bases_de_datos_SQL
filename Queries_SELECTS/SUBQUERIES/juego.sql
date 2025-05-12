-- Borra el esquema si ya existe y lo vuelve a crear
DROP SCHEMA IF EXISTS juego;
CREATE SCHEMA juego;
USE juego;

-- Crea la tabla 'juego' con restricciones adecuadas
CREATE TABLE juego (
    id_juego INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    genero VARCHAR(100) NOT NULL,
    plataforma VARCHAR(100) NOT NULL,
    desarrollador VARCHAR(100) NOT NULL,
    fecha_lanzamiento DATE NOT NULL
);

-- Crea la tabla 'jugador'
CREATE TABLE jugador (
    id_jugador INT PRIMARY KEY AUTO_INCREMENT,
    nombre_usuario VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL
);

-- Crea la tabla 'proceso' con llaves foráneas
CREATE TABLE proceso (
    id_proceso INT PRIMARY KEY AUTO_INCREMENT,
    nivel INT NOT NULL,
    puntaje INT NOT NULL,
    tiempo_jugado TIME NOT NULL,
    id_jugador INT NOT NULL,
    id_juego INT NOT NULL,
    FOREIGN KEY (id_jugador) REFERENCES jugador(id_jugador),
    FOREIGN KEY (id_juego) REFERENCES juego(id_juego)
);

-- Inserta juegos válidos (se eliminan registros duplicados o con valores nulos en campos NOT NULL)
INSERT INTO juego (nombre, genero, plataforma, desarrollador, fecha_lanzamiento) VALUES
('Cyberpunk 2077', 'RPG', 'PC, PS4, PS5, Xbox One, Xbox Series X/S', 'CD Projekt Red', '2020-12-10'),
('Doom Eternal', 'FPS', 'PC, PS4, Xbox One', 'id Software', '2020-03-20'),
('Animal Crossing: New Horizons', 'Simulación', 'Nintendo Switch', 'Nintendo', '2020-03-20'),
('Stardew Valley', 'Simulación', 'PC, Consolas', 'ConcernedApe', '2016-02-26'),
('Minecraft', 'Sandbox', 'PC, PS4, Xbox One, Switch', 'Mojang Studios', '2011-11-18'),
('Resident Evil Village', 'Survival Horror', 'PC, PS5, Xbox Series X/S', 'Capcom', '2021-05-07'),
('The Legend of Zelda: Breath of the Wild', 'Aventura', 'Nintendo Switch', 'Nintendo', '2017-03-03');

-- Inserta jugadores válidos (se eliminan duplicados o valores nulos en campos NOT NULL)
INSERT INTO jugador (nombre_usuario, correo_electronico, pais) VALUES
('Carlos123', 'carlos123@email.com', 'México'),
('TestUser', 'test@email.com', 'PaísDesconocido'),
('MartaGame', 'marta@email.com', 'Perú'),
('Sofia_97', 'sofia97@email.com', 'Chile'),
('LuciaGamers', 'luciagamers@email.com', 'España');

-- Inserta procesos válidos (sin valores nulos y con referencias válidas a id_jugador e id_juego)
INSERT INTO proceso (nivel, puntaje, tiempo_jugado, id_jugador, id_juego) VALUES
(10, 1500, '02:15:30', 1, 1),
(5, 1000, '01:10:00', 2, 2),
(20, 3500, '03:30:00', 3, 3),
(15, 2200, '02:00:00', 4, 4),
(30, 5000, '04:30:00', 5, 5);


-- Muestra los nombres de los jugadores que han obtenido un puntaje mayor al promedio de todos los procesos.

SELECT DISTINCT nombre_usuario
FROM jugador
WHERE id_jugador IN (
    SELECT id_jugador
    FROM proceso
    WHERE puntaje > (
        SELECT AVG(puntaje)
        FROM proceso
        WHERE puntaje IS NOT NULL
    )
);

-- Muestra el nombre y plataforma del juego con el puntaje más alto registrado.

SELECT DISTINCT nombre, plataforma
FROM juego
WHERE id_juego = (
    SELECT id_juego
    FROM proceso
    WHERE puntaje = (
        SELECT MAX(puntaje)
        FROM proceso
        WHERE puntaje IS NOT NULL
    )
    LIMIT 1
);

-- Muestra los nombres de los juegos que han sido jugados por jugadores de 'México'.

SELECT DISTINCT nombre
FROM juego
WHERE id_juego IN (
    SELECT id_juego
    FROM proceso
    WHERE id_jugador IN (
        SELECT id_jugador
        FROM jugador
        WHERE pais = 'México'
    )
);

-- Muestra el nombre de los jugadores que han jugado más de un juego diferente.

SELECT DISTINCT nombre_usuario
FROM jugador
WHERE id_jugador IN (
    SELECT id_jugador
    FROM proceso
    GROUP BY id_jugador
    HAVING COUNT(DISTINCT id_juego) > 1
);

-- Muestra el nombre y género de los juegos cuyo desarrollador también haya creado otro juego.

SELECT DISTINCT nombre, genero
FROM juego
WHERE desarrollador IN (
    SELECT desarrollador
    FROM juego
    GROUP BY desarrollador
    HAVING COUNT(*) > 1
);
