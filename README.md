# Proyecto clase de Bases de Datos Relacionales con MySQL

## Descripción
Este proyecto forma parte de una clase de bases de datos relacionales y tiene como objetivo aprender y practicar consultas SQL utilizando la base de datos **Sakila**. A lo largo del proyecto, se explorarán diversas operaciones sobre una base de datos relacional, incluyendo la creación de tablas, inserción de datos, consultas simples y avanzadas, y el uso de funciones en SQL.

## Requisitos
Para poder ejecutar las consultas y trabajar con este proyecto, se necesita:

- **MySQL** (5.7 o superior) o **MariaDB**
- Base de datos de muestra **Sakila** instalada ([Descargar aquí](https://dev.mysql.com/doc/index-other.html))
- Un cliente SQL como MySQL Workbench, DBeaver o la línea de comandos de MySQL

## Instalación de la Base de Datos Sakila
1. Descargar los archivos `sakila-schema.sql` y `sakila-data.sql` desde el sitio de MySQL o dentro del proyecto como sakila_completo.
2. Abrir MySQL y ejecutar el script de sakila una vez creada la base de datos
3. Verificar que la base de datos se haya instalado correctamente


### Ejercicios y Casos de Uso
- Consultas reales sobre los datos de la base Sakila
- Reportes de información relevante (clientes, películas más rentadas, ingresos por categoría, etc.)

## Ejemplo de Consulta
```sql
-- Obtener las 10 películas más rentadas
SELECT f.title, COUNT(r.rental_id) AS total_rentals
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY total_rentals DESC
LIMIT 10;
```
