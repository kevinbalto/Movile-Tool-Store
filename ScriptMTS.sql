use [master]
go

if(exists(select name from dbo.sysdatabases where name = 'MobileToolStore'))
drop database [MobileToolStore]
go

create database [MobileToolStore]
go

use [MobileToolStore]
go

if(exists(select name from dbo.sysobjects where name = 'TblUsuarios'))
drop table [TblUsuarios]
go
create table TblUsuarios (
correoElectronico varchar(100) not null,
nombre varchar(50) not null,
fechaNacimiento date not null,
direccion varchar(100) not null,
contrasenna varchar(50) not null,
rol varchar(50) not null);

alter table TblUsuarios add
constraint Pk_Usuario primary key(correoElectronico)
go

if(exists(select name from dbo.sysobjects where name = 'TblProveedores'))
drop table [TblProveedores]
go
create table TblProveedores (
cedulaLegalProveedor varchar(50) not null,
nombreProveedor varchar(50) not null,
correoElectronico varchar(100) not null,
telefono varchar(50) not null,
direccion varchar(100) not null,
contacto varchar(50) not null);

alter table TblProveedores add
constraint Pk_Proveedor primary key(cedulaLegalProveedor)
go

if(exists(select name from dbo.sysobjects where name = 'TblProductoProveedor'))
drop table [TblProductoProveedor]
go
create table TblProductoProveedor(
id int identity not null,
codigoBarras varchar(50) not null,
cedulaLegalProveedor varchar(50) not null);

alter table TblProductoProveedor add
constraint Pk_ProductoProveedor primary key(id)
go

if(exists(select name from dbo.sysobjects where name = 'TblProductos'))
drop table [TblProductos]
go
create table TblProductos(
codigoBarras varchar(50) not null,
nombre varchar(50) not null,
precio decimal(12,2) not null,
tipo varchar(50) not null,
modelo varchar(50) not null,
cantidad int not null,
descripcion varchar(100) not null,
estado varchar(50) not null,
disponibilidad varchar(50) not null,
foto varchar(100) not null);

alter table TblProductos add
constraint Pk_Producto primary key(codigoBarras)
go

if(exists(select name from dbo.sysobjects where name = 'TblProductoMarca'))
drop table [TblProductoMarca]
go
create table TblProductoMarca(
id int identity not null,
codigoBarras varchar(50) not null,
codigoMarca varchar(50) not null);

alter table TblProductoMarca add
constraint Pk_ProductoMarca primary key(id)
go

if(exists(select name from dbo.sysobjects where name = 'TblMarcas'))
drop table [TblMarcas]
go
create table TblMarcas(
codigoMarca varchar(50) not null,
nombreMarca varchar(50) not null,
paisOrigen varchar(50) not null,
correoElectronico varchar(100) not null,
contacto varchar(50) not null,
telefono varchar(50)not null);

alter table TblMarcas add
constraint Pk_Marca primary key(codigoMarca)
go

if(exists(select name from dbo.sysobjects where name = 'TblFacturas'))
drop table [TblFacturas]
go
create table TblFacturas(
codigoFactura int not null,
nombreCliente varchar(50)not null,
fechaFacturacion date not null,
totalPagar decimal(12,2)not null,
numeroTarjeta varchar (50) not null,
fechaCaducidad date not null,
codigoSeguridad varchar(50) not null);

alter table TblFacturas add
constraint Pk_Factura primary key(codigoFactura)
go

if(exists(select name from dbo.sysobjects where name = 'TblDetalleFactura'))
drop table [TblDetalleFactura]
go
create table TblDetalleFactura(
codigoDetalleFactura int identity not null,
codigoFactura int not null,
codigoBarras varchar(50) not null,
nombreProducto varchar(50) not null,
precio decimal(12,1) not null,
cantidad int not null,
subtotal decimal(12,1) not null);

alter table TblDetalleFactura add
constraint Pk_DetalleFactura primary key(codigoDetalleFactura,codigoFactura)
go

if(exists(select name from dbo.sysobjects where name = 'TblProductosMasVendidos'))
drop table [TblProductosMasVendidos]
go
create table TblProductosMasVendidos(
id int identity not null,
codigoBarras varchar(50) not null,
foto varchar(100) not null,
nombre varchar(50) not null);

alter table TblProductosMasVendidos add
constraint Pk_TblProductosMasVendidos primary key(id)
go

if(exists(select name from dbo.sysobjects where name = 'TblComentario'))
drop table TblComentario
go
create table TblComentario(
id int identity not null primary key,
nombreCompleto varchar(50) not null,
telefono varchar(50) not null,
correoElectronico varchar(100) not null,
mensaje varchar(200) not null);


--procedimiento almacenado para mostrar por categoiria de producto
drop procedure [Sp_Cns_FiltroProducto]

create procedure [Sp_Cns_FiltroProducto]
@tipo varchar(50)
as 
select codigoBarras, nombre,tipo, precio, cantidad,descripcion,disponibilidad, foto from TblProductos
where @tipo=tipo and disponibilidad = 1;
go



alter table TblProductoProveedor add foreign key(codigoBarras) references TblProductos(codigoBarras);
alter table TblProductoProveedor add foreign key(cedulaLegalProveedor) references TblProveedores(cedulaLegalProveedor);
alter table TblProductoMarca add foreign key(codigoBarras) references TblProductos(codigoBarras);
alter table TblProductoMarca add foreign key(codigoMarca) references TblMarcas(codigoMarca);
alter table TblDetalleFactura add foreign key(codigoFactura) references TblFacturas(codigoFactura);

select * from TblFacturas
select * from TblDetalleFactura
select * from TblProductos
select * from TblProductosMasVendidos
select * from TblUsuarios

update TblProductos set cantidad=20, disponibilidad = 1 where codigoBarras= 00011244

------------------------Procedimiento almacenado para obtener el top 10 de productos mas vendidos-----------------------
drop procedure [Sp_Cns_ProductosMasVendidos]

create procedure [Sp_Cns_ProductosMasVendidos]
as
SELECT TOP (10) codigoBarras,foto,nombre 
FROM   TblProductosMasVendidos
GROUP  BY codigoBarras,foto,nombre
go
exec [Sp_Cns_ProductosMasVendidos]

