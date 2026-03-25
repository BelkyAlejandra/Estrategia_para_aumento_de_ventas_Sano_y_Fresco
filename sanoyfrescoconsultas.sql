-- ¿Qué datos contiene la tabla a analizar?
select * from tickets limit 1;

-- ¿Cuál es el ingreso total generado por el negocio?
select sum(precio_total) as 'ingreso total generado por el negocio' from tickets;

-- Pregunta 2: ¿Cómo ha sido la tendencia de ingresos mensuales?
-- Creo que primero me gustaría ver si hay más años, luego agrupar por meses esos ingresos.

-- Con la función YEAR se extrae el año de un campo de tipo fecha
select distinct year(fecha) from tickets order by year(fecha);

select month(fecha) as 'mes', round(sum(precio_total)) 'Ingreso mensual' from tickets group by month(fecha) order by month(fecha);


-- Pregunta 3: ¿Cuál es el rendimiento de cada departamento en términos de ventas?
-- Aquí pensé en ver cuáles eran los departamentos, pero realmente es inutil porque puedo organizarlo con group by
select id_departamento as 'departamento', round(sum(precio_total)) as 'rendimiento x departamento' from tickets group by id_departamento order by sum(precio_total) desc;



-- Pregunta 4: ¿Cómo se distribuyen las ventas entre las diferentes secciones?
select id_seccion as 'seccion', round(sum(precio_total)) as 'ventas x seccion' from tickets group by id_seccion order by sum(precio_total) desc;


-- Pregunta 5: ¿Cuáles son los 10 productos más vendidos en cantidad?
-- Tengo que agrupar por nombre del producto y sumar la cantidad de ellos

select nombre_producto as 'productos más vendidos', sum(cantidad) as 'cantidad' from tickets group by nombre_producto order by sum(cantidad) desc limit 10;


-- Pregunta 6: ¿Qué 10 productos generan más ingresos?
select nombre_producto as 'productos más vendidos', round(sum(precio_total)) as 'cantidad' from tickets group by nombre_producto order by sum(precio_total) desc limit 10;

-- Pregunta 7: ¿Quiénes son los 20 clientes que más compran en términos de ingresos?
select id_cliente, round(sum(precio_total)) from tickets group by id_cliente order by round(sum(precio_total)) desc limit 20;

-- Pregunta 9: ¿Cuántos pedidos totales se han realizado?
select count(distinct id_pedido) as 'pedidos totales' from tickets;

-- Pregunta 10: ¿Cuál es el valor promedio por pedido? ********No sé como hacer esta

-- Aquí se saca los valores totales de cada pedido
select id_pedido as 'pedido', sum(precio_total) as 'total_pedido' from tickets group by pedido order by sum(id_pedido) desc;

-- De ese resultado, se saca el promedio por pedido
select avg(total_pedido) as 'valor promedio x pedido'  
from (
select id_pedido as 'pedido', sum(precio_total) as 'total_pedido' from tickets group by pedido order by sum(id_pedido) desc
) as subconsulta;

-- Pregunta 8: ¿Cuál es la compra media por cliente? ***** No sé como hacer esta.

select id_cliente, sum(precio_total) as 'precio_cliente' group by id_cliente;

select avg(precio_cliente) as 'compra media por cliente'
from (
select id_cliente, sum(precio_total) as 'precio_cliente' 
from tickets 
group by id_cliente 
order by precio_cliente desc
) as subconsulta2;


