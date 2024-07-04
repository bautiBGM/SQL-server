use master;

CREATE DATABASE TP2BDEJERCICIO2;

use TP2BDEJERCICIO2;

--PRIMERA TABLA CREADA 

CREATE TABLE Libro(
	CodInterno Numeric (18,0) NOT NULL PRIMARY KEY,
	Titulo nchar(40) NOT NULL, 
	Año Date NOT NULL, 
	NombreAutor nchar(30) NOT NULL, 
	AñoEdicion Date, 
	Editorial nchar(30) NOT NULL);

--SEGUNDA SALA CREADA

CREATE TABLE Socio(
	CodigoSocio Numeric (18,0) NOT NULL PRIMARY KEY,
	NombreSoc nchar(20) NOT NULL,
	ApellidoSoc nchar(20) NOT NULL,
	DNI Numeric (18,0) NOT NULL,
	Telefono numeric (18,0) NOT NULL);
	
--TERCERA SALA CREADA
 
CREATE TABLE Prestamo(
	NroPrestamo Numeric (18,0) NOT NULL PRIMARY KEY,
	FechaRealizacion Date NOT NULL,
	FechaDevolucion Date NOT NULL,
	FechaTope Date NOT NULL,
	CodigoSocio Numeric (18,0) NOT NULL FOREIGN KEY REFERENCES Socio(CodigoSocio),
	CodInterno Numeric (18,0) NOT NULL FOREIGN KEY REFERENCES Libro(CodInterno));

--CUARTA SALA CREADA 

CREATE TABLE Volumen(
	CodigoVolumen Numeric (18,0) NOT NULL PRIMARY KEY,
	Deterioro char(15) NOT NULL,
	NroVolumen int NOT NULL,
	CodInterno Numeric (18,0) NOT NULL FOREIGN KEY REFERENCES Libro(CodInterno));


------------------------------------------
-- LISTADO DE SOCIO 

insert into Socio(CodigoSocio,NombreSoc,ApellidoSoc,DNI,Telefono)
values (10, 'Andres', 'Rapinoe',11111111, 11111111), (11, 'Jake', 'Paul', 22222222,2222222222 ),(12, 'Mike', 'Tyson', 33333333,333333333),
(13, 'juan', 'Ty', 44444444,4444444444)

SELECT * FROM Socio;

--LISTADO DE LIBRO

insert into Libro (CodInterno, Titulo, Año, NombreAutor, AñoEdicion, Editorial)
values (1, 'messi', '01/01/1990', 'Andres', '10/05/1990', 'juan'), (2, 'ronaldo', '05/01/1995', 'Cristiano', '20/11/1995', 'Andres'),
(3,'neymar', '10/06/2010', 'Cristiano', '11/09/2016', 'Andres'), (4,'juan','10/04/2020','Bautista','25/04/2024','san pedro')

SELECT * FROM Libro;


--LISTADO DE PRESTAMO

insert into Prestamo(NroPrestamo,FechaRealizacion,FechaDevolucion,FechaTope, CodigoSocio, CodInterno)
values (1, '1/01/2000', '10/02/2000', '30/01/2000',10,1), (2, '1/01/2000', '10/02/2000', '30/01/2000',11,2),
(3, '15/01/2020', '2/02/2020', '10/02/2020',12,3)

SELECT * FROM Prestamo;

--LISTADO DE VOLUMEN
insert into Volumen (CodigoVolumen, Deterioro, NroVolumen, CodInterno) 
values (1, 'Deteriorado', 1, 1), (2, 'Deteriorado', 2, 2), (3, 'Bueno', 3, 3), (4, 'Muy bueno', 14, 4)

SELECT * FROM Volumen;

------------------------------------------

--A) Mostrar todos los volumenes deteriorados

SELECT * FROM Volumen WHERE Deterioro = 'Deteriorado'

--B)Obtener un listado de todos los pedidos que pasaron su fecha tope de devolucion

SELECT * FROM Prestamo WHERE FechaTope < FechaDevolucion 

--C)Mostrar una lista de todos los libro que se escribieron despues del Año 2000

SELECT * FROM Libro WHERE Año > '31/12/2000'

--D)Obtener un listado de los libros de la biblioteca, ordenados por autor
 
 SELECT * FROM Libro ORDER BY NombreAutor ASC

--E)Obtener un listado de todos los socios que retiraron un libro entre 01/01/2000 y 31/01/2000

SELECT * FROM Socio LEFT JOIN Prestamo ON Prestamo.CodigoSocio = Socio.CodigoSocio WHERE FechaRealizacion >= '01/01/2000' AND FechaRealizacion <= '31/01/2000'
