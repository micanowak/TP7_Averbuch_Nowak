USE [master]
GO
/****** Object:  Database [JuegoQQSM]    Script Date: 4/8/2022 10:59:08 ******/
CREATE DATABASE [JuegoQQSM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JuegoQQSM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\JuegoQQSM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JuegoQQSM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\JuegoQQSM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [JuegoQQSM] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JuegoQQSM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JuegoQQSM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ARITHABORT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JuegoQQSM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JuegoQQSM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JuegoQQSM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JuegoQQSM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JuegoQQSM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JuegoQQSM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JuegoQQSM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JuegoQQSM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JuegoQQSM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JuegoQQSM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JuegoQQSM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JuegoQQSM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JuegoQQSM] SET RECOVERY FULL 
GO
ALTER DATABASE [JuegoQQSM] SET  MULTI_USER 
GO
ALTER DATABASE [JuegoQQSM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JuegoQQSM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JuegoQQSM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JuegoQQSM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JuegoQQSM] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'JuegoQQSM', N'ON'
GO
ALTER DATABASE [JuegoQQSM] SET QUERY_STORE = OFF
GO
USE [JuegoQQSM]
GO
/****** Object:  User [alumno]    Script Date: 4/8/2022 10:59:08 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Jugadores]    Script Date: 4/8/2022 10:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jugadores](
	[IdJugador] [int] NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[PozoGanado] [int] NOT NULL,
	[ComodinDobleChance] [bit] NOT NULL,
	[ComodinSaltear] [bit] NOT NULL,
	[Comodin50] [bit] NOT NULL,
 CONSTRAINT [PK_Jugadores] PRIMARY KEY CLUSTERED 
(
	[IdJugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 4/8/2022 10:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] NOT NULL,
	[TextoPregunta] [varchar](200) NOT NULL,
	[NivelDificultad] [int] NOT NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 4/8/2022 10:59:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[IdRespuesta] [int] NOT NULL,
	[fkIdPregunta] [int] NOT NULL,
	[OpcionRespuesta] [char](10) NOT NULL,
	[TextoRespuesta] [varchar](200) NOT NULL,
	[Correcta] [bit] NOT NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (1, N'¿Cuántos litros de sangre tiene una persona adulta?', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (2, N'¿Cuál es el país más grande del mundo?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (3, N'¿Cuál es el país más pequeño del mundo?', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (4, N'¿Cuántos decimales tiene el númerp pi p?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (5, N'¿Cuántos jugadores por equipo participan en un partido de voley?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (6, N'¿Quién pintó la obra "Guernica"?', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (7, N'¿A quién se le atribuye la frase "Solo sé que no sé nada"?', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (8, N'¿Cuál es la montaña más alta del continente americano?', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (9, N'¿Qué hora es en inglés "It is a quarter past six"?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (10, N'¿Cuáles son los dioses griegos correspondientes a los dioses romanos Júpiter y Plutón?', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (11, N'¿Cuáles son los nombres de los tres reyes magos?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (12, N'¿Quién fue el primer hombre en pisar la Luna?', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (13, N'¿Cuál es el tipo sanguíneo considerado como "donante universal"?', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (14, N'¿Cuál es el cromosoma que determina el sexo masculino?', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (15, N'¿Cuál es la capital de Australia?', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (16, N'¿Cómo se llaman los vasos que transportan la sangre desde el corazón al resto del cuerpo?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (17, N'¿Con qué países tiene frontera Ecuador?', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [TextoPregunta], [NivelDificultad]) VALUES (18, N'¿Qué sustancia es absorbida por las plantas y expirada por los animales?', 2)
GO
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (1, 1, N'A         ', N'Tiene entre 4 y 6 litros', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (2, 1, N'B         ', N'Tiene entre 2 y 4 litros', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (3, 1, N'C         ', N'Tiene 10 litros', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (4, 1, N'D         ', N'Tiene 7 litros', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (5, 2, N'A         ', N'EEUU', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (6, 2, N'B         ', N'China', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (7, 2, N'C         ', N'Rusia', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (8, 2, N'D         ', N'India', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (9, 3, N'A         ', N'Malta', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (10, 3, N'B         ', N'San Marino', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (11, 3, N'C         ', N'Vaticano', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (12, 3, N'D         ', N'Mónaco', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (13, 4, N'A         ', N'100', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (14, 4, N'B         ', N'Infinitos', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (15, 4, N'C         ', N'1000', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (16, 4, N'D         ', N'50', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (17, 5, N'A         ', N'4', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (18, 5, N'B         ', N'7', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (19, 5, N'C         ', N'5', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (20, 5, N'D         ', N'6', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (21, 6, N'A         ', N'Pablo Picasso', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (22, 6, N'B         ', N'Salvador Dalí', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (23, 6, N'C         ', N'Diego Rivera', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (24, 6, N'D         ', N'Frida Kahlo', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (25, 7, N'A         ', N'Salomón', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (26, 7, N'B         ', N'Nietszche', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (27, 7, N'C         ', N'Aristóteles', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (28, 7, N'D         ', N'Sócrates', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (29, 8, N'A         ', N'Monte Everest', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (30, 8, N'B         ', N'Aconcagua', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (31, 8, N'C         ', N'Pico Bolívar', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (32, 8, N'D         ', N'Pico Neblina', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (33, 9, N'A         ', N'6:15', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (34, 9, N'B         ', N'3:46', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (35, 9, N'C         ', N'6:45', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (36, 9, N'D         ', N'5:45', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (37, 10, N'A         ', N'Zeus y Ares', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (38, 10, N'B         ', N'Ares y Hermes', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (39, 10, N'C         ', N'Dionisio y Démeter', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (40, 10, N'D         ', N'Zeus y Hades', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (41, 11, N'A         ', N'Simon, Judas y Mateo', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (42, 11, N'B         ', N'Gaspar, Nicolas y Nataniel', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (43, 11, N'C         ', N'Gaspar, Melchor y Baltazar', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (44, 11, N'D         ', N'Charles, George y Louis', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (45, 12, N'A         ', N'Michael Collins', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (46, 12, N'B         ', N'Buzz Aldrin', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (47, 12, N'C         ', N'Neil Armstrong', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (48, 12, N'D         ', N'Yuri Gagarin', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (49, 13, N'A         ', N'Tipo O', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (50, 13, N'B         ', N'Tipo B', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (51, 13, N'C         ', N'Tipo A', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (52, 13, N'D         ', N'Tipo AB', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (53, 14, N'A         ', N'El cromosoma M', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (54, 14, N'B         ', N'El cromosoma Z', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (55, 14, N'C         ', N'El cromosoma V', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (56, 14, N'D         ', N'El cromosoma Y', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (57, 15, N'A         ', N'Melbourne', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (58, 15, N'B         ', N'Canberra', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (59, 15, N'C         ', N'Adelaide', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (60, 15, N'D         ', N'Perth', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (61, 16, N'A         ', N'Arterias', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (62, 16, N'B         ', N'Uréteres', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (63, 16, N'C         ', N'Venas', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (64, 16, N'D         ', N'Capilares', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (65, 17, N'A         ', N'Con Brasil y Colombia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (66, 17, N'B         ', N'Con Colombia y Perú', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (67, 17, N'C         ', N'Con Bolivia y Brasil', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (68, 17, N'D         ', N'Con Perú y Bolivia', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (69, 18, N'A         ', N'Dióxido de hierro', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (70, 18, N'B         ', N'Oxígeno', 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (71, 18, N'C         ', N'Dióxido de carbono', 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [fkIdPregunta], [OpcionRespuesta], [TextoRespuesta], [Correcta]) VALUES (72, 18, N'D         ', N'Nitrato de sodio', 0)
GO
USE [master]
GO
ALTER DATABASE [JuegoQQSM] SET  READ_WRITE 
GO
