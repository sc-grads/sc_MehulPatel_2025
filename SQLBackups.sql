BACKUP DATABASE [FileGroupsDemoDatabase] FILEGROUP = N'FG_2019',  FILEGROUP = N'FG_2020' 
TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\FileGroupsDemoDatabase.bak'
WITH NOFORMAT, NOINIT,  NAME = N'FileGroupsDemoDatabase-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

--Dividing the backup into three different files of the same size.
BACKUP DATABASE AdventureWorks2022 TO DISK='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022_1.bak',
DISK='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022_2.bak',
DISK='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022_3.bak'

--creating a mirror backup
BACKUP DATABASE AdventureWorks2022 
TO DISK='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022_mirror.bak' with format

--differential backup 
BACKUP DATABASE [AdventureWorks2022] 
TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022_diff3.bak' 
WITH  DIFFERENTIAL , NOFORMAT, NOINIT,  NAME = N'AdventureWorks2022-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

--transaction log backup
BACKUP DATABASE [AdventureWorks2022] 
TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022_05.tm'
WITH NOFORMAT, NOINIT,  NAME = N'AdventureWorks2022-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO