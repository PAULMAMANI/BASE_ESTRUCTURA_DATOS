--EJERCICIO NRO 1
DECLARE @fecha_inicio datetime = '2005-01-01';
DECLARE @fecha_fin datetime = '2005-12-31';
SELECT SUM(total) AS Total_Ventas
FROM ve.documento
WHERE fechaMovimiento BETWEEN @fecha_inicio AND @fecha_fin;

--EJERCICIO NRO 2
SELECT p.*
FROM ma.persona p
LEFT JOIN ma.personaDestino pd ON p.persona = pd.persona
WHERE pd.persona IS NULL;

--EJERCICIO NRO 3
SELECT FORMAT(AVG(total), 'C', 'es-PE') AS [Promedio del Monto Total en Soles]
FROM ve.documento;

--EJERCICIO NRO 4
SELECT *
FROM ve.documento
WHERE total > (SELECT AVG(total) FROM ve.documento);

--EJERCICIO NRO 5
SELECT d.*
FROM ve.documentoPago dp
INNER JOIN ve.documento d ON dp.documento = d.documento
INNER JOIN pa.pago p ON dp.pago = p.pago
WHERE p.formaPago = 10; -- 1 es pago al Contado

--EJERCICIO NRO 6
SELECT d.*, dc.*
FROM ve.documento d
INNER JOIN ve.documentosCanjeados dc ON d.documento = dc.documento01 AND d.documento = dc.documento02;

--EJERCICIO NRO 7
SELECT almacen, SUM(costoSoles) AS Saldo_Total
FROM ma.saldosIniciales
GROUP BY almacen;

--EJERCICIO NRO 8
SELECT d.*
FROM ve.documento d
INNER JOIN ve.documentoDetalle dd ON d.documento = dd.documento
WHERE d.vendedor = 3;

--EJERCICIO NRO 9
SELECT vendedor, YEAR(fechaMovimiento) AS Anio, FORMAT(SUM(total), 'C', 'es-PE') AS Total_Ventas
FROM ve.documento
GROUP BY vendedor, YEAR(fechaMovimiento)
HAVING SUM(total) > 100000
ORDER BY SUM(total) ASC;

--EJERCICIO NRO 10
SELECT vendedor, MONTH(fechaMovimiento) AS Mes, YEAR(fechaMovimiento) AS Anio, FORMAT(SUM(total), 'C', 'es-PE') AS Total_Ventas
FROM ve.documento
GROUP BY vendedor, MONTH(fechaMovimiento), YEAR(fechaMovimiento)
HAVING SUM(total) > 100000
ORDER BY SUM(total) ASC;

--EJERCICIO NRO 11
SELECT persona, YEAR(fechaMovimiento) AS Anio, FORMAT(COUNT(*), 'C', 'es-PE') AS Compras
FROM ve.documento
WHERE tipoMovimiento = 1
GROUP BY persona, YEAR(fechaMovimiento)
HAVING COUNT(*) > 10
ORDER BY Anio ASC;

--EJERCICIO NRO 12
SELECT vendedor, FORMAT(SUM(descto01 + descto02 + descto03), 'C', 'es-PE') AS Descuentos_Acumulados
FROM ve.documento
GROUP BY vendedor
HAVING SUM(descto01 + descto02 + descto03) > 5000
ORDER BY vendedor ASC;

--EJERCICIO NRO 13
SELECT persona, YEAR(fechaMovimiento) AS Año, FORMAT(SUM(total), 'C', 'es-PE') AS Total_Anual
FROM ve.documento
WHERE tipoMovimiento = 1
GROUP BY persona, YEAR(fechaMovimiento)
HAVING SUM(total) > 10000
ORDER BY Año ASC;

--EJERCICIO NRO 14
SELECT d.vendedor, COUNT(dd.documentoDetalle) AS Total_Productos_Vendidos
FROM ve.documentoDetalle dd
JOIN ve.documento d ON dd.documento = d.documento
GROUP BY d.vendedor;

--EJERCICIO NRO 15
SELECT MONTH(d.fechaMovimiento) AS Mes, p.formaPago, FORMAT(SUM(d.total), 'C', 'es-PE') AS Total_Ventas
FROM ve.documento d
JOIN pa.pago p ON d.vendedor = p.vendedor
WHERE YEAR(d.fechaMovimiento) = 2009
GROUP BY MONTH(d.fechaMovimiento), p.formaPago;

