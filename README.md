#TAREA_12
**EJERCICIO NRO 1**
```
DECLARE @fecha_inicio datetime = '2005-01-01';
DECLARE @fecha_fin datetime = '2005-12-31';
SELECT SUM(total) AS Total_Ventas
FROM ve.documento
WHERE fechaMovimiento BETWEEN @fecha_inicio AND @fecha_fin;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/0fe2de55-80cd-4039-8aab-7ebe55def147)

**EJERCICIO NRO 2**
```
SELECT p.*
FROM ma.persona p
LEFT JOIN ma.personaDestino pd ON p.persona = pd.persona
WHERE pd.persona IS NULL;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/f9ee1bf8-46d1-417f-a38c-2c097137a4dc)

**EJERCICIO NRO 3**
```
SELECT FORMAT(AVG(total), 'C', 'es-PE') AS [Promedio del Monto Total en Soles]
FROM ve.documento;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/d7398f06-12d6-46b1-9ef1-11baca6b292f)

**EJERCICIO NRO 4**
```
SELECT *
FROM ve.documento
WHERE total > (SELECT AVG(total) FROM ve.documento);
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/3118f39b-d5f0-42b0-bf44-3a9c2d1db5c3)

**EJERCICIO NRO 5**
```
SELECT d.*
FROM ve.documentoPago dp
INNER JOIN ve.documento d ON dp.documento = d.documento
INNER JOIN pa.pago p ON dp.pago = p.pago
WHERE p.formaPago = 10; -- 1 es pago al Contado
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/1f997ba0-34df-4706-8425-e71efcfc7fe9)

**EJERCICIO NRO 6**
```
SELECT d.*, dc.*
FROM ve.documento d
INNER JOIN ve.documentosCanjeados dc ON d.documento = dc.documento01 AND d.documento = dc.documento02;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/292c37c1-1e9f-453d-bfe0-b4114d26d00c)

**EJERCICIO NRO 7**
```
SELECT almacen, SUM(costoSoles) AS Saldo_Total
FROM ma.saldosIniciales
GROUP BY almacen;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/73ff50cf-563f-4aa3-a925-6e0f9152bbc7)

**EJERCICIO NRO 8**
```
SELECT d.*
FROM ve.documento d
INNER JOIN ve.documentoDetalle dd ON d.documento = dd.documento
WHERE d.vendedor = 3;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/395452eb-d615-4ecc-b41e-e546062e2c65)

**EJERCICIO NRO 9**
```
SELECT vendedor, YEAR(fechaMovimiento) AS Anio, FORMAT(SUM(total), 'C', 'es-PE') AS Total_Ventas
FROM ve.documento
GROUP BY vendedor, YEAR(fechaMovimiento)
HAVING SUM(total) > 100000
ORDER BY SUM(total) ASC;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/a4c95643-1127-413a-ab4b-84d71c09ef8d)

**EJERCICIO NRO 10**
```
SELECT vendedor, MONTH(fechaMovimiento) AS Mes, YEAR(fechaMovimiento) AS Anio, FORMAT(SUM(total), 'C', 'es-PE') AS Total_Ventas
FROM ve.documento
GROUP BY vendedor, MONTH(fechaMovimiento), YEAR(fechaMovimiento)
HAVING SUM(total) > 100000
ORDER BY SUM(total) ASC;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/5b46dd8c-71d5-4551-9fc0-8a7c6d96bbee)

**EJERCICIO NRO 11**
```
SELECT persona, YEAR(fechaMovimiento) AS Anio, FORMAT(COUNT(*), 'C', 'es-PE') AS Compras
FROM ve.documento
WHERE tipoMovimiento = 1
GROUP BY persona, YEAR(fechaMovimiento)
HAVING COUNT(*) > 10
ORDER BY Anio ASC;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/51e3ab2b-8071-4661-b99e-226db6ee48c3)

**EJERCICIO NRO 12**
```
SELECT vendedor, FORMAT(SUM(descto01 + descto02 + descto03), 'C', 'es-PE') AS Descuentos_Acumulados
FROM ve.documento
GROUP BY vendedor
HAVING SUM(descto01 + descto02 + descto03) > 5000
ORDER BY vendedor ASC;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/c7413a5e-9171-4007-8769-d2e51ccd48c7)

**EJERCICIO NRO 13**
```
SELECT persona, YEAR(fechaMovimiento) AS Año, FORMAT(SUM(total), 'C', 'es-PE') AS Total_Anual
FROM ve.documento
WHERE tipoMovimiento = 1
GROUP BY persona, YEAR(fechaMovimiento)
HAVING SUM(total) > 10000
ORDER BY Año ASC;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/fa9b2f61-4116-4b47-a229-37a42bfb13c4)

**EJERCICIO NRO 14**
```
SELECT d.vendedor, COUNT(dd.documentoDetalle) AS Total_Productos_Vendidos
FROM ve.documentoDetalle dd
JOIN ve.documento d ON dd.documento = d.documento
GROUP BY d.vendedor;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/fdbe286a-8f38-4e6a-890a-1bf169ed31da)

**EJERCICIO NRO 15**
```
SELECT MONTH(d.fechaMovimiento) AS Mes, p.formaPago, FORMAT(SUM(d.total), 'C', 'es-PE') AS Total_Ventas
FROM ve.documento d
JOIN pa.pago p ON d.vendedor = p.vendedor
WHERE YEAR(d.fechaMovimiento) = 2009
GROUP BY MONTH(d.fechaMovimiento), p.formaPago;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/9eb282f3-7028-4aff-a034-e44d3cdbeb5d)

**EJERCICIO NRO 16**
```
DECLARE @fecha_inicio_2007 datetime = '2007-01-01';
DECLARE @fecha_fin_2007 datetime = '2007-12-31';
SELECT SUM(total) AS Total_Ventas
FROM ve.documento
WHERE fechaMovimiento BETWEEN @fecha_inicio_2007 AND @fecha_fin_2007;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/c8b7916f-a70b-487b-917f-779aa66726dc)

