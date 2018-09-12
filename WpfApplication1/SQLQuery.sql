

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
INSERT INTO [dbo].[Stock] ([ID], [name], [price], [kod]) VALUES (6, N'Чипсы', CAST(40.00 AS Decimal(18, 2)), N'5')
SET IDENTITY_INSERT [dbo].[Stock] OFF


