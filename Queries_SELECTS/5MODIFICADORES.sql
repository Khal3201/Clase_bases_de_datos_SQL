USE sakila;

-- Obtener la fecha más antigua de alquiler   

SELECT min(rental_date) FROM rental;

-- Obtener el ID de actor más bajo   

SELECT min(actor_id) FROM actor;

-- Obtener la duración mínima de una película   

SELECT min(length) FROM film;

-- Obtener la fecha más reciente de alquiler   

SELECT max(rental_date) FROM rental;

-- Obtener el ID de actor más alto   

SELECT max(actor_id) FROM actor;

-- Obtener la duración máxima de una película   

SELECT min(length) FROM film;

-- Contar el número total de actores   

SELECT count(*) AS numero_total_de_actores FROM actor;

-- Contar cuántas películas tienen clasificación PG   

SELECT count(*) FROM film WHERE rating="pg";

-- Contar cuántos clientes hay en la tienda 1   

SELECT count(*) FROM customer WHERE store_id=1;

-- Sumar todos los pagos registrados   

SELECT sum(amount) FROM payment;

-- Sumar la duración total de todas las películas   

SELECT sum(length) FROM film;

-- Sumar todos los pagos de un cliente específico (ID 5)   

SELECT sum(amount) FROM payment WHERE customer_id=5;

-- Calcular el promedio de duración de las películas   

SELECT avg(length) FROM film;

-- Calcular el promedio de los pagos realizados   

SELECT avg(amount) FROM payment;

-- Calcular el promedio de duración de alquiler de las películas   

SELECT avg(DATEDIFF(return_date,rental_date)) FROM rental;

-- Mostrar nombres de actores con alias de nombre y apellido   

SELECT first_name AS nombre, last_name AS appellido FROM actor;

-- Mostrar la cantidad total de películas con un alias   

SELECT count(film_id) AS total_de_peliculas FROM film;

-- Calcular el pago total por cliente con un alias   

SELECT sum(amount) AS pago_total FROM payment WHERE customer_id=5;

-- Concatenar el nombre y apellido de los actores   

SELECT concat(first_name, ' ', last_name) AS actor FROM actor;

-- Concatenar el título de la película con su clasificación   

SELECT concat(title, ' - ', rating) AS pelicula FROM film;

-- Concatenar el nombre completo del cliente con su ID   

SELECT concat(first_name, ' ', last_name, ' - ',actor_id) AS actor FROM actor;

-- Convertir todos los nombres de actores a mayúsculas   

SELECT upper(first_name) AS actor FROM actor;

-- Convertir los nombres de las películas a mayúsculas   

SELECT upper(title) AS pelicula FROM film;

-- Convertir el nombre del país a mayúsculas   

SELECT upper(country) AS country FROM country;

-- Convertir todos los nombres de actores a minúsculas   

SELECT lower(first_name) AS actor FROM actor;

-- Convertir los nombres de las películas a minúsculas   

SELECT lower(title) AS pelicula FROM film;

-- Convertir el nombre del país a minúsculas   

SELECT lower(country) AS country FROM country;

-- Obtener 5 películas saltando las primeras 10 en orden alfabético   

SELECT * FROM film limit 5 offset 10;

-- Obtener 5 clientes saltando los primeros 15 en orden por apellido   

SELECT * FROM actor ORDER BY last_name ASC LIMIT 5 OFFSET 15;
