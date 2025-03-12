DROP SCHEMA IF EXISTS TiendaDepartamental;

CREATE DATABASE TiendaDepartamental;

USE TiendaDepartamental;

-- Tabla Departamento
CREATE TABLE Departamento (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla Marca
CREATE TABLE Marca (
    id_marca INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla Proveedor
CREATE TABLE Proveedor (
    id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(100),
    direccion TEXT
);

-- Tabla Articulo
CREATE TABLE Articulo (
    id_articulo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    existencia INT NOT NULL,
    id_departamento INT NOT NULL,
    id_marca INT NOT NULL,
    id_proveedor INT NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento),
    FOREIGN KEY (id_marca) REFERENCES Marca(id_marca),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
);



-- Tabla Cliente
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion TEXT NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100)
);

-- Tabla Vendedor
CREATE TABLE Vendedor (
    id_vendedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    rfc VARCHAR(13) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100)
);

-- Tabla Venta
CREATE TABLE Venta (
    id_venta INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id_vendedor)
);

-- Tabla Detalle_Venta
CREATE TABLE Detalle_Venta (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_venta INT NOT NULL,
    id_articulo INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES Venta(id_venta),
    FOREIGN KEY (id_articulo) REFERENCES Articulo(id_articulo)
);

-- Tabla Inventario
CREATE TABLE Inventario (
    id_inventario INT PRIMARY KEY AUTO_INCREMENT,
    id_articulo INT NOT NULL,
    cantidad INT NOT NULL,
    ubicacion VARCHAR(100) NOT NULL,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_articulo) REFERENCES Articulo(id_articulo)
);

-- Inserts, Agregando datos a las tablas

-- Insertar datos en la tabla Departamento


INSERT INTO Departamento (nombre) VALUES 
('Electrónica'),
('Ropa'),
('Hogar'),
('Deportes');

-- Insertar datos en la tabla Marca

INSERT INTO Marca (nombre) VALUES 
('Samsung'),
('Nike'),
('LG'),
('Adidas');

-- Insertar datos en la tabla Proveedor

INSERT INTO Proveedor (nombre, contacto, telefono, email, direccion) VALUES 
('Distribuidora Tech', 'Juan López', '5557778888', 'juan@tech.com', 'Av. Reforma 123, CDMX'),
('Moda Express', 'Ana Ramírez', '5556665555', 'ana@moda.com', 'Insurgentes Sur 456, CDMX');

-- Insertar datos en la tabla Articulo

INSERT INTO Articulo (nombre, precio, existencia, id_departamento, id_marca, id_proveedor) VALUES 
('Televisor 55"', 12000.00, 10, 1, 1, 1),
('Camiseta deportiva', 500.00, 30, 2, 2, 2),
('Refrigerador', 8500.00, 5, 3, 3, 1),
('Zapatillas running', 1800.00, 20, 4, 4, 2);

-- Insertar datos en la tabla Cliente

INSERT INTO Cliente (nombre, direccion, telefono, email) VALUES 
('Juan Pérez', 'Calle 123, CDMX', '5551234567', 'juan@email.com'),
('María López', 'Av. Reforma, CDMX', '5559876543', 'maria@email.com'),
('Carlos Díaz', 'Insurgentes Sur, CDMX', '5552223344', 'carlos@email.com');

-- Insertar datos en la tabla Vendedor

INSERT INTO Vendedor (nombre, rfc, telefono, email) VALUES 
('Pedro Gómez', 'PGO12345678X', '5551112222', 'pedro@email.com'),
('Laura Méndez', 'LME98765432Y', '5553334444', 'laura@email.com');


-- Insertar datos en la tabla Venta

INSERT INTO Venta (id_cliente, id_vendedor, fecha_venta, total) VALUES 
(1, 1, '2024-02-01 14:30:00', 12000.00),
(2, 2, '2024-02-02 15:00:00', 500.00),
(3, 1, '2024-02-03 16:45:00', 1800.00);


-- Insertar datos en la tabla Detalle_Venta

INSERT INTO Detalle_Venta (id_venta, id_articulo, cantidad, precio_unitario, subtotal) VALUES 
(1, 1, 1, 12000.00, 12000.00),
(2, 2, 1, 500.00, 500.00),
(3, 4, 1, 1800.00, 1800.00);


-- Insertar datos en la tabla Inventario

INSERT INTO Inventario (id_articulo, cantidad, ubicacion, fecha_actualizacion) VALUES 
(1, 10, 'Almacén Central', '2024-02-01 10:00:00'),
(2, 30, 'Tienda CDMX', '2024-02-02 11:30:00'),
(3, 5, 'Bodega Norte', '2024-02-03 12:45:00');

INSERT INTO Inventario (id_articulo, cantidad, ubicacion) VALUES 
(1, 10, 'Almacén Central'),
(2, 30, 'Tienda CDMX', '2024-02-02 11:30:00'),
(3, 5, 'Bodega Norte', '2024-02-03 12:45:00');
