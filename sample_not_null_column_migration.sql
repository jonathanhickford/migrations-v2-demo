DECLARE @ShouldRunMigrationScript BIT
SET @ShouldRunMigrationScript = 1
IF NOT EXISTS (SELECT 1 FROM Information_Schema.Columns WHERE table_schema = 'dbo' AND TABLE_NAME = 'People' AND COLUMN_NAME='name')
BEGIN
     SET @ShouldRunMigrationScript = 0;
     PRINT 'Column [name] in [dbo].[People] could not be found - skipping migration.';
END
IF @ShouldRunMigrationScript = 1
BEGIN
UPDATE  [dbo].[People] SET [name] = 'unknown name' WHERE [name] IS NULL;
ALTER TABLE [dbo].[People] ALTER COLUMN [name] NVARCHAR(50) NOT NULL;
END
