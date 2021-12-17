use Northwind

/*Guia de consultas basicas*/

/*Ejercicio 1: Seleccionar todos los campos de la tabla clientes, ordenado por nombre del
contacto de la compa��a, alfab�ticamente.*/
la orden, descendentemente.*/

Select * from  Orders 
order by Orders.OrderDate desc

/*Ejercicio 3: Seleccionar todos los campos de la tabla detalle de la orden, ordenada por
cantidad pedida, ascendentemente.*/
tienen un precio unitario comprendido entre 10 y 120.*/
las categor�as 1, 3, 4 y 7.*/
el a�o 1996*/
letra de A hasta la D y pertenezcan al pa�s de USA, ordenarlos por la direcci�n.*/

select * from Customers
where (CompanyName like '[A-D]%') and (Country = 'USA')  
order by Address

/*Ejercicio 12: Seleccionar todos los campos del proveedor, cuya compa��a no comience
con las letras de la B a la G, y pertenezca al pa�s de UK, ordenarlos por nombre de la
compa��a.*/
where (CompanyName like'[^B-G]%') and
(Country='UK' )
--where (CompanyName not like'[B-G]%') and
-- (Country='UK')
order by CompanyName
250, sin stock en almac�n. Pertenecientes a las categor�as 1, 3, 4, 7 y 8, que son
distribuidos por los proveedores 2, 4, 6, 7 y 9.*/
where (Discontinued=0)and
(UnitPrice between 35 and 250)and
(UnitsInStock=0)and
(CategoryID in (1,3,4,7,8))and
(SupplierID in (2,4,6,7,9))

/*Ejercicio 14: Seleccionar todos los campos de los productos descontinuados, que
pertenezcan a los proveedores con c�digos: 1, 3, 7, 8 y 9, que tengan stock en almac�n,
y al mismo tiempo que sus precios unitarios est�n entre 39 y 190, ordenados por c�digo
de proveedor y precio unitario de manera ascendente.*/

Select * from Products
where SupplierID in ('1','3','7','8','9')  and (Discontinued = 1) and (UnitsInStock >0) and (UnitPrice between 39 and 190) 
order by SupplierID , UnitPrice asc

/*Ejercicio 15: Seleccionar los 7 productos con precios m�s caros, que cuenten con stock
en almac�n.*/

Select top 7 * from Products 
where (UnitsInStock > 0)
order by UnitPrice desc

/*Ejercicio 16: Seleccionar los 9 productos, con menos stock en almac�n, que pertenezcan
a la categor�a 3, 5 y 8.*/
entre el 2 y el 5, adem�s de los clientes con c�digos que comienzan con las letras de la
A hasta la G, del 31 de Julio de cualquier a�o.*/

Select * from Orders 
where (EmployeeID between 2 and 5) and (CustomerID like '[A-G]%') and (datepart(MM,OrderDate)= 7) and (datepart(DD,OrderDate) = 31)

/*Ejercicio 18: Seleccionar las �rdenes de compra, realizadas por el empleado con c�digo
3, de cualquier a�o pero solo de los �ltimos 5 meses (agosto - Diciembre).*/
cantidad pedida entre 10 y 250.*/