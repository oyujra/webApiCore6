/*
 Navicat Premium Data Transfer

 Source Server         : locahost
 Source Server Type    : SQL Server
 Source Server Version : 16001000 (16.00.1000)
 Source Host           : .:1433
 Source Catalog        : Test
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 16001000 (16.00.1000)
 File Encoding         : 65001

 Date: 15/12/2023 08:57:15
*/


-- ----------------------------
-- Table structure for Categoria
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Categoria]') AND type IN ('U'))
	DROP TABLE [dbo].[Categoria]
GO

CREATE TABLE [dbo].[Categoria] (
  [IDCategoria] int  IDENTITY(1,1) NOT NULL,
  [Codigo] varchar(50) COLLATE Modern_Spanish_CI_AS  NULL,
  [Nombre] varchar(50) COLLATE Modern_Spanish_CI_AS  NULL,
  [Estado] bit  NULL
)
GO

ALTER TABLE [dbo].[Categoria] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Categoria
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Categoria] ON
GO

INSERT INTO [dbo].[Categoria] ([IDCategoria], [Codigo], [Nombre], [Estado]) VALUES (N'1', N'TEC', N'TECLADO', N'1')
GO

INSERT INTO [dbo].[Categoria] ([IDCategoria], [Codigo], [Nombre], [Estado]) VALUES (N'2', N'MOU', N'MOUSE', N'1')
GO

INSERT INTO [dbo].[Categoria] ([IDCategoria], [Codigo], [Nombre], [Estado]) VALUES (N'3', N'COM', N'COMPUTADORA', N'1')
GO

SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO


-- ----------------------------
-- Table structure for Producto
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto]') AND type IN ('U'))
	DROP TABLE [dbo].[Producto]
GO

CREATE TABLE [dbo].[Producto] (
  [IDProducto] int  IDENTITY(1,1) NOT NULL,
  [IDCategoria] int  NULL,
  [Nombre] varchar(50) COLLATE Modern_Spanish_CI_AS  NULL,
  [Precio] decimal(18,2)  NULL
)
GO

ALTER TABLE [dbo].[Producto] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Producto
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Producto] ON
GO

INSERT INTO [dbo].[Producto] ([IDProducto], [IDCategoria], [Nombre], [Precio]) VALUES (N'1', N'1', N'TECLADO XYZ', N'35.00')
GO

INSERT INTO [dbo].[Producto] ([IDProducto], [IDCategoria], [Nombre], [Precio]) VALUES (N'2', N'2', N'MOUSE PHP 254', N'75.00')
GO

INSERT INTO [dbo].[Producto] ([IDProducto], [IDCategoria], [Nombre], [Precio]) VALUES (N'3', N'3', N'PC GAMER XYZ', N'2546.00')
GO

INSERT INTO [dbo].[Producto] ([IDProducto], [IDCategoria], [Nombre], [Precio]) VALUES (N'4', N'2', N'PC 2023', N'12.78')
GO

SET IDENTITY_INSERT [dbo].[Producto] OFF
GO


-- ----------------------------
-- procedure structure for Categoria_Listar
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Categoria_Listar]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Categoria_Listar]
GO

CREATE PROCEDURE [dbo].[Categoria_Listar]
(
	@Estado int
)
as
begin
	select *
	from Categoria
	where Estado = @Estado
end
GO


-- ----------------------------
-- procedure structure for Producto_Listar
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_Listar]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Producto_Listar]
GO

CREATE PROCEDURE [dbo].[Producto_Listar]
as
begin
	select *
	from Producto
end
GO


-- ----------------------------
-- procedure structure for Producto_Agregar
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Producto_Agregar]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[Producto_Agregar]
GO

CREATE PROCEDURE [dbo].[Producto_Agregar]
(
@IDCategoria int,
@Nombre VARCHAR(60),
@Precio DECIMAL(18,2)

)
as
begin
	INSERT INTO [dbo].Producto(
	IDCategoria,
	Nombre,
	Precio
	) VALUES (
	@IDCategoria,
	@Nombre,
	@Precio
	)
end
GO


-- ----------------------------
-- Auto increment value for Categoria
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Categoria]', RESEED, 3)
GO


-- ----------------------------
-- Primary Key structure for table Categoria
-- ----------------------------
ALTER TABLE [dbo].[Categoria] ADD CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED ([IDCategoria])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for Producto
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Producto]', RESEED, 4)
GO


-- ----------------------------
-- Primary Key structure for table Producto
-- ----------------------------
ALTER TABLE [dbo].[Producto] ADD CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED ([IDProducto])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

