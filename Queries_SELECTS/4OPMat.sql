-- Uso de operadores lógicos/matemáticos 

-- Alias

SELECT title AS Pelicula, rental_rate AS Tarifa FROM film;

/* Listaremos el identificador del cliente (customer_id) y pago (payment_id),monto (amount) 
y calcularemos el IVA y el total para la rentas del identificador de cliente igual a 1. */

SELECT payment_id, customer_id, amount, amount*0.16, amount*1.16
FROM payment 
WHERE customer_id=1;


SELECT payment_id, customer_id, amount, amount*0.16 as IVA, amount*1.16 as total 
FROM payment 
WHERE customer_id=1;


/* Listaremos el identificador del cliente (customer_id) y pago (payment_id),monto (amount) 
y calcularemos el IVA y el total para la rentas del identificador de cliente igual a 1 o 3. */

SELECT payment_id, customer_id, amount, amount*0.16 as IVA, amount*1.16 as total 
FROM payment 
WHERE customer_id=1 or customer_id=3;

/* Listaremos el identificador del cliente (customer_id) y pago (payment_id),monto (amount) 
y calcularemos el IVA y el total para la rentas con monto mayor que 4.99. */

SELECT payment_id, customer_id, amount, amount*0.16 as IVA, amount*1.16 as total 
FROM payment 
WHERE amount>4.99;

/* Listaremos el identificador del cliente (customer_id) y pago (payment_id),monto (amount) 
y calcularemos el IVA y el total para la rentas con monto mayor o igual que 4.99. */

SELECT payment_id, customer_id, amount, amount*0.16 as IVA, amount*1.16 as total 
FROM payment 
WHERE amount>=4.99;

/* Listaremos el identificador del cliente (customer_id) y pago (payment_id),monto (amount) 
y calcularemos el IVA y el total para la rentas con monto menor o igual que 4.99. */

SELECT payment_id, customer_id, amount, amount*0.16 as IVA, amount*1.16 as total 
FROM payment 
WHERE amount<=4.99;

/* Listaremos el identificador del cliente (customer_id) y pago (payment_id),monto (amount) 
y calcularemos el IVA y el total para la rentas con monto menor que 4.99. */

SELECT payment_id, customer_id, amount, amount*0.16 as IVA, amount*1.16 as total 
FROM payment 
WHERE amount<4.99;

-- Actividad 12

/*
Calcularemos el porcentaje de comisión del mes de mayo del empleado con id=2 
aplicando un 10% al monto de las rentas
*/

SELECT staff_id, amount*0.10
FROM payment
WHERE staff_id=2 AND month(payment_date)=5;

SELECT staff_id, amount * 0.10 AS commission_p
FROM payment
WHERE staff_id = 2 AND MONTH(payment_date) = 5;

/*
Calcularemos el porcentaje de comisión del mes de Junio del empleado con id=1 
aplicando un 10% al monto de las rentas 
*/

SELECT staff_id, amount*0.10
FROM payment
WHERE staff_id=1 
AND month(payment_date)=6;

SELECT staff_id, amount * 0.10 AS commission_percentage
FROM payment
WHERE staff_id = 1 
AND MONTH(payment_date) = 6;

/*

El día 30 de mayo se agrega 1 dólar a la comisión de todos los empleados (que es del 10% del monto de la renta) 
muestre el listado de las rentas del día 
calculando la comisión  de forma que la comisión no sea mayor al 50% del monto de la renta 

*/

SELECT staff_id, amount, amount*0.10+1 as comission		
FROM payment		
WHERE month(payment_date)=5 
and day(payment_date)=30 
and (amount*0.10+1)<(amount/2);

SELECT staff_id, amount, amount * 0.10 + 1 AS commission
FROM payment
WHERE MONTH(payment_date) = 5 
AND DAY(payment_date) = 30 
AND (amount * 0.10 + 1) < (amount * 0.50);

/* 

A todos los clientes que rentaron los días 30 o 31 de cada mes 
se les da un descuento del 20% sobre el monto de la renta, 
liste los id de los clientes, el folio de la renta, el monto, el descuento y el nuevo valor a pagar 

*/

SELECT customer_id, rental_id, amount, amount*0.20 as discount, amount-amount*0.20 as to_pay	
FROM payment	
WHERE day(payment_date)=30 
OR day(payment_date)=31;

SELECT customer_id, rental_id, amount, amount * 0.20 AS discount, amount - (amount * 0.20) AS total_to_pay
FROM payment
WHERE DAY(payment_date) IN (30, 31);

/*

A todos los clientes que rentan los lunes se les otorga un dia mas para regresarla , 
liste los id de los clientes, el folio de la renta, la fecha  de pago 
y la fecha de entrega 3 días después del pago 
 
*/
 
SELECT customer_id, rental_id, amount, payment_date,
       DATE_ADD(payment_date, INTERVAL 4 DAY) AS return_date
FROM payment
WHERE DAYNAME(payment_date) = 'Monday';


-- En la tabla de rentas calcular para cada ID los días transcurridos entre la fecha de regreso y la facha de la renta.

SELECT rental_id,
DATEDIFF(return_date,rental_date) AS dias_transcurridos
FROM rental;

-- Lista el id de la renta, el id del cliente y la fecha de renta de todas las rentas de los días domingo 

SELECT rental_id, customer_id, rental_date
FROM rental
WHERE DAYNAME(rental_date) = 'Sunday';

-- Lista el id de la renta, el id del cliente y la fecha de renta de todas las rentas de los días domingo del mes de mayo 

SELECT rental_id, customer_id, rental_date
FROM rental
WHERE DAYNAME(rental_date) = 'Sunday' 
AND MONTH(rental_date) = 5;

/* 
Lista el id de la renta, el id del cliente, fecha de renta 
y fecha de devolución de todas las rentas que se devuelven los días domingo del mes de junio
*/

SELECT rental_id, customer_id, rental_date, return_date
FROM rental
WHERE DAYNAME(return_date) = 'Sunday'
AND MONTH(return_date) = 6;

SELECT rental_id, customer_id, rental_date, return_date
FROM rental
WHERE DAYOFWEEK(return_date) = 1
AND MONTH(return_date) = 6;

