/* b) Explorar la tabla “menu_items” para conocer los productos del menú.
1.- Realizar consultas para contestar las siguientes preguntas:
*/
SELECT *
FROM menu_items
;

--RESULTADO
--Muestra todo el contenido de la tabla: menu_items. 32 registros


/*Encontrar el número de artículos en el menú*/
SELECT COUNT (DISTINCT item_name)
FROM menu_items
;

--RESULTADO
--Muestra cuantos artículos con nombre distinto que hay en el menú: 32.


/*¿Cuál es el artículo menos caro y el más caro en el menú?*/
SELECT 
	MIN(price) AS mínimo
	,MAX(price) AS máximo
FROM menu_items
;

--RESULTADO: 
--El valor mínimo es: 5.0
--El valor máximo es: 19.95


SELECT item_name, price
FROM menu_items
GROUP BY item_name, price
ORDER BY price DESC
;

--RESULTADO: 
--El item con valor máximo es: Shrimp Scampi


SELECT item_name, price
FROM menu_items
GROUP BY item_name, price
ORDER BY price ASC
;

--RESULTADO: 
--El ítem con valor mínimo es: Edaname


/*¿Cuántos platos americanos hay en el menú?*/
SELECT COUNT(category) AS comida_americana
FROM menu_items
WHERE category='American'
;

--RESULTADO:
--Total de platos Americanos en el menú: 6


SELECT item_name AS comida_americana
FROM menu_items
WHERE category='American'
;

--RESULTADO:
--Nombre de los 6 platillos Americanos en el menú


/*¿Cuál es el precio promedio de los platos?*/
SELECT ROUND (AVG (price), 2) AS Promedio_precios_platillos
FROM menu_items
;

--RESULTADO:
--Muestra el promedio de todos los platillos del menú, $13.29.


SELECT category, ROUND (AVG (price), 2) AS Promedio_precios_platillos 
FROM menu_items
GROUP BY category
ORDER BY Promedio_precios_platillos DESC
;

--RESULTADO:
--Muestra el promedio por categoría de platillos del menú.



/* c) Explorar la tabla “order_details” para conocer los datos que han sido recolectados. 
1.- Realizar consultas para contestar las siguientes preguntas:
*/
SELECT *
FROM order_details
;

--RESULTADO
--Muestra todo el contenido de la tabla: order_details. 12234 registros


/*¿Cuántos pedidos únicos se realizaron en total?*/
SELECT COUNT (DISTINCT order_id)
FROM order_details
;

--RESULTADO
--Muestra cuantos pedidos únicos se solicitaron independientemente del número de productos: 5370.


SELECT order_id, COUNT (order_id) AS artículos_pedidos
FROM order_details
GROUP BY order_id
ORDER BY artículos_pedidos
;

--RESULTADO
--Muestra el número de orden por artículos pedidos en orden ascendente: 5370.


SELECT order_id, COUNT (DISTINCT item_id) AS artículos_pedidos
FROM order_details
GROUP BY order_id
ORDER BY artículos_pedidos ASC
;

--RESULTADO
--Muestra el número de artículos pedidos en orden ascendente.

/*¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?*/
SELECT order_id, COUNT (DISTINCT item_id) AS artículos_pedidos
FROM order_details
GROUP BY order_id
ORDER BY artículos_pedidos DESC
LIMIT 5
;

--RESULTADO
--Muestra las ordenes que tuvieron el mayor número de artículos pedidos:
--4 pedidos con 13 artículos: 4305, 4836, 2725, 3473. 1 pedido con 12 artículos: 443.


/*¿Cuándo se realizó el primer pedido y el último pedido?*/
SELECT order_id, order_date
FROM order_details
ORDER BY order_date ASC
;

SELECT order_id, order_date
FROM order_details
ORDER BY order_date DESC
;

--RESULTADO
--El primer pedido fue el 01/01/2023 y el último pedido 31/03/2023


/*¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?*/
SELECT order_date::date AS fecha, COUNT (DISTINCT order_id) AS pedidos
FROM order_details
WHERE (order_date BETWEEN '2023-01-01' AND '2023-01-05')
GROUP BY order_date
ORDER BY order_date::date DESC
;

--RESULTADO
--Muestra la cuenta de los pedidos realizados por fecha entre el 01 y 05 de enero del 2023.
--ordenados por fecha en manera descendente, total: 308.



/*d) Usar ambas tablas para conocer la reacción de los clientes respecto al menú.
1.- Realizar un left join entre entre order_details y menu_items con el identificador
item_id(tabla order_details) y menu_item_id(tabla menu_items).*/
SELECT o.order_id, o.item_id, o.order_date, m.item_name, m.category, m.price
FROM order_details  AS o
LEFT JOIN menu_items AS m ON o.item_id = m.menu_item_id
ORDER BY o.item_id ASC
;

