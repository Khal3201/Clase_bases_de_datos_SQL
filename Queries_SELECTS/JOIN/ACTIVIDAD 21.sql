USE sakila;

/*• Liste las ciudades (id y nombre) y las tiendas que se encuentran en cada
ciudad, use RIGHT JOIN para mostrar TODAS las ciudades haya o no tiendas
en ellas.
*/
SELECT c.city_id, c.city, st.store_id 
FROM store st
RIGHT JOIN address ad
ON st.address_id = ad.address_id
RIGHT JOIN city c
ON ad.city_id = c.city_id;

/*• Liste los países (id y nombre) y las ciudades que se encuentran en cada
país, use RIGHT JOIN para mostrar TODOS los países haya o no ciudades
en ellos
*/
SELECT co.country_id, co.country, c.city
FROM country co
RIGHT JOIN city c
ON c.country_id = co.country_id;
/*
 -- • Liste las ciudades (id y nombre) y los clientes que se encuentran en cada
ciudad, use RIGHT JOIN para mostrar TODAS las ciudades haya o no
clientes en ellas.
*/
SELECT c.city_id, c.city, CONCAT(cu.first_name,' ',cu.last_name) AS customer
FROM customer cu
RIGHT JOIN address ad
ON ad.address_id = cu.address_id
RIGHT JOIN city c
ON c.city_id = ad.city_id;

-- • Liste las películas que para la tienda 1 no hayan sido rentadas
SELECT f.film_id, f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE i.store_id = 1 AND r.rental_id IS NULL
GROUP BY f.film_id, f.title
ORDER BY f.title;

-- • Liste los nombres de los actores y en cuantas películas del catalogo participa
SELECT CONCAT(a.first_name, ' ',a.last_name) AS actor, COUNT(fa.film_id) AS films
FROM actor a
RIGHT JOIN film_actor fa
ON a.actor_id = fa.actor_id
GROUP BY film_id;
-- • Liste los nombres de las películas y en cuantas tiendas están registradas
SELECT f.title, COUNT(DISTINCT i.store_id) AS stores
FROM film f
JOIN inventory i ON f.film_id = i.film_id
GROUP BY f.film_id, f.title
ORDER BY stores DESC, f.title;

-- • Liste los idiomas y cuantas películas están habladas en ese idioma
SELECT l.name, COUNT(f.title) AS films
FROM language l
RIGHT JOIN film f ON f.language_id = l.language_id
GROUP BY l.name;

-- • Liste cuantas veces ha sido rentada cada película en el catalogo
SELECT f.title, COUNT(r.rental_id) AS times_rented
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
ORDER BY times_rented DESC, f.title;

-- • Liste cuantos pagos se realizaron en cada renta
SELECT rental_id, COUNT(payment_id) AS cantidad_pagos
FROM payment
GROUP BY rental_id
ORDER BY cantidad_pagos DESC;

-- • Liste cuantas películas ha rentado cada cliente
SELECT customer_id, COUNT(rental_id) AS rented_films
FROM rental
GROUP BY customer_id
ORDER BY rented_films DESC;

-- • Liste cuantas películas ha rentado cada miembro del staff 
SELECT staff_id, COUNT(rental_id) AS cantidad_peliculas_rentadas
FROM rental
GROUP BY staff_id;

-- • Liste los clientes que han generado pagos con un monto total mayor a $10
SELECT customer_id, SUM(amount) AS total_pagado
FROM payment
GROUP BY customer_id
HAVING total_pagado > 10;

-- • Liste los empleados que han generado pagos con un monto total mayor a $100
SELECT staff_id, SUM(amount) AS total_generado
FROM payment
GROUP BY staff_id
HAVING total_generado > 100;

-- • Calcule el número de pagos realizados por cada cliente en el mes de junio
SELECT customer_id, COUNT(payment_id) AS pagos_en_junio
FROM payment
WHERE MONTH(payment_date) = 6
GROUP BY customer_id;

-- • Calcule la cantidad de películas por cada duración de renta (rental_duration)
SELECT rental_duration, COUNT(*) AS cantidad_peliculas
FROM film
GROUP BY rental_duration;

-- • Calcule la cantidad total de pagos recibidos cada año
SELECT YEAR(payment_date) AS año, SUM(amount) AS total_pagado
FROM payment
GROUP BY año
ORDER BY año;

-- • Calcule el monto total de pagos por cada día de la semana
SELECT DAYNAME(payment_date) AS dia, SUM(amount) AS total_pagado
FROM payment
GROUP BY dia;

-- • Liste los días donde el total de pagos fue mayor a $50
SELECT DATE(payment_date) AS fecha, SUM(amount) AS total_pagado
FROM payment
GROUP BY fecha
HAVING total_pagado > 50;

-- • Calcule cuántas películas hay en cada duración (length) específica
SELECT length, COUNT(*) AS cantidad_peliculas
FROM film
GROUP BY length;

-- • Calcule la cantidad de pagos realizados en cada tienda
SELECT i.store_id, COUNT(p.payment_id) AS cantidad_pagos
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
GROUP BY i.store_id;

/*• Calcule el monto total de pagos por cada cliente, pero solo para
aquellos que han realizado más de 5 pagos
*/
SELECT i.store_id, COUNT(p.payment_id) AS cantidad_pagos
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
GROUP BY i.store_id;

/*• Calcule el número de películas (puede haber mas de 1 película por
cada titulo) según su clasificación (rating)
*/
SELECT length, COUNT(*) AS cantidad_peliculas
FROM film
GROUP BY length;

-- • Liste los clientes que han realizado pagos con un monto promedio mayor a $5
SELECT customer_id, SUM(amount) AS total_pagado
FROM payment
GROUP BY customer_id
HAVING COUNT(payment_id) > 5;

/*• Calcule la cantidad de títulos de películas en cada duración de renta
(rental_duration) mayor a 5 días
*/
SELECT rental_duration, COUNT(DISTINCT title) AS cantidad_titulos
FROM film
WHERE rental_duration > 5
GROUP BY rental_duration;

/*• Liste el total de pagos recibidos por cada mes, pero solo los meses
con más de 100 pagos
*/
SELECT MONTH(payment_date) AS mes, COUNT(*) AS cantidad_pagos, SUM(amount) AS total_pagado
FROM payment
GROUP BY mes
HAVING cantidad_pagos > 100;

/*• Liste las clasificaciones de películas (rating) que tienen más de 50
películas registradas
*/
SELECT rating, COUNT(*) AS cantidad_peliculas
FROM film
GROUP BY rating
HAVING cantidad_peliculas > 50;
