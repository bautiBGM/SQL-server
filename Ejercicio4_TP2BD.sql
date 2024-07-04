USE [Ejercicio4_TP2BD]
GO
/****** Object:  Table [dbo].[Camion]    Script Date: 27/5/2024 2:12:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Camion](
	[Matricula] [numeric](18, 0) NOT NULL,
	[Modelo] [nchar](15) NOT NULL,
	[Tipo] [nchar](15) NOT NULL,
	[Potencia] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Camion] PRIMARY KEY CLUSTERED 
(
	[Matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[Camionero]    Script Date: 27/5/2024 2:12:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Camionero](
	[CUIL] [numeric](18, 0) NOT NULL,
	[Nombre] [nchar](20) NOT NULL,
	[DNI] [numeric](18, 0) NOT NULL,
	[Direccion] [nchar](20) NULL,
	[Pueblo] [nchar](15) NULL,
	[Salario] [int] NULL,
	[Telefono] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Camionero] PRIMARY KEY CLUSTERED 
(
	[CUIL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[CamioneroxCamion]    Script Date: 27/5/2024 2:12:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CamioneroxCamion](
	[Codigo] [int] NOT NULL,
	[CUIL] [numeric](18, 0) NOT NULL,
	[Matricula] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_CamioneroxCamion] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[Paquete]    Script Date: 27/5/2024 2:12:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paquete](
	[CodigoPaquete] [numeric](18, 0) NOT NULL,
	[CodigoViaje] [int] NOT NULL,
	[CUIL] [numeric](18, 0) NOT NULL,
	[CodigoProvincia] [numeric](18, 0) NOT NULL,
	[Descripcion] [nchar](700) NULL,
	[Destinatario] [nchar](15) NOT NULL,
	[DireccionDestinatario] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Paquete] PRIMARY KEY CLUSTERED 
(
	[CodigoPaquete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Table [dbo].[Provincia]    Script Date: 27/5/2024 2:12:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[CodigoProvincia] [numeric](18, 0) NOT NULL,
	[Nombre] [nchar](20) NOT NULL,
	[Region] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED 
(
	[CodigoProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE Viaje(
    CodigoViaje int PRIMARY KEY,
    CUIL numeric(18,0),
    Matricula numeric(18,0),
    Fecha date,
    FOREIGN KEY (CUIL) REFERENCES Camionero(CUIL),
    FOREIGN KEY (Matricula) REFERENCES Camion(Matricula)
);



ALTER TABLE [dbo].[CamioneroxCamion]  WITH CHECK ADD  CONSTRAINT [FK_CamioneroxCamion_Camion] FOREIGN KEY([Matricula])
REFERENCES [dbo].[Camion] ([Matricula])
GO
ALTER TABLE [dbo].[CamioneroxCamion] CHECK CONSTRAINT [FK_CamioneroxCamion_Camion]
GO
ALTER TABLE [dbo].[CamioneroxCamion]  WITH CHECK ADD  CONSTRAINT [FK_CamioneroxCamion_Camionero] FOREIGN KEY([CUIL])
REFERENCES [dbo].[Camionero] ([CUIL])
GO
ALTER TABLE [dbo].[CamioneroxCamion] CHECK CONSTRAINT [FK_CamioneroxCamion_Camionero]
GO
ALTER TABLE [dbo].[Paquete]  WITH CHECK ADD  CONSTRAINT [FK_Paquete_Camionero] FOREIGN KEY([CUIL])
REFERENCES [dbo].[Camionero] ([CUIL])
GO
ALTER TABLE [dbo].[Paquete] CHECK CONSTRAINT [FK_Paquete_Camionero]
GO
ALTER TABLE [dbo].[Paquete]  WITH CHECK ADD  CONSTRAINT [FK_Paquete_Provincia] FOREIGN KEY([CodigoProvincia])
REFERENCES [dbo].[Provincia] ([CodigoProvincia])
GO
ALTER TABLE [dbo].[Paquete] CHECK CONSTRAINT [FK_Paquete_Provincia]
GO



ALTER TABLE Paquete
ADD FechaLlegada DATE NULL

UPDATE Paquete
SET FechaLlegada = '2018-02-15' 
WHERE CodigoPaquete = 000368

UPDATE Paquete
SET FechaLlegada = '2038-12-25' 
WHERE CodigoPaquete = 120368

ALTER TABLE Paquete
ADD CONSTRAINT FK_Paquete_Viaje
FOREIGN KEY (CodigoViaje) REFERENCES Viaje(CodigoViaje);

--------
insert into Camion (Matricula, Modelo, Tipo, Potencia) values (117, 'subaru', 'andres', 100 ) 
insert into Camion (Matricula, Modelo, Tipo, Potencia) values (007, 'bushima', 'piter', 120 )
insert into Camion (Matricula, Modelo, Tipo, Potencia) values (558, 'lambo', 'agus', 500 ) 

-----------------------------------------------------------------------------------

insert into Camionero (CUIL, Nombre, DNI, Direccion, Pueblo, Salario, Telefono) values (1111111, 'Tadeo', 55789631, 'cabildo 980', 'zimbawe', 500000, 1198756638), 
(22222222, 'Agus', 82773639, 'cabildo 604', 'zimbawe', 560700, 1178951638)
insert into Camionero (CUIL, Nombre, DNI, Direccion, Pueblo, Salario, Telefono) values (33333333, 'manu', 44261562, 'fitz roy 604', 'irak', 100, 1108973138)

----------------------------------------------------------

insert into CamioneroxCamion (Codigo, CUIL, Matricula) values (8008, 1111111, 117), (0880, 22222222, 007)
insert into CamioneroxCamion (Codigo, CUIL, Matricula) values (1337, 1111111, 558)

-----------------------------------------

insert into Provincia (CodigoProvincia, Nombre, Region) values (771, 'uruguay', 'kanto'), (964, 'cordoba','sinnoh')

------------------

insert into Paquete (CodigoPaquete,CodigoViaje,  CUIL, CodigoProvincia, Descripcion, Destinatario, DireccionDestinatario) values 
(000368,654,1111111, 771, 'objeto de uso diario', 'facultad ort', 'cabildo 980' ),
(120368,803,22222222, 964, 'objeto de uso en la cocina', 'Wendys', 'cabildo 604' )


insert into Paquete (CodigoPaquete,CodigoViaje,  CUIL, CodigoProvincia, Descripcion, Destinatario, DireccionDestinatario) values 
(370,279,1111111, 771, 'objeto de uso diario', 'facultad ort', 'cabildo 980' )

--------------------------------

insert into Viaje (CodigoViaje, CUIL, Matricula, Fecha) values (654, 1111111,117, '2018-04-10' ), (279, 1111111,117, '2018-03-19'),
(874, 33333333,558, '2018-04-11')

insert into Viaje (CodigoViaje, CUIL, Matricula, Fecha) values (803, 22222222,007, '2018-02-25')

ALTER TABLE viaje
DROP COLUMN CantPaquete;
-------------------------

--A) Mostrar todos los camiones que manejó un camionero el 25/02/2018
--B) ¿Cuáles provincias recibieron hasta el día de hoy paquetes?
--C) Mostrar la información de todos los camiones que fueron conducidos entre el 15/03/2018 y 31/05/2018 fechas
--D) Listar el camionero que más paquetes distribuyó, y dicha cantidad


--A) Mostrar todos los camiones que manejó un camionero el 25/02/2018

SELECT C.Matricula, C.Modelo FROM Viaje V JOIN Camion C ON V.Matricula = c.Matricula WHERE V.Fecha = '2018-02-25';

--B) ¿Cuáles provincias recibieron hasta el día de hoy paquetes?

SELECT 
    PR.CodigoProvincia,
    PR.Nombre AS ProvinciaNombre,
    PR.Region,
    PA.CodigoPaquete,
    PA.FechaLlegada
FROM 
    Provincia PR
INNER JOIN 
    Paquete PA ON PR.CodigoProvincia = PA.CodigoProvincia
WHERE 
    PA.FechaLlegada <= GETDATE()
   
   --C) Mostrar la información de todos los camiones que fueron conducidos entre el 15/03/2018 y 31/05/2018 fechas


	SELECT C.Matricula, C.Modelo FROM Viaje V JOIN Camion C ON V.Matricula = c.Matricula WHERE V.Fecha BETWEEN '2018-03-15' AND '2018-05-31';


	
-- D) Listar el camionero que más paquetes distribuyó, y dicha cantidad


SELECT TOP 1
    CM.Nombre,
	CM.Cuil,
    COUNT(PA.CodigoPaquete) AS TotalPaquetes
FROM
    Camionero CM
JOIN 
    Paquete PA ON CM.CUIL = PA.CUIL
GROUP BY 
    CM.Nombre,
	CM.Cuil
ORDER BY 
    TotalPaquetes DESC;
