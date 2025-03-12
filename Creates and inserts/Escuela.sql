DROP DATABASE IF EXISTS Escuela;

CREATE DATABASE Escuela;
USE Escuela;

-- In SQL, when using FOREIGN KEY constraints, the referenced table must exist before the table that refers to it.

-- Tabla Estudiante
CREATE TABLE Estudiante (
    id_estudiante INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    direccion TEXT NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100)
);

-- Tabla Maestro
CREATE TABLE Maestro (
    id_maestro INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100)
);

-- Tabla Materia
CREATE TABLE Materia (
    id_materia INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Tabla Grupo
CREATE TABLE Grupo (
    id_grupo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    id_maestro INT NOT NULL,
    FOREIGN KEY (id_maestro) REFERENCES Maestro(id_maestro)
);

-- Tabla Aula (Moved before Horario)
CREATE TABLE Aula (
    id_aula INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    capacidad INT NOT NULL,
    ubicacion VARCHAR(100) NOT NULL
);

-- Tabla Inscripción (Relación Estudiante - Grupo)
CREATE TABLE Inscripcion (
    id_inscripcion INT PRIMARY KEY AUTO_INCREMENT,
    id_estudiante INT NOT NULL,
    id_grupo INT NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_grupo) REFERENCES Grupo(id_grupo)
);

-- Tabla Calificación
CREATE TABLE Calificacion (
    id_calificacion INT PRIMARY KEY AUTO_INCREMENT,
    id_estudiante INT NOT NULL,
    id_materia INT NOT NULL,
    calificacion DECIMAL(4,2) NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_materia) REFERENCES Materia(id_materia)
);

-- Tabla Horario (Now after Aula)
CREATE TABLE Horario (
    id_horario INT PRIMARY KEY AUTO_INCREMENT,
    id_grupo INT NOT NULL,
    id_materia INT NOT NULL,
    id_aula INT NOT NULL,
    dia_semana ENUM('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes') NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    FOREIGN KEY (id_grupo) REFERENCES Grupo(id_grupo),
    FOREIGN KEY (id_materia) REFERENCES Materia(id_materia),
    FOREIGN KEY (id_aula) REFERENCES Aula(id_aula)
);

-- Tabla Asistencia
CREATE TABLE Asistencia (
    id_asistencia INT PRIMARY KEY AUTO_INCREMENT,
    id_estudiante INT NOT NULL,
    id_grupo INT NOT NULL,
    fecha DATE NOT NULL,
    estado ENUM('Presente', 'Ausente', 'Justificado') NOT NULL,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiante(id_estudiante),
    FOREIGN KEY (id_grupo) REFERENCES Grupo(id_grupo)
);


-- Inserts

USE Escuela;

-- Inserts for Estudiante

INSERT INTO Estudiante (nombre, apellido, fecha_nacimiento, direccion, telefono, email) VALUES
('Juan', 'Pérez', '2005-03-15', 'Calle 123', '555-1234', 'juan.perez@example.com'),
('María', 'González', '2006-05-20', 'Avenida 456', '555-5678', 'maria.gonzalez@example.com'),
('Luis', 'Martínez', '2004-11-12', 'Plaza 789', '555-9012', 'luis.martinez@example.com'),
('Ana', 'López', '2005-02-28', 'Camino 321', '555-3456', 'ana.lopez@example.com'),
('Carlos', 'Rodríguez', '2006-07-07', 'Callejón 654', '555-7890', 'carlos.rodriguez@example.com'),
('Sofía', 'Hernández', '2004-09-09', 'Boulevard 987', '555-2345', 'sofia.hernandez@example.com'),
('Diego', 'Ramírez', '2005-01-15', 'Carretera 147', '555-6789', 'diego.ramirez@example.com'),
('Lucía', 'Torres', '2006-04-18', 'Avenida 258', '555-1122', 'lucia.torres@example.com'),
('Pedro', 'Sánchez', '2004-06-25', 'Calle 369', '555-3344', 'pedro.sanchez@example.com'),
('Elena', 'Castillo', '2005-12-05', 'Plaza 741', '555-5566', 'elena.castillo@example.com');

-- Inserts for Maestro

INSERT INTO Maestro (nombre, apellido, especialidad, telefono, email) VALUES
('José', 'López', 'Matemáticas', '555-9876', 'jose.lopez@example.com'),
('Claudia', 'Ramírez', 'Historia', '555-6543', 'claudia.ramirez@example.com'),
('Miguel', 'Hernández', 'Ciencias', '555-3210', 'miguel.hernandez@example.com'),
('Laura', 'Pérez', 'Lengua', '555-7777', 'laura.perez@example.com'),
('Fernando', 'García', 'Física', '555-8888', 'fernando.garcia@example.com'),
('Sara', 'Martínez', 'Química', '555-9999', 'sara.martinez@example.com'),
('Carlos', 'Sánchez', 'Biología', '555-0000', 'carlos.sanchez@example.com'),
('Ana', 'Rodríguez', 'Filosofía', '555-1234', 'ana.rodriguez@example.com'),
('Jorge', 'Fernández', 'Inglés', '555-5678', 'jorge.fernandez@example.com'),
('Lucía', 'Gómez', 'Geografía', '555-4321', 'lucia.gomez@example.com');

