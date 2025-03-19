DROP DATABASE IF EXISTS productos2;
CREATE DATABASE productos2;
USE productos2;

SET SQL_SAFE_UPDATES = 0;

CREATE TABLE productos (

    id INT PRIMARY KEY,

    nombre VARCHAR(50),

    categoria VARCHAR(50),

    precio DECIMAL(10, 2),

    stock INT,

    descuento DECIMAL(10, 2)

);

 

INSERT INTO productos (id, nombre, categoria, precio, stock, descuento) VALUES

(1, 'Laptop', 'Tecnología', 1500.00, 10, NULL),

(2, 'Mouse', 'Tecnología', 25.00, NULL, 5.00),

(3, 'Teclado', 'Tecnología', 50.00, 60, NULL),

(4, 'Monitor', 'Tecnología', 300.00, 20, 15.00),

(5, 'Silla', 'Muebles', 120.00, NULL, NULL),

(6, 'Escritorio', 'Muebles', 250.00, 5, 10.00);

 

-- Mostrar todos los productos y su stock. Si el stock es NULL, mostrar 0.
SELECT nombre, IFNULL(stock,0) AS stock_disponible
FROM productos;

-- Mostrar el nombre del producto y el precio_final considerando el descuento. Si descuento es NULL, considerarlo como 0.
SELECT nombre, precio, 
IFNULL(descuento, 0) AS descuento_aplicado,
precio - IFNULL(descuento, 0) AS precio_final
FROM productos;

-- Mostrar el nombre y una columna categoria_segura que muestre "Desconocida" si la categoría es NULL.
SELECT nombre,
IFNULL(categoria,'Desconocida') AS categoria_segura
FROM productos;

-- Actualizar el campo stock para que, si es NULL, se establezca en 0.
UPDATE productos
SET stock = 0
WHERE stock IS NULL;

-- Actualizar el campo descuento para que, si es NULL, se establezca en 0.
UPDATE productos
SET descuento = 0
WHERE descuento IS NULL;
select descuento from productos;

-- Mostrar todos los productos ordenados por stock, considerando los NULL como 0.
SELECT nombre, IFNULL(stock, 0) AS stock_disponible
FROM productos
ORDER BY stock_disponible;

