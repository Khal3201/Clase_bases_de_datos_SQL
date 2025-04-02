-- Eliminar esquema si ya existe
DROP SCHEMA IF EXISTS liga_futbol;

-- Crear esquema
CREATE SCHEMA liga_futbol;

-- Seleccionar el esquema
USE liga_futbol;

-- Crear tablas
CREATE TABLE categoria(
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    edad_minima INT NOT NULL,
    edad_maxima INT NOT NULL
);

CREATE TABLE arbitro(
    id_arbitro INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido VARCHAR(50)
);

CREATE TABLE equipo(
    id_equipo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    entrenador VARCHAR(100),
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE jugador(
    id_jugador INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    telefono VARCHAR(10),
    direccion VARCHAR(50),
    posicion VARCHAR(20),
    id_equipo INT,
    FOREIGN KEY (id_equipo) REFERENCES equipo(id_equipo)
);

-- Insertar registros en la tabla categoria
INSERT INTO categoria (nombre, edad_minima, edad_maxima) VALUES
('Sub-10', 6, 10),
('Sub-12', 9, 12),
('Sub-14', 12, 14),
('Sub-16', 14, 16),
('Sub-18', 16, 18),
('Adultos', 18, 40),
('Veteranos', 40, 60),
('Sub-8', 5, 8),
('Sub-11', 8, 11),
('Sub-13', 11, 13),
('Sub-15', 13, 15),
('Sub-17', 15, 17),
('Sub-19', 17, 19),
('Master', 30, 50),
('Super Veteranos', 50, 70);

-- Insertar registros en la tabla equipo
INSERT INTO equipo (nombre, entrenador, id_categoria) VALUES
('Halcones Negros', 'Desconocido', 3),  -- id_equipo = 1
('Lobos Grises', 'Andrea Martínez', 2),  -- id_equipo = 2
('Panteras Rojas', 'Jorge Ramírez', 5),  -- id_equipo = 3
('Cóndores Dorados', 'Elena Sánchez', 6),  -- id_equipo = 4
('Osos del Norte', 'Desconocido', 7);  -- id_equipo = 5

-- Insertar registros en la tabla arbitro
INSERT INTO arbitro (nombre, apellido) VALUES
('Sergio', 'Navarro'),
('Desconocido', 'Fernández'),
('Roberto', 'Desconocido'),
('Carmen', 'Ortega'),
('Desconocido', 'Desconocido');

-- Insertar registros en la tabla jugador (usando id_equipo válido)
INSERT INTO jugador (nombre, apellido, telefono, direccion, posicion, id_equipo) VALUES
('Javier', 'Gómez', '5556789123', 'Avenida 1', 'Delantero', 1),  -- id_equipo = 1
('Adriana', 'Luna', '5556781234', 'Avenida 2', 'Mediocampista', 1),  -- id_equipo = 1
('Hugo', 'Gómez', '5558901456', 'Avenida 3', 'Defensor', 2),  -- id_equipo = 2
('Sebastián', 'Ortega', '5559012567', 'Avenida 4', 'Portero', 3),  -- id_equipo = 3
('Ricardo', 'Pineda', '5550123678', 'Avenida 5', 'Mediocampista', 4),  -- id_equipo = 4
('Desconocido', 'Villalobos', '5551234789', 'Avenida 6', 'Mediocampista', 5),  -- id_equipo = 5
('Julio', 'Esquivel', '5552345890', 'Avenida 7', 'Defensor', 1),  -- id_equipo = 1
('Diana', 'Cervantes', '5553456901', 'Avenida 8', 'Portero', 2),  -- id_equipo = 2
('Francisco', 'Santos', '5554567012', 'Avenida 9', 'Delantero', 3),  -- id_equipo = 3
('Oscar', 'Mendoza', '5555678123', 'Avenida 10', 'Delantero', 4),  -- id_equipo = 4
('Andrea', 'Peña', '5556789234', 'Avenida 11', 'Defensor', 5),  -- id_equipo = 5
('Rafael', 'Campos', '5558901456', 'Avenida 12', 'Portero', 1),  -- id_equipo = 1
('Beatriz', 'Mejía', '5558901456', 'Avenida 13', 'Delantero', 2),  -- id_equipo = 2
('Humberto', 'Ramos', '5559012567', 'Avenida 14', 'Mediocampista', 3),  -- id_equipo = 3
('Elena', 'Moreno', '5550123678', 'Avenida 15', 'Defensor', 4);  -- id_equipo = 4

-- Ejemplo 1 de INNER JOIN entre jugador y equipo
-- Este JOIN devolverá solo los jugadores que tienen un equipo asignado.
-- Mostrará el nombre del jugador y el nombre de su equipo.

-- Consulta con INNER JOIN (Ejemplo 1 de INNER JOIN)
SELECT 
    jugador.nombre AS nombre_jugador,
    jugador.apellido AS apellido_jugador,
    equipo.nombre AS nombre_equipo
FROM 
    jugador
INNER JOIN 
    equipo ON jugador.id_equipo = equipo.id_equipo;

-- Ejemplo 2 de INNER JOIN entre jugador y arbitro
-- Este JOIN devolverá solo los jugadores con arbitros asignados.
-- Muestra el nombre del jugador y el nombre del árbitro.

-- Consulta con INNER JOIN (Ejemplo 2 de INNER JOIN)
SELECT 
    jugador.nombre AS nombre_jugador,
    arbitro.nombre AS nombre_arbitro
FROM 
    jugador
INNER JOIN 
    arbitro ON jugador.id_jugador = arbitro.id_arbitro;

-- Ejemplo 1 de LEFT JOIN entre jugador y equipo
-- Este JOIN devolverá todos los jugadores, incluyendo aquellos sin equipo asignado.
-- Si el jugador no tiene un equipo, mostrará NULL en el nombre del equipo.

-- Consulta con LEFT JOIN (Ejemplo 1 de LEFT JOIN)
SELECT 
    jugador.nombre AS nombre_jugador,
    jugador.apellido AS apellido_jugador,
    equipo.nombre AS nombre_equipo
FROM 
    jugador
LEFT JOIN 
    equipo ON jugador.id_equipo = equipo.id_equipo;

-- Ejemplo 2 de LEFT JOIN entre jugador y arbitro
-- Este JOIN devolverá todos los jugadores, incluso aquellos sin árbitro asignado.
-- Si el jugador no tiene un árbitro, mostrará NULL en el nombre del árbitro.

-- Consulta con LEFT JOIN (Ejemplo 2 de LEFT JOIN)
SELECT 
    jugador.nombre AS nombre_jugador,
    arbitro.nombre AS nombre_arbitro
FROM 
    jugador
LEFT JOIN 
    arbitro ON arbitro.id_arbitro = jugador.id_jugador;

-- Ejemplo 1 de RIGHT JOIN entre jugador y equipo
-- Este JOIN devolverá todos los equipos, incluyendo aquellos sin jugadores asignados.
-- Si el equipo no tiene jugadores, mostrará NULL en el nombre del jugador.

-- Consulta con RIGHT JOIN (Ejemplo 1 de RIGHT JOIN)
SELECT 
    jugador.nombre AS nombre_jugador,
    equipo.nombre AS nombre_equipo
FROM 
    jugador
RIGHT JOIN 
    equipo ON jugador.id_equipo = equipo.id_equipo;

-- Ejemplo 2 de RIGHT JOIN entre jugador y arbitro
-- Este JOIN devolverá todos los árbitros, incluyendo aquellos sin jugadores asignados.
-- Si el árbitro no tiene un jugador asignado, mostrará NULL en el nombre del jugador.

-- Consulta con RIGHT JOIN (Ejemplo 2 de RIGHT JOIN)
SELECT 
    jugador.nombre AS nombre_jugador,
    arbitro.nombre AS nombre_arbitro
FROM 
    jugador
RIGHT JOIN 
    arbitro ON jugador.id_jugador = arbitro.id_arbitro;

