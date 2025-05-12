DROP SCHEMA IF EXISTS liga_futbol;

CREATE SCHEMA liga_futbol;

USE liga_futbol;

CREATE TABLE categoria (
  id_categoria INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(20) NOT NULL,
  edad_minima INT NOT NULL,
  edad_maxima INT NOT NULL
);

CREATE TABLE arbitro (
  id_arbitro INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50),
  apellido VARCHAR(50)
);

CREATE TABLE equipo (
  id_equipo INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  entrenador VARCHAR(100),
  id_categoria INT,
  FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE jugador (
  id_jugador INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100),
  apellido VARCHAR(100),
  telefono VARCHAR(10),
  direccion VARCHAR(50),
  posicion VARCHAR(20),
  id_equipo INT,
  FOREIGN KEY (id_equipo) REFERENCES equipo(id_equipo)
);

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

-- Agregar equipos
INSERT INTO equipo (nombre, entrenador, id_categoria) VALUES
('Halcones Negros', NULL, 3),
('Lobos Grises', 'Andrea Martínez', NULL),
('Panteras Rojas', 'Jorge Ramírez', 5),
('Cóndores Dorados', 'Elena Sánchez', 6),
('Osos del Norte', NULL, 7);

-- Agregar árbitros
INSERT INTO arbitro (nombre, apellido) VALUES
('Sergio', 'Navarro'),
(NULL, 'Fernández'),
('Roberto', NULL),
('Carmen', 'Ortega'),
(NULL, NULL);

-- Agregar jugadores
INSERT INTO jugador (nombre, apellido, telefono, direccion, posicion, id_equipo) VALUES
('Javier', 'Gómez', '5556789123', 'Avenida 1', 'Delantero', 1),
('Adriana', 'Luna', NULL, 'Avenida 2', 'Mediocampista', 1),
('Hugo', NULL, '5558901456', 'Avenida 3', 'Defensor', 1),
('Sebastián', 'Ortega', '5559012567', NULL, 'Portero', 2),
('Ricardo', 'Pineda', '5550123678', 'Avenida 5', NULL, 2),
(NULL, 'Villalobos', '5551234789', 'Avenida 6', 'Mediocampista', 3),
('Julio', 'Esquivel', '5552345890', 'Avenida 7', 'Defensor', NULL),
('Diana', 'Cervantes', '5553456901', NULL, 'Portero', 3),
('Francisco', NULL, '5554567012', 'Avenida 9', 'Delantero', 3),
('Oscar', 'Santos', '5555678123', 'Avenida 10', NULL, 4),
('Andrea', 'Peña', '5556789234', 'Avenida 11', 'Defensor', 4),
('Rafael', 'Campos', NULL, 'Avenida 12', 'Portero', 5),
('Beatriz', 'Mejía', '5558901456', NULL, 'Delantero', 5),
('Humberto', 'Ramos', '5559012567', 'Avenida 14', 'Mediocampista', 5),
('Elena', 'Moreno', '5550123678', 'Avenida 15', 'Defensor', NULL);

-- Muestra los nombres de los equipos que pertenecen a la categoría con el rango de edad más amplio.
SELECT DISTINCT nombre
FROM equipo
WHERE id_categoria = (
    SELECT id_categoria
    FROM categoria
    ORDER BY (edad_maxima - edad_minima) DESC
    LIMIT 1
);

-- Muestra los nombres de los jugadores que pertenecen al equipo con más jugadores registrados.
SELECT DISTINCT nombre
FROM jugador
WHERE id_equipo = (
    SELECT id_equipo
    FROM jugador
    GROUP BY id_equipo
    ORDER BY COUNT(*) DESC
    LIMIT 1
);



-- Muestra los nombres de los jugadores cuyo equipo no tiene entrenador registrado.
SELECT DISTINCT nombre
FROM jugador
WHERE id_equipo IN (
    SELECT id_equipo
    FROM equipo
    WHERE entrenador IS NULL
);

-- Muestra los nombres de los jugadores cuya posición es la misma que la del jugador con ID 1.
SELECT DISTINCT nombre
FROM jugador
WHERE posicion = (
    SELECT posicion
    FROM jugador
    WHERE id_jugador = 1
    LIMIT 1
);

