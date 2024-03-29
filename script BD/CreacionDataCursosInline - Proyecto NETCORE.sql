USE [master]
GO
/****** Object:  Database [CursosOnline]    Script Date: 21/02/2024 6:20:12 p. m. ******/
CREATE DATABASE [CursosOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CursosOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CursosOnline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CursosOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CursosOnline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CursosOnline] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CursosOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CursosOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CursosOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CursosOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CursosOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CursosOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [CursosOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CursosOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CursosOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CursosOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CursosOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CursosOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CursosOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CursosOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CursosOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CursosOnline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CursosOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CursosOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CursosOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CursosOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CursosOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CursosOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CursosOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CursosOnline] SET RECOVERY FULL 
GO
ALTER DATABASE [CursosOnline] SET  MULTI_USER 
GO
ALTER DATABASE [CursosOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CursosOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CursosOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CursosOnline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CursosOnline] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CursosOnline] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CursosOnline', N'ON'
GO
ALTER DATABASE [CursosOnline] SET QUERY_STORE = OFF
GO
USE [CursosOnline]
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 21/02/2024 6:20:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentario](
	[ComentarioId] [int] IDENTITY(1,1) NOT NULL,
	[Alumno] [nvarchar](500) NULL,
	[Puntaje] [int] NULL,
	[DescripcionComentario] [nvarchar](max) NULL,
	[CursoId] [int] NULL,
 CONSTRAINT [PK_Comentario] PRIMARY KEY CLUSTERED 
(
	[ComentarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 21/02/2024 6:20:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[CursoId] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [nvarchar](500) NULL,
	[Descripcion] [nvarchar](1000) NULL,
	[FechaPublicacion] [datetime] NULL,
	[FotoPortada] [varbinary](max) NULL,
 CONSTRAINT [PK_Curso] PRIMARY KEY CLUSTERED 
(
	[CursoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CursoInstructor]    Script Date: 21/02/2024 6:20:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CursoInstructor](
	[CursoId] [int] NOT NULL,
	[InstructorId] [int] NOT NULL,
 CONSTRAINT [PK_CursoInstructor] PRIMARY KEY CLUSTERED 
(
	[CursoId] ASC,
	[InstructorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 21/02/2024 6:20:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[InstructorId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](200) NULL,
	[Apellido] [nvarchar](200) NULL,
	[Grado] [nvarchar](200) NULL,
	[FotoPerfil] [varbinary](max) NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[InstructorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Precio]    Script Date: 21/02/2024 6:20:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Precio](
	[PrecioId] [int] IDENTITY(1,1) NOT NULL,
	[PrecioActual] [decimal](12, 2) NULL,
	[Promocion] [decimal](12, 2) NULL,
	[CursoId] [int] NULL,
 CONSTRAINT [PK_Precio] PRIMARY KEY CLUSTERED 
(
	[PrecioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comentario] ON 

INSERT [dbo].[Comentario] ([ComentarioId], [Alumno], [Puntaje], [DescripcionComentario], [CursoId]) VALUES (1, N'Henry García Ospina', 4, N'Es interesante el curso.', 1)
INSERT [dbo].[Comentario] ([ComentarioId], [Alumno], [Puntaje], [DescripcionComentario], [CursoId]) VALUES (2, N'Pedro Pica Piedra', 4, N'Es un buen curso para empezar.', 1)
INSERT [dbo].[Comentario] ([ComentarioId], [Alumno], [Puntaje], [DescripcionComentario], [CursoId]) VALUES (3, N'Pablo Marmol', 5, N'Muy bien diseñado, se aprende bastante.', 2)
INSERT [dbo].[Comentario] ([ComentarioId], [Alumno], [Puntaje], [DescripcionComentario], [CursoId]) VALUES (4, N'Betty De Marmol', 5, N'Explicaciones claras y amenas.', 2)
SET IDENTITY_INSERT [dbo].[Comentario] OFF
GO
SET IDENTITY_INSERT [dbo].[Curso] ON 

INSERT [dbo].[Curso] ([CursoId], [Titulo], [Descripcion], [FechaPublicacion], [FotoPortada]) VALUES (1, N'ReactHooks Firebase', N'Curso de Programación de React', CAST(N'2020-02-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Curso] ([CursoId], [Titulo], [Descripcion], [FechaPublicacion], [FotoPortada]) VALUES (2, N'ASP.NET Core y React Hooks', N'Curso de .NET y JavaScript', CAST(N'2020-11-05T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Curso] OFF
GO
INSERT [dbo].[CursoInstructor] ([CursoId], [InstructorId]) VALUES (1, 1)
INSERT [dbo].[CursoInstructor] ([CursoId], [InstructorId]) VALUES (1, 2)
INSERT [dbo].[CursoInstructor] ([CursoId], [InstructorId]) VALUES (1, 3)
INSERT [dbo].[CursoInstructor] ([CursoId], [InstructorId]) VALUES (2, 1)
INSERT [dbo].[CursoInstructor] ([CursoId], [InstructorId]) VALUES (2, 4)
GO
SET IDENTITY_INSERT [dbo].[Instructor] ON 

INSERT [dbo].[Instructor] ([InstructorId], [Nombre], [Apellido], [Grado], [FotoPerfil]) VALUES (1, N'James', N'Gosling', N'Ingeniero en Ciencias de la Computación', NULL)
INSERT [dbo].[Instructor] ([InstructorId], [Nombre], [Apellido], [Grado], [FotoPerfil]) VALUES (2, N'Linus', N'Tolvalds', N'Ingeniero de Software', NULL)
INSERT [dbo].[Instructor] ([InstructorId], [Nombre], [Apellido], [Grado], [FotoPerfil]) VALUES (3, N'Anders', N'Hejlsberg', N'Arquitecto de Sistemas', NULL)
INSERT [dbo].[Instructor] ([InstructorId], [Nombre], [Apellido], [Grado], [FotoPerfil]) VALUES (4, N'Alan', N'Turing', N'Ingeniero en Ciencas de la Computación', NULL)
SET IDENTITY_INSERT [dbo].[Instructor] OFF
GO
SET IDENTITY_INSERT [dbo].[Precio] ON 

INSERT [dbo].[Precio] ([PrecioId], [PrecioActual], [Promocion], [CursoId]) VALUES (1, CAST(900.00 AS Decimal(12, 2)), CAST(750.00 AS Decimal(12, 2)), 1)
INSERT [dbo].[Precio] ([PrecioId], [PrecioActual], [Promocion], [CursoId]) VALUES (2, CAST(850.00 AS Decimal(12, 2)), CAST(650.00 AS Decimal(12, 2)), 2)
SET IDENTITY_INSERT [dbo].[Precio] OFF
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD  CONSTRAINT [FK_COMENTARIO_CURSO] FOREIGN KEY([CursoId])
REFERENCES [dbo].[Curso] ([CursoId])
GO
ALTER TABLE [dbo].[Comentario] CHECK CONSTRAINT [FK_COMENTARIO_CURSO]
GO
ALTER TABLE [dbo].[CursoInstructor]  WITH CHECK ADD  CONSTRAINT [FK_CURSO_INSTRUCTOR_CURSOID] FOREIGN KEY([CursoId])
REFERENCES [dbo].[Curso] ([CursoId])
GO
ALTER TABLE [dbo].[CursoInstructor] CHECK CONSTRAINT [FK_CURSO_INSTRUCTOR_CURSOID]
GO
ALTER TABLE [dbo].[CursoInstructor]  WITH CHECK ADD  CONSTRAINT [FK_CURSO_INSTRUCTOR_INSTRUCTORID] FOREIGN KEY([InstructorId])
REFERENCES [dbo].[Instructor] ([InstructorId])
GO
ALTER TABLE [dbo].[CursoInstructor] CHECK CONSTRAINT [FK_CURSO_INSTRUCTOR_INSTRUCTORID]
GO
ALTER TABLE [dbo].[Precio]  WITH CHECK ADD  CONSTRAINT [FK_PRECIO_CURSO] FOREIGN KEY([CursoId])
REFERENCES [dbo].[Curso] ([CursoId])
GO
ALTER TABLE [dbo].[Precio] CHECK CONSTRAINT [FK_PRECIO_CURSO]
GO
USE [master]
GO
ALTER DATABASE [CursosOnline] SET  READ_WRITE 
GO
