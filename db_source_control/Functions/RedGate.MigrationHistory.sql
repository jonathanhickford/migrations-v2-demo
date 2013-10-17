SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [RedGate].[MigrationHistory] ()
RETURNS @Tbl TABLE (PropertyKey VARCHAR(30) UNIQUE, PropertyValue NVARCHAR(MAX))
AS 
BEGIN
    
INSERT  @Tbl  VALUES  ('MigrationHistory' , N'[
  {
    "UpScript": "DECLARE @ShouldRunMigrationScript BIT\r\nSET @ShouldRunMigrationScript = 1\r\nIF NOT EXISTS (SELECT 1 FROM [information_schema].[Tables] WHERE table_schema = ''dbo'' AND TABLE_NAME = ''People'')\r\nBEGIN\r\n     SET @ShouldRunMigrationScript = 0;\r\n     PRINT ''Object ''''[dbo].[People]'''' could not be found - skipping migration.'';\r\nEND\r\n\r\nIF @ShouldRunMigrationScript = 1\r\nBEGIN\r\nEXEC sp_rename ''[dbo].[People]'', ''Customers''\r\nEND\r\n",
    "DownScript": null,
    "Name": "Rename [dbo].[People] to [dbo].[Customers]",
    "UniqueId": "16ca323b-9663-4d1c-b8b2-8c770f97399a",
    "Timestamp": "2013-10-17T13:42:27",
    "Order": 0,
    "Description": "Renames the table ''People'' to ''Customers'' using sp_rename."
  }
]')
    RETURN
END
GO
