drop schema if exists liga_futbol;

create schema liga_futbol;

use liga_futbol;

create table categoria(
id_categoria INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR (20) NOT NULL,
edad_minima INT NOT NULL,
edad_maxima INT NOT NULL
);


CREATE TABLE arbitro(
id_arbitro INT PRIMARY KEY auto_increment,
nombre VARCHAR (50) NOT NULL,
apellido VARCHAR (50) NOT NULL
);

CREATE TABLE equipo(
id_equipo INT PRIMARY KEY auto_increment,
nombre VARCHAR (100) NOT NULL,
entranador VARCHAR (100) NOT NULL,
id_categoria INT NOT NULL,
foreign key (id_categoria) references categoria(id_categoria)
);


create table jugador(
id_jugador INT PRIMARY KEY AUTO_INCREMENT,
nombre varchar(100) NOT NULL,
apellido VARCHAR (100) NOT NULL,
telefono VARCHAR (10) NOT NULL,
direccion VARCHAR (50) NOT NULL,
posicion  VARCHAR (20) NOT NULL,
id_equipo INT NOT NULL,
foreign key (id_equipo) references equipo(id_equipo)
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

-- Agregar más equipos con valores nulos
INSERT INTO equipo (nombre, entranador, id_categoria) VALUES
('Halcones Negros', NULL, 3),  -- Entrenador desconocido
('Lobos Grises', 'Andrea Martínez', NULL),  -- Categoría desconocida
('Panteras Rojas', 'Jorge Ramírez', 5),
('Cóndores Dorados', 'Elena Sánchez', 6),
('Osos del Norte', NULL, 7);  -- Entrenador desconocido

-- Agregar más árbitros con valores nulos
INSERT INTO arbitro (nombre, apellido) VALUES
('Sergio', 'Navarro'),
(NULL, 'Fernández'),  -- Nombre desconocido
('Roberto', NULL),  -- Apellido desconocido
('Carmen', 'Ortega'),
(NULL, NULL);  -- Árbitro con nombre y apellido desconocido

-- Agregar más jugadores con valores nulos
INSERT INTO jugador (nombre, apellido, telefono, direccion, posicion, id_equipo) VALUES
('Javier', 'Gómez', '5556789123', 'Avenida 1', 'Delantero', 8),
('Adriana', 'Luna', NULL, 'Avenida 2', 'Mediocampista', 8),  -- Teléfono desconocido
('Hugo', NULL, '5558901456', 'Avenida 3', 'Defensor', 8),  -- Apellido desconocido
('Sebastián', 'Ortega', '5559012567', NULL, 'Portero', 9),  -- Dirección desconocida
('Ricardo', 'Pineda', '5550123678', 'Avenida 5', NULL, 9),  -- Posición desconocida
(NULL, 'Villalobos', '5551234789', 'Avenida 6', 'Mediocampista', 10),  -- Nombre desconocido
('Julio', 'Esquivel', '5552345890', 'Avenida 7', 'Defensor', NULL),  -- Equipo desconocido
('Diana', 'Cervantes', '5553456901', NULL, 'Portero', 11),
('Francisco', NULL, '5554567012', 'Avenida 9', 'Delantero', 11),
('Oscar', 'Santos', '5555678123', 'Avenida 10', NULL, 12),  -- Posición desconocida
('Andrea', 'Peña', '5556789234', 'Avenida 11', 'Defensor', 12),
('Rafael', 'Campos', NULL, 'Avenida 12', 'Portero', 13),
('Beatriz', 'Mejía', '5558901456', NULL, 'Delantero', 14),  -- Dirección desconocida
('Humberto', 'Ramos', '5559012567', 'Avenida 14', 'Mediocampista', 14),
('Elena', 'Moreno', '5550123678', 'Avenida 15', 'Defensor', NULL);  -- Equipo desconocido



SELECT DISTINCT nombre FROM categoria LIMIT 3;
SELECT DISTINCT nombre FROM arbitro LIMIT 3;
SELECT DISTINCT nombre FROM equipo LIMIT 3;

SELECT * FROM jugador LIMIT 3;
SELECT * FROM arbitro LIMIT 3;
SELECT * FROM categoria LIMIT 3;

SELECT * FROM equipo ORDER BY id_categoria DESC LIMIT 3;
SELECT * FROM jugador ORDER BY telefono ASC LIMIT 3;
SELECT * FROM categoria ORDER BY edad_minima DESC LIMIT 3;

SELECT * FROM jugador WHERE telefono IS NULL LIMIT 3;
SELECT * FROM equipo WHERE id_categoria IS NULL LIMIT 3;
SELECT * FROM arbitro WHERE apellido IS NULL LIMIT 3;

SELECT * FROM equipo WHERE nombre LIKE 'L%';
SELECT * FROM jugador WHERE posicion LIKE '%Defensor%';
SELECT * FROM arbitro WHERE nombre LIKE '%R%';

SELECT * FROM jugador WHERE telefono BETWEEN '5556789000' AND '5558901456';
SELECT * FROM equipo WHERE id_categoria BETWEEN 5 AND 10;
SELECT * FROM arbitro WHERE nombre BETWEEN 'Carlos' AND 'Sergio';

SELECT * FROM jugador WHERE telefono > '5556789000' AND nombre LIKE 'A%';
SELECT * FROM equipo WHERE id_categoria > 5 AND nombre LIKE 'L%';
SELECT * FROM categoria WHERE edad_maxima > 18 AND nombre IS NOT NULL;

SELECT * FROM jugador WHERE telefono > '5558901456' OR posicion IS NULL;
SELECT * FROM equipo WHERE id_categoria IS NULL OR nombre LIKE '%Rojas%';
SELECT * FROM arbitro WHERE nombre IS NULL OR apellido IS NULL;

SELECT * FROM jugador WHERE NOT telefono IS NULL;
SELECT * FROM equipo WHERE NOT id_categoria IS NULL;
SELECT * FROM arbitro WHERE NOT apellido IS NULL;

SELECT * FROM equipo WHERE nombre IN ('Halcones Negros', 'Lobos Grises', 'Panteras Rojas');
SELECT * FROM jugador WHERE id_equipo IN (1, 3, 5);
SELECT * FROM categoria WHERE nombre IN ('Sub-10', 'Sub-12', 'Sub-14');

SELECT nombre, edad_minima * 2 AS edad_promocion FROM categoria LIMIT 3;
SELECT nombre, IFNULL(telefono, 'No disponible') AS telefono FROM jugador LIMIT 3;
SELECT nombre, CONCAT('Entrenador: ', IFNULL(entranador, 'No disponible')) AS equipo_info FROM equipo LIMIT 3;

SELECT MIN(edad_minima) AS edad_minima_categoria FROM categoria;
SELECT MAX(edad_maxima) AS edad_maxima_categoria FROM categoria;
SELECT COUNT(*) AS total_equipo FROM equipo;

SELECT SUM(edad_minima) AS total_edad_minima FROM categoria;
SELECT AVG(edad_maxima) AS promedio_edad_maxima FROM categoria;

SELECT nombre, CONCAT('Jugador: ', nombre, ' ', apellido) AS jugador_info FROM jugador LIMIT 3;
SELECT CONCAT(nombre, ' ', apellido) AS arbitro_info FROM arbitro LIMIT 3;

SELECT UPPER(nombre) AS equipo_mayus FROM equipo LIMIT 3;
SELECT LOWER(nombre) AS arbitro_minus FROM arbitro LIMIT 3;
SELECT UPPER(nombre) AS jugador_mayus FROM jugador LIMIT 3;

SELECT * FROM equipo LIMIT 3 OFFSET 3;
SELECT * FROM jugador LIMIT 3 OFFSET 5;
SELECT * FROM categoria LIMIT 3 OFFSET 2;

SELECT id_categoria, COUNT(*) AS total_equipo FROM equipo GROUP BY id_categoria;
SELECT id_equipo, COUNT(*) AS total_jugadores FROM jugador GROUP BY id_equipo;

SELECT nombre, posicion, 
CASE 
    WHEN posicion = 'Delantero' THEN 'Ofensivo'
    WHEN posicion = 'Mediocampista' THEN 'Centro'
    ELSE 'Defensivo'
END AS tipo_posicion 
FROM jugador;

SELECT nombre, 
CASE 
    WHEN telefono IS NULL THEN 'No disponible'
    ELSE telefono
END AS telefono_info 
FROM jugador;

SELECT nombre, IFNULL(entranador, 'Entrenador no asignado') AS entrenador_info FROM equipo;

