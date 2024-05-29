use master; 

CREATE DATABASE TP2BDEJERCICIO1;

use TP2BDEJERCICIO1;

--PRIMERA TABLA CREADA 

CREATE TABLE Sala(
	Num_Sala nchar(12) NOT NULL PRIMARY KEY, 
	CantCamas int NOT NULL, 
	Piso int NOT NULL);

--SEGUNDA TABLA CREADA 

CREATE TABLE Paciente(
	Num_Registro numeric(18, 0) NOT NULL PRIMARY KEY,
	Nombre nchar(10) NOT NULL,
	Apellido char(10) NOT NULL,
	Num_sala nchar (12) NOT NULL FOREIGN KEY REFERENCES Sala(Num_sala));

--TERCERA TABLA CREADA 

CREATE TABLE Personal(
	Num_Empleado numeric(18,0) NOT NULL PRIMARY KEY,
	Nombre char(20) NOT NULL, 
	Apellido char(20) NOT NULL, 
	Telefono numeric (18,0) NOT NULL, 
	Num_Sala nchar(12) NOT NULL FOREIGN KEY REFERENCES Sala(Num_sala));

--CUARTA TABLA CREADA 

CREATE TABLE Direccion(
	ID_direccion_personal int NOT NULL PRIMARY KEY,
	Direc_Empleado_calle char(20) NULL,
	Direc_Empleado_nro int NULL,
	Direc_Empleado_PisoDepto nchar(5) NULL,
	Direc_Empleado_Localidad char(20) NULL,
	Direc_Empelado_CodPostal int  NULL, 
	Num_Empleado numeric(18,0) NOT NULL FOREIGN KEY REFERENCES Personal(Num_Empleado));


insert Sala (Num_Sala,CantCamas,Piso) values (1,10,2)
insert Sala (Num_Sala,CantCamas,Piso) values (2,8,3)

--LISTADO DE SALAS
select * from Sala;

--LISTADO DE PACIENTES
insert into Paciente (Num_Registro,Nombre,Apellido,Num_Sala)
values (5,'Sole','Gayoso',1),(6,'Arnol','Gayoso',1),(7,'Agus','Gayoso',2),(8,'Tomi','Gayoso',2),(9,'Sofi','Gayoso',2),(10,'Bauti','Gayoso',2)

--LISTADO DE PACIENTES 
select * from Paciente;

--LISTADO DE PERSONAL
insert into Personal (Num_Empleado, Nombre, Apellido, Telefono, Num_Sala)
values (1,'Leo','Messi',1111111111,1),(2,'Julian','Alvarez',2222222222,1),(3,'Angel','Di Maria',3333333333,2),
(4,'Enzo','Fernandez',4444444444,2),(5,'Alexis','Macallister',5555555555,2),(6,'Rodrigo','De Paul',66666666666,2)

SELECT * from Personal;

UPDATE Personal SET Telefono = 6666666666 WHERE Num_Empleado = 6;

--LISTADO DE PERSONAL
SELECT * from Personal;

--LISTADO DE DIRECCION DEL PERSONAL
insert into Direccion(ID_direccion_personal, Direc_Empleado_calle, Direc_Empleado_nro,
Direc_Empleado_PisoDepto, Direc_Empleado_Localidad, Direc_Empelado_CodPostal, Num_Empleado)
values (1, 'Miami', 11, '1A', 'EEUU', 1111, 1), (2, 'Manchester', 22, '2B', 'Inglaterra', 2222, 2), (3, 'Benfica', 33, '3C', 'Portugal', 3333, 3),
(4, 'Londres', 44, '4D', 'Inglaterra', 4444, 4), (5, 'Liverpool', 55, '5E', 'Inglaterra', 5555, 5), (6, 'Madrid', 66, '6F', 'Espania', 6666, 6)

--LISTADO DE DIRECCION DEL PERSONAL
SELECT * from Direccion;

---------------------------------------------

--A) mostrar el numero de empleados y el telefono, del personal que trabaja en la sala 2 
SELECT Num_Empleado, Telefono FROM Personal WHERE Num_Sala = 2;

--B) obtener un listado de los pacientes que fueron/son atendidos en la sala 1 
SELECT * FROM Paciente WHERE Num_Sala = 1;

--C) Listar todos los empleados y el nombre de la sala en que trabajan 
SELECT P.Nombre as 'Nombre del personal',P.Apellido as 'Apellido del personal', S.Num_Sala as 'Numero de la sala' FROM Personal P
INNER JOIN Sala S ON P.Num_Sala=S.Num_Sala;

--D) Insertar una sala nueva en el sistema 
insert Sala(Num_Sala,CantCamas,Piso) values (3,5,4)

SELECT * FROM Sala;

--E)Modificar la direccion de residencia de un empleado (ARREGLAR ERRORES)
UPDATE Direccion SET Direc_Empleado_calle = 'Argentina' WHERE Num_Empleado = 1;
UPDATE Direccion SET Direc_Empleado_nro = 112 WHERE Num_Empleado = 1;
UPDATE Direccion SET Direc_Empleado_PisoDepto = '' WHERE Num_Empleado = 1; 
UPDATE Direccion SET Direc_Empleado_Localidad = 'Buenos Aires' WHERE Num_Empleado = 1; 
UPDATE Direccion SET Direc_Empelado_CodPostal = 1112 WHERE Num_Empleado = 1;

-- Confirmar que la actualizacion fue correcta
SELECT * FROM Direccion WHERE Num_Empleado = 1;

--F)Eliminar un paciente del sistema 
DELETE FROM Paciente WHERE Nombre = 'sofi';

SELECT * FROM Paciente;
