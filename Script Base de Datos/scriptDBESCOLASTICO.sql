USE [master]
GO
/****** Object:  Database [DBESCOLASTICO]    Script Date: 3/8/2020 22:31:20 ******/
CREATE DATABASE [DBESCOLASTICO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBESCOLASTICO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DBESCOLASTICO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBESCOLASTICO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DBESCOLASTICO_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBESCOLASTICO] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBESCOLASTICO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBESCOLASTICO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBESCOLASTICO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBESCOLASTICO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBESCOLASTICO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBESCOLASTICO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET RECOVERY FULL 
GO
ALTER DATABASE [DBESCOLASTICO] SET  MULTI_USER 
GO
ALTER DATABASE [DBESCOLASTICO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBESCOLASTICO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBESCOLASTICO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBESCOLASTICO] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBESCOLASTICO', N'ON'
GO
ALTER DATABASE [DBESCOLASTICO] SET QUERY_STORE = OFF
GO
USE [DBESCOLASTICO]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 3/8/2020 22:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[idalumno] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](50) NULL,
	[apellidos] [varchar](50) NULL,
	[cedula] [varchar](15) NULL,
	[fecha_nacimiento] [date] NULL,
	[lugar_nacimiento] [varchar](50) NULL,
	[sexo] [nchar](1) NULL,
 CONSTRAINT [PK_Alumno] PRIMARY KEY CLUSTERED 
(
	[idalumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 3/8/2020 22:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[idarea] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[coordinador] [varchar](50) NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[idarea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Beca]    Script Date: 3/8/2020 22:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beca](
	[idbeca] [int] IDENTITY(1,1) NOT NULL,
	[cedula] [varchar](50) NULL,
	[idestudiante] [varchar](10) NULL,
	[nombres] [varchar](50) NULL,
	[apellidos] [varchar](50) NULL,
	[cuenta_bancaria] [varchar](15) NULL,
	[periodo] [varchar](50) NULL,
	[tipo_beca] [varchar](50) NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_Beca] PRIMARY KEY CLUSTERED 
(
	[idbeca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calificacion]    Script Date: 3/8/2020 22:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calificacion](
	[idcalificacion] [int] IDENTITY(1,1) NOT NULL,
	[valor] [decimal](4, 2) NULL,
	[fecha] [datetime] NULL,
	[unidad] [nchar](1) NULL,
	[idmatricula] [int] NULL,
 CONSTRAINT [PK_Calificacion] PRIMARY KEY CLUSTERED 
(
	[idcalificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materia]    Script Date: 3/8/2020 22:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materia](
	[idmateria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](75) NULL,
	[nrc] [nchar](5) NULL,
	[creditos] [smallint] NULL,
	[idarea] [int] NULL,
 CONSTRAINT [PK_Materia] PRIMARY KEY CLUSTERED 
(
	[idmateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matricula]    Script Date: 3/8/2020 22:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matricula](
	[idmatricula] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NULL,
	[costo] [decimal](18, 2) NULL,
	[estado] [nchar](1) NULL,
	[tipo] [nchar](1) NULL,
	[idalumno] [int] NULL,
	[idmateria] [int] NULL,
 CONSTRAINT [PK_Matricula] PRIMARY KEY CLUSTERED 
(
	[idmatricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Alumno] ON 

INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (1, N'Johann Mateo', N'Granja Yumbla', N'1717483471', CAST(N'1999-01-06' AS Date), N'Quito', N'M')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (5, N'Carolina', N'Arroyo', N'1843276817', CAST(N'1996-06-14' AS Date), N'Ambato', N'M')
SET IDENTITY_INSERT [dbo].[Alumno] OFF
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([idarea], [nombre], [coordinador]) VALUES (1, N'Programacion', N'Ing. Javier Montaluisa')
INSERT [dbo].[Area] ([idarea], [nombre], [coordinador]) VALUES (2, N'Inteligencia Artificial', N'Dr. Jose Carrillo')
SET IDENTITY_INSERT [dbo].[Area] OFF
SET IDENTITY_INSERT [dbo].[Beca] ON 

INSERT [dbo].[Beca] ([idbeca], [cedula], [idestudiante], [nombres], [apellidos], [cuenta_bancaria], [periodo], [tipo_beca], [fecha]) VALUES (2, N'1717483471', N'L00377018', N'Mateo', N'Granja', N'111111111111', N'PREGRADO S-I MAY20 - SEP20', N'Excelencia Academica', CAST(N'2020-03-08' AS Date))
INSERT [dbo].[Beca] ([idbeca], [cedula], [idestudiante], [nombres], [apellidos], [cuenta_bancaria], [periodo], [tipo_beca], [fecha]) VALUES (4, N'15478787873', N'L00478471', N'Juan', N'Perez', N'1010100000000', N'PREGRADO S-I MRZ19 - JUL19', N'Socioeconomica', CAST(N'2020-03-08' AS Date))
SET IDENTITY_INSERT [dbo].[Beca] OFF
SET IDENTITY_INSERT [dbo].[Materia] ON 

INSERT [dbo].[Materia] ([idmateria], [nombre], [nrc], [creditos], [idarea]) VALUES (1, N'Programación II', N'4139 ', 6, 1)
INSERT [dbo].[Materia] ([idmateria], [nombre], [nrc], [creditos], [idarea]) VALUES (2, N'Fundamentos de Programación', N'4041 ', 8, 1)
SET IDENTITY_INSERT [dbo].[Materia] OFF
SET IDENTITY_INSERT [dbo].[Matricula] ON 

INSERT [dbo].[Matricula] ([idmatricula], [fecha], [costo], [estado], [tipo], [idalumno], [idmateria]) VALUES (1, CAST(N'2020-06-22T01:08:53.480' AS DateTime), CAST(0.00 AS Decimal(18, 2)), N'1', N'P', 1, 1)
INSERT [dbo].[Matricula] ([idmatricula], [fecha], [costo], [estado], [tipo], [idalumno], [idmateria]) VALUES (2, CAST(N'2020-06-22T01:09:07.550' AS DateTime), CAST(196.00 AS Decimal(18, 2)), N'1', N'T', 5, 2)
SET IDENTITY_INSERT [dbo].[Matricula] OFF
ALTER TABLE [dbo].[Calificacion]  WITH CHECK ADD  CONSTRAINT [FK_Calificacion_Matricula] FOREIGN KEY([idmatricula])
REFERENCES [dbo].[Matricula] ([idmatricula])
GO
ALTER TABLE [dbo].[Calificacion] CHECK CONSTRAINT [FK_Calificacion_Matricula]
GO
ALTER TABLE [dbo].[Materia]  WITH CHECK ADD  CONSTRAINT [FK_Materia_Area] FOREIGN KEY([idarea])
REFERENCES [dbo].[Area] ([idarea])
GO
ALTER TABLE [dbo].[Materia] CHECK CONSTRAINT [FK_Materia_Area]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_Alumno] FOREIGN KEY([idalumno])
REFERENCES [dbo].[Alumno] ([idalumno])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_Alumno]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_Materia] FOREIGN KEY([idmateria])
REFERENCES [dbo].[Materia] ([idmateria])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_Materia]
GO
USE [master]
GO
ALTER DATABASE [DBESCOLASTICO] SET  READ_WRITE 
GO
