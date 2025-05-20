/*-----------------------
CREATE EMPTY AdventureWorks2022_RestoreTest
-----------------------*/
 
USE [master]
GO
---------------------------------------------------------
 
CREATE DATABASE [AdventureWorks2022_RestoreTest]
CONTAINMENT = NONE
ON  PRIMARY 
( NAME = N'AdventureWorks2022_RestoreTest_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022.mdf' , SIZE = 228992KB , MAXSIZE = UNLIMITED, FILEGROWTH = 16384KB )
LOG ON 
( NAME = N'AdventureWorks2022_RestoreTest_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022.ldf' , SIZE = 18432KB , MAXSIZE = 2048GB , FILEGROWTH = 16384KB )
GO
 
ALTER DATABASE [AdventureWorks2022_RestoreTest] SET  READ_WRITE 
GO
 
 
/*-----------------------
BACKUP AdventureWorks2022 DATABASE
-----------------------*/
 
BACKUP DATABASE [AdventureWorks2022] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022.bak' WITH NOFORMAT, NOINIT,  
NAME = N'AdventureWorks2022-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
 
 
/*-----------------------
RESTORE AdventureWorks2022 AS AdventureWorks2022_RestoreTes DATABASE
-----------------------*/
 
BACKUP DATABASE [AdventureWorks2022_RestoreTest] TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\AdventureWorks2022.bak' WITH NOFORMAT, NOINIT,  
NAME = N'AdventureWorks2022-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO
