USE [Ejercicio_3_tp2]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 26/5/2024 3:38:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[DNI] [int] NOT NULL,
	[Nombre] [nchar](10) NULL,
	[Apellido] [nchar](10) NULL,
	[Telefono] [numeric](18, 0) NULL,
	[FechaNacimiento] [date] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente_y_producto]    Script Date: 26/5/2024 3:38:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------

CREATE TABLE [dbo].[Cliente_y_producto](
	[DNI] [int] NOT NULL,
	[CodigoProducto] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direccion_Cliente]    Script Date: 26/5/2024 3:38:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------------------

CREATE TABLE [dbo].[Direccion_Cliente](
	[Direccion_Id_Cliente] [int] NOT NULL,
	[DNI] [int] NULL,
	[PsioDept_dir] [nchar](10) NULL,
	[Localidad_dir] [nchar](20) NULL,
	[Provincia] [nchar](15) NULL,
	[Calle_dir] [nchar](16) NULL,
	[Nro_Dir] [nchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 26/5/2024 3:38:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[CodigoProducto] [int] NOT NULL,
	[CUIL] [numeric](18, 0) NOT NULL,
	[Precio] [int] NOT NULL,
	[nombre] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[CodigoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provedoor]    Script Date: 26/5/2024 3:38:03 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provedoor](
	[CUIL] [numeric](18, 0) NOT NULL,
	[nombre] [nchar](13) NOT NULL,
	[CategoriaProductos] [nchar](15) NULL,
 CONSTRAINT [PK_Provedoor] PRIMARY KEY CLUSTERED 
(
	[CUIL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

-------
CREATE TABLE Venta (    CodigoVenta int PRIMARY KEY,    DNI INT NOT NULL,    CodigoProducto INT NOT NULL,    FechaVenta DATE NOT NULL,    FOREIGN KEY (DNI) REFERENCES Cliente(DNI),    FOREIGN KEY (CodigoProducto) REFERENCES Producto(CodigoProducto));

----------------------------------------------------
GO
ALTER TABLE [dbo].[Cliente_y_producto]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_y_producto_Cliente] FOREIGN KEY([DNI])
REFERENCES [dbo].[Cliente] ([DNI])
GO
ALTER TABLE [dbo].[Cliente_y_producto] CHECK CONSTRAINT [FK_Cliente_y_producto_Cliente]
GO
ALTER TABLE [dbo].[Cliente_y_producto]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_y_producto_Producto] FOREIGN KEY([CodigoProducto])
REFERENCES [dbo].[Producto] ([CodigoProducto])
GO
ALTER TABLE [dbo].[Cliente_y_producto] CHECK CONSTRAINT [FK_Cliente_y_producto_Producto]
GO
ALTER TABLE [dbo].[Direccion_Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Cliente_Cliente] FOREIGN KEY([DNI])
REFERENCES [dbo].[Cliente] ([DNI])
GO
ALTER TABLE [dbo].[Direccion_Cliente] CHECK CONSTRAINT [FK_Direccion_Cliente_Cliente]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Provedoor] FOREIGN KEY([CUIL])
REFERENCES [dbo].[Provedoor] ([CUIL])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Provedoor]
GO


-----------------------------------------------------------------------------------------------------------




Insert into Producto (CodigoProducto, CUIL, Precio, nombre) values (117, 1111111, 50, 'papel' ), (007, 22222222, 500, 'lija' ), (69, 33333333, 100, 'escoba' )

Insert into Provedoor (CUIL, nombre, CategoriaProductos) values (1111111, 'andres', 'libreria' ), (22222222, 'piter', 'Ferreteria'), (33333333, 'Tadeo' , 'limpieza' )


insert into Cliente (DNI, Nombre, Apellido, Telefono, FechaNacimiento) values (11111111, 'miguel' , 'senez', 58589696, '02/03/2004'), (22222222, 'alexa' , 'suarez', 41247856, '01/03/2000'), 
(33333333, 'siri' , 'jonson', 8521364, '10/09/1998') 

INSERT INTO Venta (CodigoVenta, DNI, CodigoProducto, FechaVenta)VALUES (1, 11111111, 117, '2024-05-25'), (2, 22222222, 007, '2024-05-26'), (3, 33333333, 69, '2024-05-27');


insert into Direccion_Cliente (Direccion_Id_Cliente ,DNI, PsioDept_dir, Localidad_dir, Provincia, Calle_dir, Nro_Dir) values (58 ,11111111, '1er piso' , 'colegiales', 'caba', 'lacroze', '9987'), 
(54,22222222, '1er piso' , 'palermo', 'caba', 'lacroze', '8942'), (34 ,33333333, '1er piso' , 'belgrano', 'caba', 'lacroze', '5147')






--A) Listar todas las ventas hasta el día de hoy en la empresa, mostrando cliente y el importe gastado.
--B) Mostrar los clientes que hayan realizado al menos 1 venta en una fecha ingresada por el usuario
--C) Obtener un listado de todos los productos de un proveedor en particular
--D) Cargar los datos de un producto nuevo
--E) Listar todos los clientes cuyo apellido comience con S


-----------A)-----------------

SELECT     C.DNI,    C.Nombre,    C.Apellido,	C.Telefono,	C.FechaNacimiento,    SUM(P.Precio) AS ImporteGastadoFROM     Venta VINNER JOIN     Cliente C ON V.DNI = C.DNIINNER JOIN     Producto P ON V.CodigoProducto = P.CodigoProductoGROUP BY     C.DNI,     C.Nombre,     C.Apellido,	C.Telefono,	C.FechaNacimiento;




--B) Mostrar los clientes que hayan realizado al menos 1 venta en una fecha ingresada por el usuario


SELECT * FROM Cliente INNER JOIN Venta ON Cliente.DNI = Venta.DNI WHERE Venta.FechaVenta >= '2024-05-25' AND Venta.FechaVenta <= '2024-05-26';

--C) Obtener un listado de todos los productos de un proveedor en particular


SELECT * FROM Provedoor INNER JOIN Producto ON Provedoor.CUIL = Producto.CUIL WHERE Provedoor.nombre = 'piter';

--D) Cargar los datos de un producto nuevo

INSERT INTO Producto (CodigoProducto, CUIL, Precio, nombre)
VALUES (123, 1111111, 200, 'tapon') 
SELECT * FROM Producto;


--E) Listar todos los clientes cuyo apellido comience con S


SELECT * FROM Cliente WHERE Cliente.Apellido like 's%';
