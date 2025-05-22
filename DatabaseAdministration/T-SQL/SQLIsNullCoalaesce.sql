-- 1. Select all employees who do NOT have a middle name (it's NULL)
select * 
from tblEmployee 
where EmployeeMiddleName is null


-- 2. Declare a variable and use ISNULL to return a default if it's NULL
declare @myOption as varchar(10) = 'Option B'  -- set the variable to 'Option B'
select isnull(@myOption, 'No Option') as MyOptions  -- returns 'Option B' because it's not null
go  -- Ends the current batch of statements


-- 3. Declare two variables (left NULL) and use COALESCE to find the first non-null
declare @myFirstOption as varchar(10)   --= 'Option B'  -- declared but no value, so it's NULL
declare @mySecondOption as varchar(10)  -- also NULL

select coalesce(@myFirstOption, @mySecondOption, 'No option') as MyOptions
-- COALESCE will return the first non-null value from left to right
-- Since both variables are NULL, it returns 'No option'
go


-- 4. Use ISNULL and COALESCE with mixed data types (string and number)
select isnull('ABC', 1) as MyAnswer
-- Returns 'ABC' (not null). SQL may convert 1 to a string if needed.

select coalesce('ABC', 1) as MyOtherAnswer

go


-- 5. Test ISNULL and COALESCE when all values are NULL
select isnull(null, null) as MyAnswer
-- Returns NULL (nothing to return)

select coalesce(null, null) as MyOtherAnswer
-- Also returns NULL (no non-null values found)
go


-- 6. Create a sample table with one nullable column
create table tblExample
(
    myOption nvarchar(10) null  -- allows NULL values
)
go


-- 7. Insert one row with value 'Option A'
insert into tblExample (myOption)
values ('Option A')


-- 8. Use COALESCE to return 'No option' if myOption is NULL, and save to new table
select coalesce(myOption, 'No option') as MyOptions
into tblIsCoalesce  -- creates a new table from the result
from tblExample


-- 9. Do the same as above using a CASE statement instead of COALESCE
select 
    case 
        when myOption is not null then myOption  -- return myOption if it has a value
        else 'No option'  -- return 'No option' if it's NULL
    end as myOptions 
from tblExample


-- 10. Use ISNULL instead, and create another table from the result
select isnull(myOption, 'No option') as MyOptions
into tblIsNull  -- new table created with result
from tblExample
go


-- 11. Clean up: drop the sample tables
drop table tblExample
drop table tblIsCoalesce
drop table tblIsNull
