SELECT * FROM sys.dm_db_index_physical_stats
(
  DB_ID(N'70-461'),         -- Database ID for the database named '70-461'
  OBJECT_ID(N'dbo.tblEmployee'), -- Object ID for the table 'dbo.tblEmployee'
  NULL,                    -- Index ID; NULL means all indexes on the object
  NULL,                    -- Partition number; NULL means all partitions
  'DETAILED'               -- Scan mode; 'DETAILED' means perform a detailed scan for fragmentation info
);


SELECT * FROM 
SYS.dm_db_index_physical_stats(NULL, NULL, NULL,NULL, 'DETAILED')