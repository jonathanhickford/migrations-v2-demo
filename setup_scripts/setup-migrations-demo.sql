IF db_id('migrations-demo-uat') IS NULL
     CREATE DATABASE [migrations-demo-uat]
GO

IF db_id('migrations-demo-cli') IS NULL
     CREATE DATABASE [migrations-demo-cli]
GO

IF db_id('migrations-demo-dev') IS NULL
     CREATE DATABASE [migrations-demo-dev]
GO

USE [migrations-demo-uat]
IF OBJECT_ID('migrations-demo-uat.[People]', 'U') IS NULL
BEGIN
CREATE TABLE [dbo].[People](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
INSERT [dbo].[People] ([name]) VALUES (N'Alice');
INSERT [dbo].[People] ([name]) VALUES (NULL);
INSERT [dbo].[People] ([name]) VALUES (N'Eve');
END

USE [migrations-demo-cli]
IF OBJECT_ID('migrations-demo-cli.[People]', 'U') IS NULL
BEGIN
CREATE TABLE [dbo].[People](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
INSERT [dbo].[People] ([name]) VALUES (N'Alice');
INSERT [dbo].[People] ([name]) VALUES (NULL);
INSERT [dbo].[People] ([name]) VALUES (N'Eve');
END

USE [migrations-demo-dev]
IF OBJECT_ID('migrations-demo-dev.[People]', 'U') IS NULL
BEGIN
CREATE TABLE [dbo].[People](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
INSERT [dbo].[People] ([name]) VALUES (N'Alice');
INSERT [dbo].[People] ([name]) VALUES (NULL);
INSERT [dbo].[People] ([name]) VALUES (N'Eve');
END