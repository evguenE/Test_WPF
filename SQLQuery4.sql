CREATE TABLE Purchase(
    ID int,
    Name nvarchar(255),
    Count nvarchar(255),
    Price nvarchar(255),    
);

GO
INSERT INTO [dbo].[Purchase] ([id], [name], [count], [price]) VALUES (1, N'Мороженное', N'2', N'30')
INSERT INTO [dbo].[Purchase] ([id], [name], [count], [price]) VALUES (2, N'Пироженное', N'3', N'40')
INSERT INTO [dbo].[Purchase] ([id], [name], [count], [price]) VALUES (3, N'Печенье', N'1', N'70')