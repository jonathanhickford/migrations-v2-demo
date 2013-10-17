CREATE TABLE [dbo].[Customers]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customers] ADD CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED  ([id]) ON [PRIMARY]
GO
