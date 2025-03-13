/*
1. Calcule el monto de las rentas de cada empleado con durante el mes de
mayo
2. Calcule el promedio de los pagos por cada mes
3. Calcule el promedio de los pagos de cada cliente
4. Calcule el promedio de los pagos de cada día de la semana
5. Calcule cuantas rentas tiene cada cliente
6. Calcule cuantas rentas tiene cada empleado
7. Calcule cuantos clientes tiene cada tienda
8. Calcule cuantas películas tiene cada categoría de rating
9. Calcule cuantas ciudades están registradas por país
10. Calcule cuantas películas hay en cada tienda
11. Calcule el monto total de pagos de cada cliente
12. Liste los empleados que han generado pagos con un monto total mayor a
$100
13. Calcule el número de pagos realizados por cada cliente en el mes de junio
14. Calcule la cantidad de películas por cada duración de renta
(rental_duration)
15. Calcule la cantidad total de pagos recibidos cada año
16. Calcule el monto total de pagos por cada día de la semana
17. Liste los días donde el total de pagos fue mayor a $500
18. Calcule cuántas películas hay en cada duración (length) específica
19. Calcule la cantidad de pagos realizados en cada tienda
20. Calcule el monto total de pagos por cada cliente, pero solo para aquellos
que han realizado más de 5 pagos
21. Calcule el número de películas según su clasificación (rating)
22. Liste los clientes que han realizado pagos con un monto promedio mayor a
$5
23. Calcule la cantidad de películas en cada duración de renta
(rental_duration) mayor a 5 días
24. Calcule el total de pagos recibidos por cada mes, pero solo los meses con
más de 100 pagos
25. Liste las clasificaciones de películas (rating) que tienen más de 200
películas registradas
*/

USE sakila;
-- 1
SELECT customer_id,amount FROM payment WHERE MONTH(payment_date)=5 GROUP BY amount;

-- 2
SELECT MONTH(payment_date) AS mes, AVG(amount) AS promedio_pagos
FROM payment
GROUP BY MONTH(payment_date);

-- 3
SELECT customer_id, AVG(amount) AS promedio_pagos
FROM payment
GROUP BY customer_id;

-- 4
SELECT DAYNAME(payment_date) AS dia, AVG(amount) AS promedio_pagos
FROM payment
GROUP BY DAYNAME(payment_date);

-- 5
SELECT customer_id, COUNT(*) AS total_rentas
FROM rental
GROUP BY customer_id;

-- 6
SELECT staff_id, COUNT(*) AS total_rentas
FROM rental
GROUP BY staff_id;

-- 7
SELECT store_id, COUNT(*) AS total_clientes
FROM customer
GROUP BY store_id;

-- 8
SELECT rating, COUNT(*) AS total_peliculas
FROM film
GROUP BY rating;

-- 9
SELECT country_id, COUNT(*) AS total_ciudades
FROM city
GROUP BY country_id;

-- 10
SELECT store_id, COUNT(*) AS total_peliculas
FROM inventory
GROUP BY store_id;

-- 11
SELECT customer_id, SUM(amount) AS total_pagado
FROM payment
GROUP BY customer_id;

-- 12
SELECT staff_id, SUM(amount) AS total_pagado
FROM payment
GROUP BY staff_id
HAVING total_pagado > 100;

-- 13
SELECT customer_id, COUNT(*) AS total_pagos
FROM payment
WHERE MONTH(payment_date) = 6
GROUP BY customer_id;

-- 14
SELECT rental_duration, COUNT(*) AS total_peliculas
FROM film
GROUP BY rental_duration;

-- 15
SELECT YEAR(payment_date) AS anio, COUNT(*) AS total_pagos
FROM payment
GROUP BY YEAR(payment_date);

-- 16
SELECT DAYNAME(payment_date) AS dia, SUM(amount) AS total_pagos
FROM payment
GROUP BY DAYNAME(payment_date);

-- 17
SELECT DATE(payment_date) AS dia, SUM(amount) AS total_pagos
FROM payment
GROUP BY DATE(payment_date)
HAVING total_pagos > 500;

-- 18
SELECT length, COUNT(*) AS total_peliculas
FROM film
GROUP BY length;

-- 19
SELECT c.store_id, COUNT(*) AS total_pagos
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
GROUP BY c.store_id;

-- 20
SELECT customer_id, SUM(amount) AS total_pagado
FROM payment
GROUP BY customer_id
HAVING COUNT(*) > 5;

-- 21
SELECT rating, COUNT(*) AS total_peliculas
FROM film
GROUP BY rating;

-- 22
SELECT customer_id, AVG(amount) AS promedio_pago
FROM payment
GROUP BY customer_id
HAVING promedio_pago > 5;

-- 23
SELECT rental_duration, COUNT(*) AS total_peliculas
FROM film
WHERE rental_duration > 5
GROUP BY rental_duration;

-- 24
SELECT MONTH(payment_date) AS mes, SUM(amount) AS total_pagado
FROM payment
GROUP BY MONTH(payment_date)
HAVING COUNT(*) > 100;

-- 25
SELECT rating, COUNT(*) AS total_peliculas
FROM film
GROUP BY rating
HAVING total_peliculas > 200;

