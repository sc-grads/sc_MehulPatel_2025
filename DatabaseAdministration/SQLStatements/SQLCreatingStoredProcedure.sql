USE [AdventureWorks2022]
GO
/****** Object:  StoredProcedure [dbo].[SelectAllPersonAddressWithParams]    Script Date: 2025/04/29 17:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[SelectAllPersonAddressWithParams] (@city nvarchar(30)= 'New York',@stateprovinceid int)
As

--begin
Set nocount on

select * from person.address where city=@city;
--end

