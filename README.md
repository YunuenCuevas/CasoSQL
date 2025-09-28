# Análisis de venta de restaurante "Sabores del mundo"
Este proyecto contiene el análisis de datos de la tienda Sabores del Mundo, a través de SQL.

## Contexto
Este proyecto contiene el análisis de datos del restaurante "Sabores del mundo" de las ventas realizadas durante el primer trimestre del año 2023, a través de SQL. Estos datos son importantes para la toma de decisiones sobre la restructuración del menú.

## Objetivo
Identificar cuáles son los productos del menú, lanzado a inicio de año, que han tenido más éxito y cuales son los que menos han gustado a los clientes.

## Contexto
- El menú consta de 32 platillos, con costos de $5.0 a $19.95.
- Por categoría la comida italiana es la más costosa con un promedio de $16.75, seguida por la asiática $13.48, mexicana con $11.80 y americana con $10.07.
- Los cinco platillos más costosos son: Shrimp Scampi ($19.95), Korean Beef Bowl ($17.95), Chicken Parmesan ($17.95), Meat Lasagna ($17.95), Spaghetti &
Meatballs ($17.95). Los cinco platillos menos costosos son: Hot Dog ($9.0), Chips & Salsa ($7.0), Mac & Cheese ($7.0), French Fries ($7.0), Edamame ($5.0).
- Del mes de enero a marzo 12234 registros (platillos vendidos), a través de 5370 ordenes realizadas.

## Resultados

**1. Se mantienen ventas por mes**
  - El número de órdenes vendidas por mes del restaurante "Sabores del mundo" **se mantuvo constante** mes con mes, excepto el mes de febrero.
  - Sin embargo por promedio **febrero fue dónde más órdenes se vendieron** con 139 por día a diferencia de enero 134 y marzo 135.

<img width="689" height="325" alt="Captura de pantalla 2025-09-28 a la(s) 3 46 19 a m" src="https://github.com/user-attachments/assets/15488aa1-aa22-4bad-a441-4a722d978f53" />


**2. Bajo rendimiento en categoría Americana**
  - Son cuatro categorías en el menú: Italiana, oriental, mexicana y americana.
  - La **comida americana** fue la que menos ingresos tuvo, hasta un **40% menos** que la italiana.
  - Se debe valorar el costo-beneficio de que continúe la comida americana en el menú, a través del costo de preparación de productos.

<img width="288" height="170" alt="Captura de pantalla 2025-09-28 a la(s) 3 51 15 a m" src="https://github.com/user-attachments/assets/959d6aeb-0824-4ae1-b6c7-5802e056b50a" />


**3. El producto que genera mayor ingreso es Korean Beef Bowl**
- El platillo que generó _mayor ingreso_ fue: **Korean Beef Bowl ($10,554.6)**, a pesar de no liderear como categoría la comida asiática y que se trata del platillo más costoso del menú esto último no fue impedimento para generar el mayor ingreso.
- El que _menos ingreso_ generó fue **Chicken Tacos con $1469.8**, alrededor de 90% menos que el platillo con mayor ingreso. Por tal motivo se sugiere la eliminación de este platillo del menú.
  
<img width="293" height="258" alt="Captura de pantalla 2025-09-28 a la(s) 3 54 20 a m" src="https://github.com/user-attachments/assets/958ec26f-fd40-4a59-9f73-bee60dffac02" />



## Contenido de archivos anexos (base datos, SQL y PDF)
  - Base de datos con preparación de datos
  - Exploración de datos mediante código SQL
  - Conexión de tablas menú y órdenes realizadas para análisis
  - Análisis de las tablas para toma de decisiones a través código SQL
  - Conclusiones
