drop schema if exists escuela;

create schema escuela;
 use escuela;

create table grupo(
id_grupo INT PRIMARY KEY auto_increment,
grupo VARCHAR (30) NOT NULL,
salon INT NOT NULL
);

create table maestro(
id_maestro INT PRIMARY KEY auto_increment,
nombre VARCHAR (100) NOT NULL,
apellidos VARCHAR (100) NOT NULL,
telefono VARCHAR (10) NOT NULL,
direccion VARCHAR (100) NOT NULL
);

create table materia(
id_materia INT PRIMARY KEY,
nombre VARCHAR (50) NOT NULL,
descripcion text NOT NULL,
id_maestro INT,
foreign key (id_maestro) references maestro(id_maestro)
);

create table estudiante(
id_estudiante INT PRIMARY KEY auto_increment,
nombre VARCHAR (50) NOT NULL,
apellido varchar (100) NOT NULL,
fecha_nacimiento date NOT NULL,
direccion VARCHAR (100) NOT NULL,
telefono VARCHAR (10) NOT NULL,
grado INT NOT NULL,
id_grupo INT NOT NULL,
FOREIGN KEY (id_grupo) REFERENCES grupo(id_grupo)
);

INSERT INTO grupo (grupo, salon) VALUES
('Matemáticas', 101),
('Historia', 102),
('Ciencias', 103),
('Literatura', 104),
('Arte', 105),
('Física', 106),
('Química', 107),
('Geografía', 108),
('Deportes', 109),
('Inglés', 110);

INSERT INTO maestro (nombre, apellidos, telefono, direccion) VALUES
('Juan', 'Pérez Gómez', '5551234567', 'Calle Ficticia 123'),
('Ana', 'López Martínez', '5552345678', 'Calle Real 456'),
('Carlos', 'Hernández Pérez', '5553456789', 'Av. Principal 789'),
('María', 'González Ruiz', '5554567890', 'Calle del Sol 101'),
('Luis', 'Rodríguez Gómez', '5555678901', 'Calle 5 de Febrero 202'),
('Juan', 'Díaz Ramírez', '5556789012', 'Av. Juárez 303'),
('Pedro', 'Jiménez Sánchez', '5557890123', 'Calle 16 de Septiembre 404'),
('Claudia', 'Morales García', '5558901234', 'Calle Morelos 505'),
('Ricardo', 'Sánchez García', '5559012345', 'Calle Hidalgo 606'),
('Verónica', 'Vázquez López', '5550123456', 'Av. México 707');

INSERT INTO materia (id_materia, nombre, descripcion, id_maestro) VALUES
(1, 'Matemáticas', 'Curso básico de álgebra y cálculo', 1),
(2, 'Historia', 'Estudio de la historia mundial', 2),
(3, 'Ciencias', 'Estudio de la biología y la física', 3),
(4, 'Literatura', 'Estudio de la literatura clásica y moderna', 4),
(5, 'Arte', 'Estudio de técnicas de pintura y escultura', 5),
(6, 'Física', 'Estudio de los principios físicos', 6),
(7, 'Química', 'Estudio de los elementos y reacciones químicas', 7),
(8, 'Geografía', 'Estudio de la geografía física y humana', 8),
(9, 'Deportes', 'Entrenamiento y práctica de diversas disciplinas deportivas', 9),
(10, 'Inglés', 'Estudio de la lengua inglesa y su literatura', 10);


INSERT INTO estudiante (nombre, apellido, fecha_nacimiento, direccion, telefono, grado, id_grupo) VALUES
('Laura', 'Gómez Sánchez', '2004-05-12', 'Calle Las Palmas 1', '5551239876', 3, 1),
('José', 'Martínez Fernández', '2005-06-15', 'Calle del Sol 2', '5552348765', 2, 2),
('Pedro', 'Hernández Díaz', '2003-08-20', 'Calle Real 3', '5553457654', 4, 3),
('Marta', 'Ramírez Rodríguez', '2004-07-18', 'Av. México 4', '5554566543', 1, 4),
('Carlos', 'Sánchez Pérez', '2005-02-25', 'Calle Ficticia 5', '5555675432', 3, 5),
('Ana', 'Jiménez López', '2004-12-05', 'Calle 5 de Febrero 6', '5556784321', 2, 6),
('Luis', 'Vázquez González', '2006-03-10', 'Calle Hidalgo 7', '5557893210', 1, 7),
('Sofía', 'Morales Fernández', '2005-04-14', 'Calle Benito Juárez 8', '5558902109', 4, 8),
('Ricardo', 'Torres García', '2004-09-08', 'Av. Juárez 9', '5559011098', 2, 9),
('Elena', 'González Vázquez', '2005-11-30', 'Calle Morelos 10', '5550129987', 3, 10);
/*
INNER JOIN:

Ejercicio 1:
Realiza una consulta que devuelva el nombre de los estudiantes y el grupo al que están asignados. 
La consulta debe unir las tablas estudiante y grupo basándose en el id_grupo.

Ejercicio 2:
Crea una consulta que obtenga el nombre de la materia, la descripción de la materia y el nombre del maestro que la imparte. 
Para ello, realiza un INNER JOIN entre las tablas materia y maestro basándote en la relación entre id_maestro y id_maestro.
*/

-- 1
SELECT e.nombre, g.grupo
FROM estudiante e
JOIN grupo g
ON e.id_grupo = g.id_grupo;

-- 2
SELECT m.nombre, m.descripcion, ma.nombre
FROM materia m
JOIN maestro ma
ON m.id_maestro = ma.id_maestro;

/*
LEFT JOIN:

Ejercicio 1:
Realiza una consulta que muestre todos los grupos y, si los hay, el nombre del estudiante asignado a cada grupo. 
Si un grupo no tiene estudiante, la consulta debe mostrar NULL en la columna de estudiante. Usa un LEFT JOIN entre la tabla grupo y estudiante.

Ejercicio 2:
Escribe una consulta que liste todas las materias junto con el nombre del maestro que la imparte. 
Si alguna materia no tiene maestro asignado, debe aparecer como NULL. Usa un LEFT JOIN entre las tablas materia y maestro.
*/


/*
RIGHT JOIN:

Ejercicio 1:
Crea una consulta que muestre todos los estudiantes y, si están asignados a algún grupo, el nombre del grupo. 
Si un estudiante no está asignado a ningún grupo, la consulta debe mostrar NULL en la columna del grupo. 
Usa un RIGHT JOIN entre estudiante y grupo.

Ejercicio 2:
Realiza una consulta que devuelva el nombre de los estudiantes y el grupo al que pertenecen. 
Si un grupo no tiene estudiantes, muestra NULL en la columna del estudiante. Usa un RIGHT JOIN entre estudiante y grupo.
*/