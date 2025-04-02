-- Eliminar esquema si ya existe
DROP SCHEMA IF EXISTS juego;

-- Crear esquema
CREATE SCHEMA juego;

-- Seleccionar el esquema
USE juego;

-- Crear tablas
CREATE TABLE juego (
    id_juego INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),  
    genero VARCHAR(100),  
    plataforma VARCHAR(100),  
    desarrollador VARCHAR(100), 
    fecha_lanzamiento DATE
);

CREATE TABLE jugador (
    id_jugador INT PRIMARY KEY AUTO_INCREMENT,
    nombre_usuario VARCHAR(100),  
    correo_electronico VARCHAR(100),  
    pais VARCHAR(100)  
);

CREATE TABLE proceso (
    id_proceso INT PRIMARY KEY AUTO_INCREMENT,
    nivel INT,  
    puntaje INT,  
    tiempo_jugado TIME, 
    id_jugador INT, 
    id_juego INT, 
    FOREIGN KEY (id_jugador) REFERENCES jugador(id_jugador),
    FOREIGN KEY (id_juego) REFERENCES juego(id_juego)
);

-- Insertar registros en la tabla juego
INSERT INTO juego (nombre, genero, plataforma, desarrollador, fecha_lanzamiento) VALUES
('Cyberpunk 2077', 'RPG', 'PC, PS4, PS5, Xbox One, Xbox Series X/S', 'CD Projekt Red', '2020-12-10'),
('Doom Eternal', 'FPS', 'PC, PS4, Xbox One', 'id Software', '2020-03-20'),
('Animal Crossing: New Horizons', 'Simulación', 'Nintendo Switch', 'Nintendo', '2020-03-20'),
('Stardew Valley', 'Simulación', 'PC, Consolas', 'ConcernedApe', '2016-02-26'),
('Minecraft', 'Sandbox', 'PC, PS4, Xbox One, Switch', 'Mojang Studios', '2011-11-18'),
('Resident Evil Village', 'Survival Horror', 'PC, PS5, Xbox Series X/S', 'Capcom', '2021-05-07'),
('The Legend of Zelda: Breath of the Wild', 'Aventura', 'Nintendo Switch', 'Nintendo', '2017-03-03');

-- Insertar registros en la tabla jugador
INSERT INTO jugador (nombre_usuario, correo_electronico, pais) VALUES
('Carlos123', 'carlos123@email.com', 'México'),
('Carlos123', 'carlos123@email.com', 'México'),
(NULL, 'usuariox@email.com', 'España'),
('Anónimo', NULL, 'Argentina'),
('LuisPlayer', 'luisplayer@email.com', NULL),
('TestUser', 'test@email.com', 'PaísDesconocido'),
('MartaGame', 'marta@email.com', 'Perú'),
('MartaGame', 'marta@email.com', 'Perú'),
('Sofia_97', 'sofia97@email.com', 'Chile'),
('LuciaGamers', 'luciagamers@email.com', 'España');

-- Insertar registros en la tabla proceso
INSERT INTO proceso (nivel, puntaje, tiempo_jugado, id_jugador, id_juego) VALUES
(10, 1500, '02:15:30', 1, 1), -- id_juego = 1 (Cyberpunk 2077)
(10, 1500, '02:15:30', 1, 1), -- id_juego = 1 (Cyberpunk 2077)
(1, 800, '01:10:00', 2, 2), -- id_juego = 2 (Doom Eternal)
(5, 1200, '01:10:00', 3, 3), -- id_juego = 3 (Animal Crossing: New Horizons)
(20, 3500, '00:00:00', 4, 4), -- id_juego = 4 (Stardew Valley)
(15, 2200, '02:00:00', 5, 5), -- id_juego = 5 (Minecraft)
(30, 5000, '04:30:00', 6, 6), -- id_juego = 6 (Resident Evil Village)
(40, 999999, '99:99:99', 7, 7), -- id_juego = 7 (The Legend of Zelda: Breath of the Wild)
(10, 4000, '03:20:00', 8, 1), -- id_juego = 1 (Cyberpunk 2077)
(18, 2800, '02:40:00', 9, 2), -- id_juego = 2 (Doom Eternal)
(100, 9999, '00:00:00', 10, 3); -- id_juego = 3 (Animal Crossing: New Horizons)

/*
    INNER JOIN:

    Ejemplo 1: Obtener el nombre del jugador y el nombre del juego en el que ha jugado.
*/
SELECT
    ju.nombre_usuario AS nombre_jugador,
    j.nombre AS nombre_juego
FROM proceso p
INNER JOIN jugador ju ON p.id_jugador = ju.id_jugador
INNER JOIN juego j ON p.id_juego = j.id_juego;

/*
    Ejemplo 2: Obtener el nombre del jugador y el puntaje en el proceso del juego.
*/
SELECT
    ju.nombre_usuario AS nombre_jugador,
    p.puntaje,
    j.nombre AS nombre_juego
FROM proceso p
INNER JOIN jugador ju ON p.id_jugador = ju.id_jugador
INNER JOIN juego j ON p.id_juego = j.id_juego;


-- 
/*
    LEFT JOIN:

    Ejemplo 1: Obtener el nombre del jugador y el nombre del juego en el que ha jugado.
    Si un jugador no ha jugado en algún juego, aparecerá NULL en la columna 'nombre_juego'.
*/
SELECT
    ju.nombre_usuario AS nombre_jugador,
    j.nombre AS nombre_juego
FROM jugador ju
LEFT JOIN proceso p ON ju.id_jugador = p.id_jugador
LEFT JOIN juego j ON p.id_juego = j.id_juego;

/*
    Ejemplo 2: Obtener todos los juegos y los jugadores que han jugado esos juegos.
    Si un juego no tiene jugadores, aparecerá NULL en la columna 'nombre_jugador'.
*/
SELECT
    j.nombre AS nombre_juego,
    ju.nombre_usuario AS nombre_jugador
FROM juego j
LEFT JOIN proceso p ON j.id_juego = p.id_juego
LEFT JOIN jugador ju ON p.id_jugador = ju.id_jugador;


--
/*
    RIGHT JOIN:

    Ejemplo 1: Obtener todos los jugadores y los juegos en los que han jugado. 
    Si un jugador no tiene un juego asignado, aparecerá NULL en la columna 'nombre_juego'.
*/
SELECT
    ju.nombre_usuario AS nombre_jugador,
    j.nombre AS nombre_juego
FROM jugador ju
RIGHT JOIN proceso p ON ju.id_jugador = p.id_jugador
RIGHT JOIN juego j ON p.id_juego = j.id_juego;

/*
    Ejemplo 2: Obtener todos los juegos y los jugadores que han jugado esos juegos.
    Si un juego no tiene jugadores, aparecerá NULL en la columna 'nombre_jugador'.
*/
SELECT
    j.nombre AS nombre_juego,
    ju.nombre_usuario AS nombre_jugador
FROM juego j
RIGHT JOIN proceso p ON j.id_juego = p.id_juego
RIGHT JOIN jugador ju ON p.id_jugador = ju.id_jugador;

