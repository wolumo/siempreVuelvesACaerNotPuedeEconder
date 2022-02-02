create database Practica_Sist

use Practica_Sist

create table Cliente (
Id_Cliente int primary key identity(1,1) not null,
Cedula nvarchar(25) not null,
Nombre nvarchar(25) not null,
Telefono char(8) ,
Direccion nvarchar(70) not null
)
drop table Cliente
create table Automovil (
Id_Automovil int primary key identity (1,1) not null , 
Cilindraje char(1) not null, 
Modelo nvarchar(10) not null, 
Placa nvarchar(10) check(Placa like '[M|L|MA|CH] [0-9] [0-9] [0-9] [0-9] [0-9] [0-9]') , 
Color nvarchar(10) not null, 
Origen nvarchar(10) not null , 
Id_Cliente int foreign key references Cliente(Id_Cliente))

drop table Automovil

create table Repuestos(
Id_Repuestos int primary key not null,
NombreRepuesto nvarchar(35) not null,
Descripcion nvarchar (50) not null,
Id_Marca int foreign key references Marca_Repuesto(Id_Marca)
)

create table Marca_Repuesto(
Id_Marca int primary key identity (1,1) not null,
NombreMarca nvarchar(35) not null)

create table DetalleRepuesto (
Id_Repuestos int foreign key references Repuestos(Id_Repuestos),
Id_Automovil int foreign key references Automovil(Id_Automovil),
primary key (Id_Repuestos , Id_Automovil))

drop table DetalleRepuesto

create table Vendedor (
Id_Vendedor int primary key  identity(1,1) not null, 
Nombre nvarchar(35) not null, 
Cedula nvarchar(35) not null, 
Telefono char(8) check (Telefono like '[5|7|8] [0-9] [0-9] [0-9] [0-9] [0-9] [0-9] [0-9]') not null)

create table Venta (
Id_Venta int primary key not null,
Fecha date default getdate() not null,
Cantidad char(1) not null, 
Id_Vendedor int foreign key references Vendedor(Id_Vendedor)
)

create table DetalleVenta (
Id_Venta int foreign key references Venta(Id_Venta) , 
Id_Repuestos int foreign key references Repuestos(Id_Repuestos) ,
Monto nvarchar(5) not null 
)


--Procedimientos almacenados 
--Insetar
 alter procedure InsertarCliente 
@Cedula nvarchar(25),
@Nombre nvarchar(25),
@Telefono char(8), 
@Direccion nvarchar(25)
as
Declare @Vali nvarchar(35)
set @Vali = (Select Cedula from cliente where Cedula = @Cedula)
if (@Vali = @Cedula)
begin 
 print 'Cliente ya registrado'
end
else
begin 
 if (@Cedula = ' ')
  begin 
  print 'No puede ser la cedula nula' 
  end 
else
begin 
insert into Cliente values (@Cedula , @Nombre ,@Telefono , @Direccion)
end
end

exec InsertarCliente '001-041202-1023F' , 'Wiston Quintana' , 78839454 , 'Residencial Villa Milagro'


select * from Cliente

--Actualizar

alter procedure ActualizarCliente 
@ID int , 
@Cedula nvarchar(30),
@Nombre nvarchar(30),
@Telefono char(8),
@Direccion nvarchar(30)
as 
declare @IdBus int 
set @IdBus = (Select Id_Cliente from cliente where Id_Cliente = @ID)
declare @NombreBus nvarchar(35)
set @NombreBus = (Select Nombre from cliente where Nombre = @Nombre)

if (@IdBus = @ID)
begin 
 if (@NombreBus = @Nombre)
 Begin 
 print 'No se puede duplicar , los datos son iguales'
 end 
 else
 begin 
  if (@Nombre = '')
  begin 
  print 'El nombre no puede ser nulo' 
  end 
  else 
  begin 
  update Cliente set Cedula = @Cedula , Nombre = @Nombre , Telefono =@Telefono , Direccion = @Direccion where Id_Cliente = @ID
  end
  end
  end
  else 
  begin 
  print 'No se pudo duplicar'
  end

  exec ActualizarCliente 1 , '001-020305-1025F' , 'Scarlette Galo' , '88798545' , 'km 13'


  select * from cliente