-- Inserts for Materia

INSERT INTO Materia (nombre, descripcion) VALUES
('Matemáticas', 'Álgebra y Geometría'),
('Historia', 'Historia Universal'),
('Ciencias', 'Ciencias Naturales'),
('Lengua', 'Gramática y Literatura'),
('Física', 'Mecánica y Termodinámica'),
('Química', 'Química Orgánica e Inorgánica'),
('Biología', 'Estudio de la Vida'),
('Filosofía', 'Pensamiento Crítico'),
('Inglés', 'Idioma y Gramática Inglesa'),
('Geografía', 'Geografía Mundial');

-- Inserts for Grupo

INSERT INTO Grupo (nombre, id_maestro) VALUES
('Grupo A', 1),
('Grupo B', 2),
('Grupo C', 3),
('Grupo D', 4),
('Grupo E', 5),
('Grupo F', 6),
('Grupo G', 7),
('Grupo H', 8),
('Grupo I', 9),
('Grupo J', 10);

-- Inserts for Aula

INSERT INTO Aula (nombre, capacidad, ubicacion) VALUES
('Aula 101', 30, 'Edificio A'),
('Aula 102', 25, 'Edificio A'),
('Aula 201', 20, 'Edificio B'),
('Aula 202', 35, 'Edificio B'),
('Aula 301', 40, 'Edificio C'),
('Aula 302', 30, 'Edificio C'),
('Laboratorio 1', 20, 'Edificio D'),
('Laboratorio 2', 20, 'Edificio D'),
('Sala de Conferencias', 50, 'Edificio E'),
('Aula 401', 30, 'Edificio F');

-- Inserts for Inscripcion

INSERT INTO Inscripcion (id_estudiante, id_grupo, fecha_inscripcion) VALUES
(1, 1, '2024-01-15'),
(2, 2, '2024-01-16'),
(3, 3, '2024-01-17'),
(4, 4, '2024-01-18'),
(5, 5, '2024-01-19'),
(6, 6, '2024-01-20'),
(7, 7, '2024-01-21'),
(8, 8, '2024-01-22'),
(9, 9, '2024-01-23'),
(10, 10, '2024-01-24');

-- Inserts for Calificacion

INSERT INTO Calificacion (id_estudiante, id_materia, calificacion, fecha) VALUES
(1, 1, 85.50, '2024-03-01'),
(2, 2, 90.00, '2024-03-02'),
(3, 3, 78.25, '2024-03-03'),
(4, 4, 88.75, '2024-03-04'),
(5, 5, 92.50, '2024-03-05'),
(6, 6, 80.00, '2024-03-06'),
(7, 7, 85.00, '2024-03-07'),
(8, 8, 89.25, '2024-03-08'),
(9, 9, 87.50, '2024-03-09'),
(10, 10, 91.00, '2024-03-10');

-- Inserts for Horario

INSERT INTO Horario (id_grupo, id_materia, id_aula, dia_semana, hora_inicio, hora_fin) VALUES
(1, 1, 1, 'Lunes', '08:00', '09:30'),
(2, 2, 2, 'Martes', '10:00', '11:30'),
(3, 3, 3, 'Miércoles', '12:00', '13:30'),
(4, 4, 4, 'Jueves', '14:00', '15:30'),
(5, 5, 5, 'Viernes', '16:00', '17:30'),
(6, 6, 6, 'Lunes', '08:00', '09:30'),
(7, 7, 7, 'Martes', '10:00', '11:30'),
(8, 8, 8, 'Miércoles', '12:00', '13:30'),
(9, 9, 9, 'Jueves', '14:00', '15:30'),
(10, 10, 10, 'Viernes', '16:00', '17:30');

-- Inserts for Asistencia

INSERT INTO Asistencia (id_estudiante, id_grupo, fecha, estado) VALUES
(1, 1, '2024-01-10', 'Presente'),
(2, 2, '2024-01-11', 'Ausente'),
(3, 3, '2024-01-12', 'Justificado'),
(4, 4, '2024-01-13', 'Presente'),
(5, 5, '2024-01-14', 'Presente'),
(6, 6, '2024-01-15', 'Ausente'),
(7, 7, '2024-01-16', 'Presente'),
(8, 8, '2024-01-17', 'Justificado'),
(9, 9, '2024-01-18', 'Presente'),
(10, 10, '2024-01-19', 'Ausente');


