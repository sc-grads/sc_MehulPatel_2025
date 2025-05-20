SELECT TOP (1000) [EmpID]
      ,[EmpName]
      ,[EmpTitle]
  FROM [AdventureWorks2022].[dbo].[Employee]

  CREATE TRIGGER EmployeeInsert
   ON  Employee --specifies the table on which the trigger operates, the trigger will fire when something happens to this table
   AFTER INSERT --trigger will run after a new role is inserted.
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	insert into EmployeeTriggerHistory values ((select max(Empid) from employee),'insert')
END
GO

select * from EmployeeTriggerHistory
