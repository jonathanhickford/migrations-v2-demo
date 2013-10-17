DECLARE @ShouldRunMigrationScript BIT
SET @ShouldRunMigrationScript = 1
IF NOT EXISTS (SELECT 1 FROM Information_Schema.Columns WHERE table_schema = 'dbo' AND TABLE_NAME = 'Table_1' AND COLUMN_NAME='name')
BEGIN
     SET @ShouldRunMigrationScript = 0;
     PRINT 'Column [name] in [dbo].[Table_1] could not be found - skipping migration.';
END
IF @ShouldRunMigrationScript = 1
BEGIN
UPDATE  [dbo].[Table_1] SET [name] = 'unknown name' WHERE [name] IS NULL;
ALTER TABLE [dbo].[Table_1] ALTER COLUMN [name] NVARCHAR(50) NOT NULL;
END
