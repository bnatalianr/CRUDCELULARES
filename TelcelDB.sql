USE [TelcelDB]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 05/22/2019 18:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[Nombre] [varchar](30) NOT NULL,
	[Contraseña] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Usuario] ([Nombre], [Contraseña]) VALUES (N'david', N'12456')
INSERT [dbo].[Usuario] ([Nombre], [Contraseña]) VALUES (N'Jonathan', N'123')
INSERT [dbo].[Usuario] ([Nombre], [Contraseña]) VALUES (N'natalia', N'brenda')
/****** Object:  Table [dbo].[Telefono]    Script Date: 05/22/2019 18:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Telefono](
	[Id] [int] IDENTITY(1000,1) NOT NULL,
	[Nombre] [nvarchar](max) NULL,
	[Compania] [char](30) NULL,
	[Fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Telefono] ON
INSERT [dbo].[Telefono] ([Id], [Nombre], [Compania], [Fecha]) VALUES (1001, N'Brenda', N'Telcel                        ', CAST(0x0000AAC600000000 AS DateTime))
INSERT [dbo].[Telefono] ([Id], [Nombre], [Compania], [Fecha]) VALUES (1002, N'Sonia', N'Telcel                        ', CAST(0x0000AAC600000000 AS DateTime))
INSERT [dbo].[Telefono] ([Id], [Nombre], [Compania], [Fecha]) VALUES (1003, N'Jonathan', N'Telcel                        ', CAST(0x0000AAC600499CEC AS DateTime))
INSERT [dbo].[Telefono] ([Id], [Nombre], [Compania], [Fecha]) VALUES (1004, N'natalia', N'Telcel                        ', CAST(0x0000A7EC00000000 AS DateTime))
INSERT [dbo].[Telefono] ([Id], [Nombre], [Compania], [Fecha]) VALUES (1006, N'karen', N'Telcel                        ', CAST(0x0000AAC60082E498 AS DateTime))
INSERT [dbo].[Telefono] ([Id], [Nombre], [Compania], [Fecha]) VALUES (1009, N'Gabirela', N'AT&T                          ', CAST(0x0000AAE400000000 AS DateTime))
INSERT [dbo].[Telefono] ([Id], [Nombre], [Compania], [Fecha]) VALUES (1010, N'Zaira Denise Espinoza Urbina', N'Movistar                      ', CAST(0x0000B05C00000000 AS DateTime))
INSERT [dbo].[Telefono] ([Id], [Nombre], [Compania], [Fecha]) VALUES (1012, N'jusn', N'patito                        ', CAST(0x0000AAC600000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Telefono] OFF
/****** Object:  Table [dbo].[Telcel]    Script Date: 05/22/2019 18:03:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Telcel](
	[Id] [int] IDENTITY(1000,1) NOT NULL,
	[NombreUsuario] [varchar](30) NULL,
	[IdTelefono] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Telcel] ON
INSERT [dbo].[Telcel] ([Id], [NombreUsuario], [IdTelefono]) VALUES (1000, N'natalia', 1001)
INSERT [dbo].[Telcel] ([Id], [NombreUsuario], [IdTelefono]) VALUES (1001, N'natalia', 1001)
SET IDENTITY_INSERT [dbo].[Telcel] OFF
/****** Object:  ForeignKey [FK__Telcel__IdTelefo__09DE7BCC]    Script Date: 05/22/2019 18:03:17 ******/
ALTER TABLE [dbo].[Telcel]  WITH CHECK ADD FOREIGN KEY([IdTelefono])
REFERENCES [dbo].[Telefono] ([Id])
GO
/****** Object:  ForeignKey [FK__Telcel__NombreUs__08EA5793]    Script Date: 05/22/2019 18:03:17 ******/
ALTER TABLE [dbo].[Telcel]  WITH CHECK ADD FOREIGN KEY([NombreUsuario])
REFERENCES [dbo].[Usuario] ([Nombre])
GO
