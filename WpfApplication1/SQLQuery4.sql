--CREATE TABLE [dbo].[Purchase] (
--    [ID]     INT           IDENTITY (1, 1) NOT NULL,
--    [Name]   NVARCHAR (50) NULL,   
--    [Price] DECIMAL (18, 2) NULL,
--    [Kod]    NVARCHAR (50) NULL					     
--);
--SET IDENTITY_INSERT [dbo].[Purchase] ON
--INSERT INTO [dbo].[Purchase] ([ID], [Name], [Price], [Kod]) VALUES (2, N'Пироженное', CAST(10.00 AS Decimal(18, 2)), N'4')
--INSERT INTO [dbo].[Purchase] ([ID], [Name], [Price], [Kod]) VALUES (3, N'Печенье', CAST(30.00 AS Decimal(18, 2)), N'3')
--INSERT INTO [dbo].[Purchase] ([ID], [Name], [Price], [Kod]) VALUES (4, N'Пиво', CAST(100.00 AS Decimal(18, 2)), N'1')
--INSERT INTO [dbo].[Purchase] ([ID], [Name], [Price], [Kod]) VALUES (5, N'Мороженное детское', CAST(20.00 AS Decimal(18, 2)), N'2')
--INSERT INTO [dbo].[Purchase] ([ID], [Name], [Price], [Kod]) VALUES (6, N'Пироженное', CAST(10.00 AS Decimal(18, 2)), N'4')
--INSERT INTO [dbo].[Purchase] ([ID], [Name], [Price], [Kod]) VALUES (7, N'Мороженное детское', CAST(20.00 AS Decimal(18, 2)), N'2')
--INSERT INTO [dbo].[Purchase] ([ID], [Name], [Price], [Kod]) VALUES (8, N'Пиво', CAST(100.00 AS Decimal(18, 2)), N'1')
--INSERT INTO [dbo].[Purchase] ([ID], [Name], [Price], [Kod]) VALUES (9, N'Пиво', CAST(100.00 AS Decimal(18, 2)), N'1')
--SET IDENTITY_INSERT [dbo].[Purchase] OFF


GO
CREATE TABLE [dbo].[Stock]
(
	[ID] int IDENTITY(1,1) PRIMARY KEY, 
    [name] NVARCHAR(50) NULL,    
    [price] DECIMAL(18, 2) NULL,
    [kod] NVARCHAR(50) NULL 

)

GO

SET IDENTITY_INSERT [dbo].[Stock] ON
INSERT INTO [dbo].[Stock] ([ID], [name], [price], [kod]) VALUES (1, N'Пиво', CAST(100.00 AS Decimal(18, 2)), N'1')
INSERT INTO [dbo].[Stock] ([ID], [name], [price], [kod]) VALUES (2, N'Пироженное', CAST(10.00 AS Decimal(18, 2)), N'4')
INSERT INTO [dbo].[Stock] ([ID], [name], [price], [kod]) VALUES (3, N'Мороженное', CAST(50.00 AS Decimal(18, 2)), N'2')
INSERT INTO [dbo].[Stock] ([ID], [name], [price], [kod]) VALUES (4, N'Печенье', CAST(30.00 AS Decimal(18, 2)), N'3')
INSERT INTO [dbo].[Stock] ([ID], [name], [price], [kod]) VALUES (5, N'Пиво', CAST(80.00 AS Decimal(18, 2)), N'4')
SET IDENTITY_INSERT [dbo].[Stock] OFF

