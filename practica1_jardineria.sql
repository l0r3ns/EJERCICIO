use jardineria;

-- 1. Ciudad y teléfono de las oficinas de EEUU
select ciudad, telefono
from oficina
where pais = 'EEUU';

-- 2. Cargo, nombre, apellidos e email del jefe de la empresa
select puesto, nombre, apellido1, apellido2, email
from empleado
where puesto = 'Director General';

-- 3. Nombre, apellidos y cargo de los que no son representantes de ventas
select nombre, apellido1, apellido2, puesto
from empleado
where puesto != 'Representante Ventas';

-- 4. Número de clientes de la empresa
select count(*) as N_clientes
from cliente;

-- 5. Nombre de los clientes españoles
select nombre_cliente
from cliente
where pais in ('Spain', 'España');

-- 6. Cuántos clientes hay en cada país
select pais, count(*) as N_clientes
from cliente
group by pais;

-- 7. Cuántos clientes hay en Madrid
select count(*) as N_clientes_Madrid
from cliente
where ciudad = 'Madrid';

-- 8. Código de empleado y número de clientes que atiende cada representante de ventas
select codigo_empleado_rep_ventas, count(*) as N_clientes
from cliente
where codigo_empleado_rep_ventas is not null
group by codigo_empleado_rep_ventas;

-- 9. Primer y último pago del cliente 3
select min(fecha_pago) as primer_pago, max(fecha_pago) as ultimo_pago
from pago
where codigo_cliente = 3;

-- 10. Código de cliente de los que hicieron pagos en 2008
select distinct codigo_cliente
from pago
where year(fecha_pago) = 2008;

-- 11. Distintos estados por los que puede pasar un pedido
select distinct estado
from pedido;

-- 12. Pedidos no entregados a tiempo 
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
from pedido
where fecha_entrega > fecha_esperada;

-- 13. Cuántos productos hay en cada línea de pedido
select numero_linea, count(*) as N_productos
from detalle_pedido
group by numero_linea;

-- 14. Los 20 códigos de producto más pedidos, ordenados por cantidad pedida
select codigo_producto, sum(cantidad) as cantidad_pedida
from detalle_pedido
group by codigo_producto
order by sum(cantidad) desc
limit 20;

-- 15. Pedidos entregados al menos dos días antes de la fecha esperada
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
from pedido
where date_add(fecha_entrega, interval 2 day) <= fecha_esperada;

-- 16. Nombre, apellidos, oficina y cargo de los que no son representantes de ventas
select nombre, apellido1, apellido2, codigo_oficina, puesto
from empleado
where puesto != 'Representante Ventas';

-- 17. Número de clientes asignados a cada representante de ventas
select codigo_empleado_rep_ventas, count(*) as N_clientes
from cliente
where codigo_empleado_rep_ventas is not null
group by codigo_empleado_rep_ventas;

-- 18. Precio total de cada pedido
select codigo_pedido, sum(cantidad * precio_unidad) as precio_total
from detalle_pedido
group by codigo_pedido;

-- 19. Cuántos pedidos tiene cada cliente en cada estado
select codigo_cliente, estado, count(*) as N_pedidos
from pedido
group by codigo_cliente, estado;

-- 20. Oficinas de países cuyo nombre empieza por 'E'
select codigo_oficina, ciudad, region, pais
from oficina
where pais like 'E%';

-- 21. Los cinco productos más caros
select nombre, gama, dimensiones, cantidad_en_stock, precio_venta
from producto
order by precio_venta desc
limit 5;

-- 22. Código y facturación de los pedidos mayores de 2000 euros
select codigo_pedido, sum(cantidad * precio_unidad) as facturacion
from detalle_pedido
group by codigo_pedido
having sum(cantidad * precio_unidad) > 2000;

-- 23. Productos mostrando stock, gama y proveedor
select codigo_producto, nombre, cantidad_en_stock, gama, proveedor
from producto;

-- 24. Pedidos cuya fecha de pedido es igual a la fecha de entrega
select codigo_pedido, codigo_cliente
from pedido
where fecha_pedido = fecha_entrega;
