USE [master]
GO
CREATE DATABASE UDEMYTEST1
GO
USE [UDEMYTEST1]
GO
/****** Object:  Table [dbo].[Cursos]    Script Date: 2024/11/12 9:49:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursos](
	[IDCurso] [int] NOT NULL,
	[NombreCurso] [nvarchar](255) NOT NULL,
	[Descripcion] [nvarchar](500) NULL,
	[PrecioxHora] [money] NOT NULL,
	[TipoCurso] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiantes]    Script Date: 2024/11/12 9:49:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiantes](
	[IDEstudiante] [int] NOT NULL,
	[NombreEstudiante] [nvarchar](100) NOT NULL,
	[ApellidoEstudiante] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Telefono] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDEstudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matriculas]    Script Date: 2024/11/12 9:49:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matriculas](
	[IDMatricula] [int] NOT NULL,
	[IDEstudiante] [int] NULL,
	[IDCurso] [int] NULL,
	[NumeroHoras] [int] NULL,
	[ValorTotal] [money] NOT NULL,
	[FechaMatricula] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDMatricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cursos] ([IDCurso], [NombreCurso], [Descripcion], [PrecioxHora], [TipoCurso]) VALUES (1, N'Introducción a SQL', N'Curso básico sobre SQL', 10.0000, N'Presencial')
INSERT [dbo].[Cursos] ([IDCurso], [NombreCurso], [Descripcion], [PrecioxHora], [TipoCurso]) VALUES (2, N'Programación en Python', N'Curso avanzado de Python', 20.0000, N'Virtual')
INSERT [dbo].[Cursos] ([IDCurso], [NombreCurso], [Descripcion], [PrecioxHora], [TipoCurso]) VALUES (3, N'Introduccion JSON', N'Curso Básico JSON', 5.0000, N'Virtual')
GO
INSERT [dbo].[Estudiantes] ([IDEstudiante], [NombreEstudiante], [ApellidoEstudiante], [Email], [Telefono]) VALUES (1, N'Ana', N'Garcia', N'anag@email.com', N'593-123-4567')
INSERT [dbo].[Estudiantes] ([IDEstudiante], [NombreEstudiante], [ApellidoEstudiante], [Email], [Telefono]) VALUES (2, N'Carlos', N'Perez', N'carlosp@email.com', N'593-987-6543')
INSERT [dbo].[Estudiantes] ([IDEstudiante], [NombreEstudiante], [ApellidoEstudiante], [Email], [Telefono]) VALUES (3, N'Alejandra', N'Orozco', N'alejandrao@email.com', N'593-987-6543')
GO
INSERT [dbo].[Matriculas] ([IDMatricula], [IDEstudiante], [IDCurso], [NumeroHoras], [ValorTotal], [FechaMatricula]) VALUES (1, 1, 1, 20, 200.0000, CAST(N'2024-04-15' AS Date))
INSERT [dbo].[Matriculas] ([IDMatricula], [IDEstudiante], [IDCurso], [NumeroHoras], [ValorTotal], [FechaMatricula]) VALUES (2, 2, 2, 20, 400.0000, CAST(N'2024-04-20' AS Date))
INSERT [dbo].[Matriculas] ([IDMatricula], [IDEstudiante], [IDCurso], [NumeroHoras], [ValorTotal], [FechaMatricula]) VALUES (3, 3, 1, 10, 100.0000, CAST(N'2024-04-20' AS Date))
INSERT [dbo].[Matriculas] ([IDMatricula], [IDEstudiante], [IDCurso], [NumeroHoras], [ValorTotal], [FechaMatricula]) VALUES (4, 3, 2, 20, 400.0000, CAST(N'2024-04-21' AS Date))
INSERT [dbo].[Matriculas] ([IDMatricula], [IDEstudiante], [IDCurso], [NumeroHoras], [ValorTotal], [FechaMatricula]) VALUES (5, 3, 3, 10, 50.0000, CAST(N'2024-04-22' AS Date))
GO
ALTER TABLE [dbo].[Matriculas]  WITH CHECK ADD  CONSTRAINT [FK_MATRICULAS_CURSOS] FOREIGN KEY([IDCurso])
REFERENCES [dbo].[Cursos] ([IDCurso])
GO
ALTER TABLE [dbo].[Matriculas] CHECK CONSTRAINT [FK_MATRICULAS_CURSOS]
GO
ALTER TABLE [dbo].[Matriculas]  WITH CHECK ADD  CONSTRAINT [FK_MATRICULAS_ESTUDIANTE] FOREIGN KEY([IDEstudiante])
REFERENCES [dbo].[Estudiantes] ([IDEstudiante])
GO
ALTER TABLE [dbo].[Matriculas] CHECK CONSTRAINT [FK_MATRICULAS_ESTUDIANTE]
GO
/****** Object:  StoredProcedure [dbo].[uspBuscarPersona]    Script Date: 2024/11/12 9:49:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspBuscarPersona]
 --@NombrePersona nvarchar(15)
 AS
 BEGIN
	 SELECT 
	ppe.businessEntityId,ppe.firstName,ppe.LastName
	 FROM person.person AS ppe
	 -- WHERE ppe.LastName=@NombrePersona
	 PRINT 'Proceso Terminado Con Exito'
 END
GO
USE [master]
GO
ALTER DATABASE [UDEMYTEST] SET  READ_WRITE 
GO
