USE sakila;

-- Liste los identificadores, títulos y descripciones de las películas en el catalogo 
SELECT DISTINCT f.film_id, f.title, f.description
FROM film f
JOIN inventory i
ON i.film_id = f.film_id;

-- Liste los identificadores, títulos de las películas en el catalogo y nombres completos de los actores que participan en cada una de ellas 
SELECT f.film_id, f.title, CONCAT(a.first_name, ' ', a.last_name) AS actor
FROM actor a
INNER JOIN film_actor fa
ON a.actor_id = fa.actor_id
INNER JOIN film f
ON fa.actor_id = f.film_id;

-- Liste los nombres completos de los actores registrados asi como los títulos de las películas en que participan que están el catalogo de la empresa 
SELECT CONCAT(a.first_name, ' ', a.last_name) AS actor, f.title
FROM actor a
INNER JOIN film_actor fa
ON a.actor_id = fa.actor_id
INNER JOIN film f
ON fa.actor_id = f.film_id;

-- Liste los nombres de los clientes y los títulos de las películas que ha rentado
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer, f.title
FROM customer c 
INNER JOIN rental r
ON c.customer_id = r.customer_id
INNER JOIN inventory i
ON i.inventory_id = r.inventory_id
INNER JOIN film f
ON f.film_id = i.film_id;

-- Lista cuantos clientes tiene cada miembro del staff 
SELECT COUNT(c.customer_id) AS customers, CONCAT(st.first_name,' ',st.last_name) AS staff
FROM customer c
JOIN store s
ON s.store_id = c.store_id
JOIN staff st
ON st.staff_id = s.manager_staff_id
GROUP BY st.staff_id, st.first_name, st.last_name;

-- Calcularemos la suma de pagos registrados agrupados por tienda y la dirección de la tienda 
SELECT SUM(p.amount) AS amount, s.store_id, a.address_id
FROM payment p
JOIN staff st
ON st.staff_id = p.staff_id
JOIN store s
ON st.staff_id = s.manager_staff_id
JOIN address a
ON a.address_id = s.address_id
GROUP BY s.store_id, a.address_id;
 