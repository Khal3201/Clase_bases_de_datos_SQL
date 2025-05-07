USE sakila;
-- Muestra los títulos de las películas que tienen la misma duración que la
-- película 'ALIEN CENTER'.

SELECT title
FROM film
WHERE length = (
	SELECT length
    FROM film 
    WHERE title = 'ALIEN CENTER'
    );

-- Muestra los nombres de los clientes que han hecho al menos un pago mayor a
-- 5 dólares.

SELECT CONCAT(first_name,' ' ,last_name) AS customer
FROM customer
WHERE customer_id IN (
 SELECT customer_id
 FROM payment
 WHERE amount > 5
);

-- Muestra los títulos de las películas que tienen el mismo precio de renta que la
-- película 'ZOOLANDER FICTION'.

SELECT title
FROM film
WHERE rental_rate = (
	SELECT rental_rate
    FROM film
    WHERE title = 'ZOOLANDER FICTION'
);

-- Muestra los nombres de los actores que actuaron en la película
-- 'GHOSTBUSTERS ELF'.

SELECT CONCAT(first_name, ' ', last_name) AS actor
FROM actor
WHERE actor_id IN (
	SELECT fa.actor_id
    FROM film_actor fa
    JOIN film f
    ON fa.film_id = f.film_id
    WHERE f.title = 'GHOSTBUSTERS ELF'
);

-- Muestra las películas cuya duración es mayor al promedio de todas las
-- películas.

SELECT title
FROM film
WHERE length > (
	SELECT AVG(length)
    FROM film
);

-- Lista los nombres de los clientes que han realizado al menos un pago.

SELECT CONCAT(first_name, ' ', last_name) AS customer
FROM customer
WHERE customer_id IN(
	SELECT customer_id
    FROM payment
);

-- Muestra los títulos de las películas que nunca han sido rentadas.

SELECT title
FROM film f
WHERE NOT EXISTS (
 SELECT 1
 FROM inventory i
 JOIN rental r ON r.inventory_id = i.inventory_id
 WHERE i.film_id = f.film_id
);

-- Muestra el nombre de las categorías que tienen más de 50 películas.

SELECT c.name
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.name
HAVING COUNT(fc.film_id) > (
    SELECT 50
);

-- Muestra los nombres de los empleados que trabajan en la tienda que tiene
--  más películas en inventario.

SELECT CONCAT(st.first_name, ' ', st.last_name) AS staff
FROM staff st
JOIN store s ON st.store_id = s.store_id
WHERE s.store_id = (
    SELECT i.store_id
    FROM inventory i
    GROUP BY i.store_id
    ORDER BY COUNT(i.inventory_id) DESC
    LIMIT 1
);

-- Muestra los títulos de las películas que tienen el mismo rating que la película
-- 'ACADEMY DINOSAUR'.

SELECT title
FROM film
WHERE rating = (
	SELECT rating
    FROM film
    WHERE title = 'ACADEMY DINOSAUR'
);

-- Muestra el nombre de los actores que han participado en más de 20
-- películas.

SELECT CONCAT(a.first_name, ' ', a.last_name) AS actor
FROM actor a 
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
HAVING COUNT(fa.actor_id) > (
	SELECT 20
);
-- Muestra los títulos de las películas que tienen el mismo costo de reposición
-- que la película 'CRUSADE HONEY'.

SELECT title
FROM film
WHERE replacement_cost = (
	SELECT replacement_cost
    FROM film
    WHERE title = 'CRUSADE HONEY'
);