USE Master;
GO
CREATE MASTER KEY ENCRYPTION
BY PASSWORD= 'your password';
GO



USE MASTER
GO
CREATE CERTIFICATE tdeCert WITH SUBJECT = 'IDE Certificate';

USE MASTER
GO
SELECT name, pvt_key_encryption_type_desc FROM sys.certificates
WHERE name = 'tdeCert'

BACKUP CERTIFICATE tdeCert TO FILE='C:\LABMSSQLEncryptionCert.certbak'
WITH PRIVATE KEY(
FILE='C: \LABMSSQLEncryptionCert.	pkbak',
ENCRYPTION BY PASSWORD='your password')

USE [OurFirstDatabase]
GO
CREATE DATABASE ENCRYPTION KEY
 WITH ALGORITHM = AES_128
 ENCRYPTION BY SERVER CERTIFICATE tdeCert

 ALTER DATABASE OurFirstDatabase SET ENCRYPTION OBJECT_DEFINITION

 USE MASTER
 GO 
 SELECT name, is_encrypted FROM sys.databases 




 USE Master;
 GO 
 CREATE MASTER KEY ENCRYPTION 
 BY PASSWORD= 'Abb@s123'
 GO 


 CREATE CERTIFICATE tdeCert
 FROM FILE = 'C: \LABMSSQLEncryptionCert.certbak'
 WITH PRIVATE KEY FILE = 'C: \LABMSSQLEncryptionCert.certbak',
 DECRYPTION BY PASSWORD = 'Abb@s123@Abb@s123');
GO 



USE [master]
RESTORE DATABASE [ OurFirstDatabase] FROM DISK = N'C:\SQL_BACKUPS\OurFirstDatabase.bak' WITH FILE = 2, NOUNLOAD, REPLACE, STATS = 5

GO 




ALTER DATABASE [OurFirstDatabase] SET ENCRYPTION OFF
ALGORITHM
DROP DATABASE ENCRYPTION KEY 

USE master_recoveryGo
DROP CERTIFICATE tdeCert;
Go 


USE master
Go 
DROP MASTER KEY;


SELECT DB_NAME(database_id) AS DatabaseName, encryption_state,
encryption_state_desc =
CASE encryption_state
      WHEN '0' THEN 'No database encryption key present, no encryption'

      WHEN '1' THEN 'Unencrypted'

      WHEN '2' THEN 'Encryption in progress'

      WHEN '3' THEN 'Encrypted'

      WHEN '4' THEN 'Key change in progress'

      WHEN '5' THEN 'Decryption in progress'

      WHEN '6' THEN 'Protection change in progress (The certificate or asymmetric key that is encrypting the database encryption key is being changed.)'

      ELSE 'No Status'

      END,

      percent_completet,encryptor_thumbprint, encrypter_type FROM sys.dm_database_encryption_keys
