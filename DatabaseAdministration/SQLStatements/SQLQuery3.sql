USE [OurFirstDatabase]
GO

INSERT INTO [dbo].[personalinfo]
           ([firstName]
           ,[lastName]
           ,[dob]
           ,[ID])
     VALUES
           ('Mehul'
           ,'Patel'
           ,'02/12/2001'
           ,777)
GO

select *from  [dbo].[personalinfo]
GO
