/*

SELECT pr.principal_id, pr.name, pe.state_desc, pe.permission_name
FROM sys.server_principals pr INNER JOIN  sys.server_permission pe
ON pr.principal_id = pe.grantee_principal_id
WHERE pr.principal_id = SUSER_ID('LABMSSQL\winuser01')
OR pr.principal_id = SUSER_ID('sqluser01');

GRANT IMPERSONATE ANY LOGIN TO [LABMSSQL\winuser01], sqluser01
GO

CREATE SERVER ROLE devops;
GRANT ALTER ANY DATABASE TO devops;
ALTER SERVER ROLE devops ADD MEMBER [LABMSSQL\winuser01];
GO

SELECT pe.state_desc, pe.permission_name
FROM sys.server_principals pr INNER JOIN sys.server_permission pe  
ON pr.principal_id = pe.grantee_principal_id
WHERE pr.principal_id = SUSER_ID('devops');


SELECT rm.member_principal_id, pr.name
FROM sys.server_role_members rm INNER JOIN sys.server_principals pr  
ON rm.member_principal_id = pr.principal_id
WHERE rm.role_principal_id = SUSER_ID('devops');


USE [AdventureWorks2022]
GO
ALTER ROLE [dbdev] ADD MEMBER [LABMSSQL\winuser01]
GO
USE [AdventureWorks2022]
GO
ALTER ROLE [dbdev] ADD MEMBER [sqluser01]
GO



USE [AdventureWorks2022]
GO
CREATE USER [sqluser01] FOR LOGIN [sqluser01]
GO

SELECT pe.state_desc, pe.permission_name  FROM sys.database_principals pr INNER JOIN sys.datatbase_permissions pe
ON pr.principal_id = pe.grantee_principal_id WHERE pr.principal_id = USER_ID('sqluser01');

SELECT pe.state_desc, pe.permission_name  FROM sys.database_principals pr INNER JOIN sys.datatbase_permissions pe
ON pr.principal_id = pe.grantee_principal_id WHERE pr.principal_id = USER_ID('LABMSSQL\winuser01');

---------------------------------------------------------------------------------
Kindly note that I did not run these statements as I did nort create a new user on the laptop. I followed the video and took notes.

---------------------------------------------------------------------------------


  */