--RESULTADO
--Muestra la unión entre ambas tablas, con las columnas: 
--order_id, item_id, order_date de order_details
--item_name, category, price de menu_items


/*e) Una vez que hayas explorado los datos en las tablas correspondientes y respondido 
las preguntas planteadas, realiza un análisis adicional utilizando este join entre las tablas. 
El objetivo es identificar 5 puntos clave que puedan ser de utilidad para los dueños del 
restaurante en el lanzamiento de su nuevo menú. 
Para ello, crea tus propias consultas y utiliza los resultados obtenidos para llegar 
a estas conclusiones.
*/

SELECT *
FROM menu_items
;

SELECT *
FROM order_details
;


SELECT o.order_id, o.item_id, o.order_date, m.item_name, m.category, m.price
FROM order_details  AS o
LEFT JOIN menu_items AS m ON o.item_id = m.menu_item_id
WHERE (o.order_date BETWEEN '2023-01-01' AND '2023-01-31')
ORDER BY o.order_date ASC
;

--RESULTADO
--Muestra el número de pedidos realizados en el mes de enero: 4156


SELECT o.order_id, o.item_id, o.order_date, m.item_name, m.category, m.price
FROM order_details  AS o
LEFT JOIN menu_items AS m ON o.item_id = m.menu_item_id
WHERE (o.order_date BETWEEN '2023-02-01' AND '2023-02-28')
ORDER BY o.order_date ASC
;

--RESULTADO
--Muestra el número de pedidos realizados en el mes de febrero: 3892


SELECT o.order_id, o.item_id, o.order_date, m.item_name, m.category, m.price
FROM order_details  AS o
LEFT JOIN menu_items AS m ON o.item_id = m.menu_item_id
WHERE (o.order_date BETWEEN '2023-03-01' AND '2023-03-31')
ORDER BY o.order_date ASC
;

--RESULTADO
--Muestra el número de pedidos realizados en el mes de marzo: 4186


SELECT o.order_id, o.item_id, o.order_date, m.item_name, m.category, m.price
FROM order_details  AS o
LEFT JOIN menu_items AS m ON o.item_id = m.menu_item_id
WHERE (o.order_date BETWEEN '2023-01-01' AND '2023-03-31')
ORDER BY o.order_date ASC
;

--RESULTADO
--Muestra el número de pedidos realizados de enero a marzo: 12234


SELECT m.category, SUM (m.price) AS costo_mes
FROM order_details  AS o
LEFT JOIN menu_items AS m ON o.item_id = m.menu_item_id
WHERE (o.order_date BETWEEN '2023-01-01' AND '2023-01-31')
GROUP BY m.category
ORDER BY costo_mes DESC
;

--RESULTADO
--Muestra la suma de los pedidos realizados en el mes de enero por categoría, la comida 
--Italiana fue la más consumida con 16,727.7, seguida de la asiática y mexicana. 


SELECT m.category, SUM (m.price) AS costo_mes
FROM order_details  AS o
LEFT JOIN menu_items AS m ON o.item_id = m.menu_item_id
WHERE (o.order_date BETWEEN '2023-01-01' AND '2023-03-31')
GROUP BY m.category
ORDER BY costo_mes DESC
;

--RESULTADO
--Muestra la suma de los pedidos realizados entre enero a marzo por categoría, la comida 
--Italiana fue la más consumida con 49,462.7, seguida de la asiática y mexicana.


SELECT m.item_name, SUM (m.price) AS costo_mes
FROM order_details  AS o
LEFT JOIN menu_items AS m ON o.item_id = m.menu_item_id
WHERE (o.order_date BETWEEN '2023-01-01' AND '2023-03-31')
GROUP BY m.item_name
ORDER BY costo_mes DESC
;

--RESULTADO
--Muestra la suma de los pedidos realizados entre enero a marzo por platillo, 
--el plato que generó más ventas
--fue Korean Beef Bowl (10,554.6), seguido del Spaghetti and Meatballs (8436.5). 
--El platillo que menos ventas tuvo fue: Chicken Tacos con 1469.8


SELECT o.order_date, SUM (m.price) AS costo_mes
FROM order_details  AS o
LEFT JOIN menu_items AS m ON o.item_id = m.menu_item_id
WHERE (o.order_date BETWEEN '2023-01-01' AND '2023-03-31')
GROUP BY o.order_date
ORDER BY costo_mes DESC
;

--RESULTADO
--Muestra la suma de los pedidos realizados entre enero a marzo por fecha, 
--la fecha que generó más ventas fue 01/02/2023 (2396.35),  
--y la que menos vendió fue el 22/03/2023 (1016.90)