--EJERCICIO NRO 16
DECLARE @fecha_inicio_2007 datetime = '2007-01-01';
DECLARE @fecha_fin_2007 datetime = '2007-12-31';
SELECT SUM(total) AS Total_Ventas
FROM ve.documento
WHERE fechaMovimiento BETWEEN @fecha_inicio_2007 AND @fecha_fin_2007;

--EJERCICIO NRO 17
SELECT p.*
FROM ma.persona p
LEFT JOIN ma.personaDestino pd ON p.persona = pd.persona
WHERE pd.persona IS NULL

--EJERCICIO NRO 18
SELECT AVG(total) AS Promedio_Ventas
FROM ve.documento
WHERE YEAR(fechaMovimiento) = 2009;

--EJERCICIO NRO 19
SELECT * 
FROM ve.documento
WHERE total > (SELECT AVG(total) FROM ve.documento WHERE YEAR(fechaMovimiento) = 2005);

--EJERCICIO NRO 20
SELECT *
FROM ve.documentoPago dp
INNER JOIN ve.documento d ON dp.documento = d.documento
INNER JOIN pa.pago p ON dp.pago = p.pago
WHERE YEAR(fechaMovimiento) = 2006;

--EJERCICIO NRO 21
SELECT almacen, FORMAT(SUM(costoSoles), 'C', 'es-PE') AS saldo_total
FROM ma.saldosIniciales
WHERE YEAR(periodo) = 2007
GROUP BY almacen;

--EJERCICIO NRO 22
SELECT *
FROM ve.documento
WHERE total > (SELECT AVG(total) FROM ve.documento WHERE YEAR(fechaMovimiento) = 2008);

--EJERCICIO NRO 23
SELECT *
FROM ve.documentoDetalle dd
JOIN ve.documento d ON dd.documento = d.documento
WHERE d.vendedor = 3 AND YEAR(d.fechaMovimiento) = 2009;

--EJERCICIO NRO 24
SELECT YEAR(fechaMovimiento) AS Año, vendedor, FORMAT(SUM(total), 'C', 'es-PE') AS Total_Ventas
FROM ve.documento
WHERE YEAR(fechaMovimiento) = 2008
GROUP BY YEAR(fechaMovimiento), vendedor
HAVING SUM(total) > 100000;

--EJERCICIO NRO 25
SELECT YEAR(fechaMovimiento) AS Año, MONTH(fechaMovimiento) AS Mes, vendedor, FORMAT(SUM(total), 'C', 'es-PE') AS Total_Ventas
FROM ve.documento
WHERE YEAR(fechaMovimiento) = 2009
GROUP BY YEAR(fechaMovimiento), MONTH(fechaMovimiento), vendedor;

--EJERCICIO NRO 26
SELECT persona, COUNT(DISTINCT documento) AS Total_Compras
FROM ve.documento
WHERE YEAR(fechaMovimiento) = 2005
GROUP BY persona
HAVING COUNT(DISTINCT documento) > 10;

--EJERCICIO NRO 27
SELECT vendedor, FORMAT(SUM(descto01 + descto02 + descto03), 'C', 'es-PE') AS Total_Descuentos
FROM ve.documento
WHERE YEAR(fechaMovimiento) = 2005
GROUP BY vendedor
HAVING SUM(descto01 + descto02 + descto03) > 5000;

--EJERCICIO NRO 28
SELECT persona, YEAR(fechaMovimiento) AS Año, FORMAT(SUM(total), 'C', 'es-PE') AS Total_Anual
FROM ve.documento
WHERE tipoMovimiento = 1 AND YEAR(fechaMovimiento) = 2007
GROUP BY persona, YEAR(fechaMovimiento)
HAVING SUM(total) > 10000;

--EJERCICIO NRO 29
SELECT d.vendedor, COUNT(dd.documentoDetalle) AS Total_Productos_Vendidos
FROM ve.documentoDetalle dd
JOIN ve.documento d ON dd.documento = d.documento
WHERE YEAR(d.fechaMovimiento) = 2008
GROUP BY d.vendedor;

--EJERCICIO NRO 30
SELECT YEAR(d.fechaMovimiento) AS Año, MONTH(d.fechaMovimiento) AS Mes, p.formaPago, FORMAT(SUM(d.total), 'C', 'es-PE') AS Total_Ventas
FROM ve.documento d
JOIN pa.pago p ON d.vendedor = p.vendedor
WHERE YEAR(d.fechaMovimiento) = 2009
GROUP BY YEAR(d.fechaMovimiento), MONTH(d.fechaMovimiento), p.formaPago;

















