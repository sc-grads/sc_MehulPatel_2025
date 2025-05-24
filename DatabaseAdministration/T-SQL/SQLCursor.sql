-- Declare a variable to hold the EmployeeNumber fetched from the cursor
declare @EmployeeID int

-- Declare a cursor named 'csr' to iterate over EmployeeNumbers in the specified range
declare csr CURSOR FOR
select EmployeeNumber
from [dbo].[tblEmployee]
where EmployeeNumber between 120 and 299

-- Open the cursor to start fetching rows
open csr

-- Fetch the first EmployeeNumber from the cursor into @EmployeeID
fetch next from csr into @EmployeeID

-- Loop while the fetch was successful (0 means success)
while @@FETCH_STATUS = 0
begin
    -- For the current EmployeeNumber, select all matching rows from tblTransaction
    select * from [dbo].[tblTransaction] where EmployeeNumber = @EmployeeID
    
    -- Fetch the next EmployeeNumber from the cursor
    fetch next from csr into @EmployeeID
end

-- Close the cursor to release resources
close csr

-- Deallocate the cursor to completely remove it from memory
deallocate csr