**EJERCICIO NRO 17**
```
SELECT p.*
FROM ma.persona p
LEFT JOIN ma.personaDestino pd ON p.persona = pd.persona
WHERE pd.persona IS NULL
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/e71b87ac-b88c-4b56-bb90-ab3539aa69f3)

**EJERCICIO NRO 18**
```
SELECT AVG(total) AS Promedio_Ventas
FROM ve.documento
WHERE YEAR(fechaMovimiento) = 2009;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/4b4a0610-d23a-475a-b852-4234e8222dff)

**EJERCICIO NRO 19**
```
SELECT * 
FROM ve.documento
WHERE total > (SELECT AVG(total) FROM ve.documento WHERE YEAR(fechaMovimiento) = 2005);
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/45ac762d-db31-410a-b20c-0e323b3d8279)

**EJERCICIO NRO 20**
```
SELECT *
FROM ve.documentoPago dp
INNER JOIN ve.documento d ON dp.documento = d.documento
INNER JOIN pa.pago p ON dp.pago = p.pago
WHERE YEAR(fechaMovimiento) = 2006;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/2c22a1e3-0491-4665-bc35-ce550d4a494d)

**EJERCICIO NRO 21**
```
SELECT almacen, FORMAT(SUM(costoSoles), 'C', 'es-PE') AS saldo_total
FROM ma.saldosIniciales
WHERE YEAR(periodo) = 2007
GROUP BY almacen;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/365c8db0-de6c-4419-b2ac-4ebc1c9a6f1d)

**EJERCICIO NRO 22**
```
SELECT *
FROM ve.documento
WHERE total > (SELECT AVG(total) FROM ve.documento WHERE YEAR(fechaMovimiento) = 2008);
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/bb6c6366-1cc9-457b-88db-6b74bee5266e)

**EJERCICIO NRO 23**
```
SELECT *
FROM ve.documentoDetalle dd
JOIN ve.documento d ON dd.documento = d.documento
WHERE d.vendedor = 3 AND YEAR(d.fechaMovimiento) = 2009;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/15dc1014-ebd2-43cf-8346-0e5b6b06209d)

**EJERCICIO NRO 24**
```
SELECT YEAR(fechaMovimiento) AS Año, vendedor, FORMAT(SUM(total), 'C', 'es-PE') AS Total_Ventas
FROM ve.documento
WHERE YEAR(fechaMovimiento) = 2008
GROUP BY YEAR(fechaMovimiento), vendedor
HAVING SUM(total) > 100000;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/abe9e291-f4a1-4cac-a60b-7dc9580dcdf7)

**EJERCICIO NRO 25**
```
SELECT YEAR(fechaMovimiento) AS Año, MONTH(fechaMovimiento) AS Mes, vendedor, FORMAT(SUM(total), 'C', 'es-PE') AS Total_Ventas
FROM ve.documento
WHERE YEAR(fechaMovimiento) = 2009
GROUP BY YEAR(fechaMovimiento), MONTH(fechaMovimiento), vendedor;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/391583df-1223-455e-9a88-db6e0e71d3de)

**EJERCICIO NRO 26**
```
SELECT persona, COUNT(DISTINCT documento) AS Total_Compras
FROM ve.documento
WHERE YEAR(fechaMovimiento) = 2005
GROUP BY persona
HAVING COUNT(DISTINCT documento) > 10;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/3c2b59cc-aeba-4a5f-aceb-e66b533b2dca)

**EJERCICIO NRO 27**
```
SELECT vendedor, FORMAT(SUM(descto01 + descto02 + descto03), 'C', 'es-PE') AS Total_Descuentos
FROM ve.documento
WHERE YEAR(fechaMovimiento) = 2005
GROUP BY vendedor
HAVING SUM(descto01 + descto02 + descto03) > 5000;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/15394da6-b0ff-4054-8015-f26e6c1bde2f)

**EJERCICIO NRO 28**
```
SELECT persona, YEAR(fechaMovimiento) AS Año, FORMAT(SUM(total), 'C', 'es-PE') AS Total_Anual
FROM ve.documento
WHERE tipoMovimiento = 1 AND YEAR(fechaMovimiento) = 2007
GROUP BY persona, YEAR(fechaMovimiento)
HAVING SUM(total) > 10000;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/9a934669-c447-4aec-b7b6-f2c75b492aef)

**EJERCICIO NRO 29**
```
SELECT d.vendedor, COUNT(dd.documentoDetalle) AS Total_Productos_Vendidos
FROM ve.documentoDetalle dd
JOIN ve.documento d ON dd.documento = d.documento
WHERE YEAR(d.fechaMovimiento) = 2008
GROUP BY d.vendedor;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/d271b8cf-9acb-4ce2-b9d9-1d42284a0b97)

**EJERCICIO NRO 30**
```
SELECT YEAR(d.fechaMovimiento) AS Año, MONTH(d.fechaMovimiento) AS Mes, p.formaPago, FORMAT(SUM(d.total), 'C', 'es-PE') AS Total_Ventas
FROM ve.documento d
JOIN pa.pago p ON d.vendedor = p.vendedor
WHERE YEAR(d.fechaMovimiento) = 2009
GROUP BY YEAR(d.fechaMovimiento), MONTH(d.fechaMovimiento), p.formaPago;
```
![image](https://github.com/PAULMAMANI/BASE_ESTRUCTURA_DATOS/assets/138716671/12863bc7-0eac-42bb-8385-a4ee609e601b)
