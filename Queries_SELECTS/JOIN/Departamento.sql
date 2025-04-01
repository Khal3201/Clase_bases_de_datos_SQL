DROP SCHEMA IF EXISTS departamento;

CREATE SCHEMA departamento;

USE departamento;

CREATE TABLE departamento (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT,
    ubicacion VARCHAR(100)
);

CREATE TABLE vendedor (
    id_vendedor INT PRIMARY KEY AUTO_INCREMENT,
    id_departamento INT,
    nombre VARCHAR(100) NOT NULL,
    rfc VARCHAR(13) NOT NULL,
    telefono VARCHAR(10) UNIQUE,
    correo VARCHAR(100),
    salario DECIMAL(10,2),
    direccion VARCHAR(100),
    FOREIGN KEY (id_departamento) references departamento(id_departamento)
);

CREATE TABLE marca (
    id_marca INT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT
);

CREATE TABLE articulo (
    id_articulo INT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    existencia INT NOT NULL,
    id_departamento INT,
    id_marca INT,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_marca) REFERENCES marca(id_marca) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO departamento (descripcion, ubicacion) VALUES
('Electrónica', 'Piso 1'),
('Electrónica', 'Piso 1'),
('Electrónica', NULL),
('Ropa', 'Piso 2'),
('Ropa', NULL),
('Electrónica', 'Piso 1'),
('Hogar', 'Piso 3'),
('Hogar', 'Piso 3'),
('Electrónica', 'Piso 4'),
(NULL, 'Piso 5'),
('Deportes', 'Piso 6'),
('Deportes', 'Piso 6'),
('Muebles', NULL),
('Muebles', 'Piso 7'),
(NULL, 'Piso 8'),
('Muebles', 'Piso 9'),
('Tecnología', 'Piso 10'),
('Tecnología', 'Piso 10'),
(NULL, 'Piso 11'),
('Tecnología', 'Piso 12'),
('Ropa', 'Piso 13'),
('Ropa', 'Piso 14'),
('Accesorios', 'Piso 15'),
('Accesorios', NULL);

-- Inserta los vendedores con su respectivo id_departamento
INSERT INTO vendedor (id_departamento, nombre, rfc, telefono, correo, salario, direccion) VALUES
(1, 'Juan Pérez', 'JUAP850101MN1', '5550123456', 'juan@example.com', 15000.50, 'Calle Ficticia 123'),
(2, 'Carlos López', 'CALO890102HDF', NULL, NULL, 12000.00, 'Avenida Principal 456'),
(3, 'Ana Martínez', 'ANAM760321MNL', '5550345678', 'ana@example.com', 18000.75, NULL),
(4, 'Sofía González', 'SOGU990305FQ4', NULL, 'sofia@example.com', 13000.00, 'Calle 7'),
(5, 'José Sánchez', 'JOSA901212J34', '5550456789', NULL, NULL, 'Calle Sol'),
(6, 'Pedro Ramírez', 'PERA950101HR6', '5550567890', 'pedro@example.com', 14000.00, 'Calle Luna'),
(7, 'Laura Díaz', 'LADI880507MJ2', '5550678901', 'laura@example.com', 16000.25, 'Calle del Sol'),
(8, 'Pedro Jiménez', 'PEJI820321D56', NULL, 'pedro.jimenez@example.com', 15000.00, 'Calle 23'),
(9, 'Raúl Torres', 'RATO750603F24', '5550789012', 'raul@example.com', 19000.00, 'Calle Viento'),
(10, 'Marta López', 'MALO950707M34', '5550890123', 'marta@example.com', 11000.00, NULL),
(11, 'Eduardo Pérez', 'EDPE880111HDF', '5550901234', NULL, 20000.50, 'Calle Otoño'),
(12, 'Claudia Ríos', 'CLRI950709H75', NULL, 'claudia@example.com', NULL, NULL);


-- Insert data into marca table
INSERT INTO marca (descripcion) VALUES
('Samsung'),
('Sony'),
('Apple'),
('LG'),
('Huawei'),
('Xiaomi'),
('Nokia'),
('Motorola'),
('Alcatel'),
('OnePlus'),
('Lenovo');

-- Insert data into articulo table
INSERT INTO articulo (descripcion, precio, existencia, id_departamento, id_marca) VALUES
('Smartphone Samsung', 5999.99, 10, 1, 1),
('Smartphone Sony', 6999.99, 15, 1, 2),
('iPhone 13', 25999.99, 5, 2, 3),
('Laptop HP', 8999.99, 7, 3, 4),
('Tablet Huawei', 3599.99, 20, 4, 5),
('Televisor LG', 8999.99, 10, 5, 6),
('Smartwatch Xiaomi', 1599.99, 25, 6, 7),
('Auriculares Nokia', 1999.99, 30, 7, 8),
('Smartphone Motorola', 4999.99, 12, 8, 9),
('Smartphone Alcatel', 3999.99, 50, 9, 10),
('Smartphone OnePlus', 10999.99, 8, 10, 11);


/*
INNER JOIN:

Ejercicio 1: 
Realiza una consulta que devuelva el nombre de los vendedores
y la descripción de los departamentos en los que están asignados.
La consulta debe unir la tabla vendedor y la tabla departamento basándose en el id_departamento.
 
Ejercicio 2:
Crea una consulta que obtenga la descripción de los artículos, el precio y el nombre del vendedor que los vende.
Para ello, realiza un INNER JOIN entre las tablas articulo y vendedor basándote en la relación entre id_vendedor y id_departamento.
*/
-- 1
SELECT v.nombre, d.descripcion
FROM vendedor v
JOIN departamento d
ON v.id_departamento = d.id_departamento;

-- 2
SELECT a.descripcion, a.precio, v.nombre AS vendedor
FROM articulo a
JOIN vendedor v
ON a.id_departamento = v.id_vendedor;

/*
LEFT JOIN:

Ejercicio 1:
Realiza una consulta que muestre todos los departamentos y, si los hay, el nombre del vendedor asignado a cada departamento.
Si un departamento no tiene vendedor, la consulta debe mostrar NULL en la columna de vendedor.
Usa un LEFT JOIN entre la tabla departamento y vendedor.

Ejercicio 2: 
Escribe una consulta que liste todos los artículos junto con el nombre de la marca a la que pertenecen.
Si algún artículo no tiene marca asignada, debe aparecer como NULL. 
Usa un LEFT JOIN entre las tablas articulo y marca.

*/
-- 1
SELECT d.descripcion, v.nombre
FROM vendedor v
LEFT JOIN departamento d
ON d.id_departamento = v.id_departamento;

-- 2
SELECT a.descripcion as producto, m.descripcion as marca
FROM articulo a
LEFT JOIN marca m
ON a.id_marca = m.id_marca;

/*
RIGHT JOIN:

Ejercicio 1: 
Crea una consulta que muestre todos los vendedores y, si están asignados a algún departamento, la descripción del departamento. 
Si un vendedor no está asignado a ningún departamento, la consulta debe mostrar NULL en la columna de departamento. Usa un RIGHT JOIN entre vendedor
y departamento.

Ejercicio 2: 
Realiza una consulta que devuelva la descripción de los artículos y el nombre del vendedor que los vende.
Si un artículo no tiene vendedor asignado, muestra NULL en la columna del vendedor. Usa un RIGHT JOIN entre articulo y vendedor.*/
