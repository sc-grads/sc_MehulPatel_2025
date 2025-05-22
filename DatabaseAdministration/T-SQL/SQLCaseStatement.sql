-- Declare a variable named @myOption of type varchar with max length 10
-- and assign it the value 'Option C'
declare @myOption as varchar(10) = 'Option C'

-- Select a column named MyOptions based on conditions using CASE expression
select 
    case 
        when @myOption = 'Option A' then 'First option'  -- If @myOption equals 'Option A', return 'First option'
        when @myOption = 'Option B' then 'Second option' -- If @myOption equals 'Option B', return 'Second option'
        --else 'No Option'  -- If neither, return 'No Option' (currently commented out)
    END as MyOptions
go  -- Signal end of batch in SQL Server

-- Declare the same variable again, but this time assign 'Option A'
declare @myOption as varchar(10) = 'Option A'

-- Another CASE expression but using a simpler syntax 
-- directly comparing @myOption value to each case
select 
    case @myOption 
        when 'Option A' then 'First option'   -- If @myOption equals 'Option A', return 'First option'
        when 'Option B' then 'Second option'  -- If @myOption equals 'Option B', return 'Second option'
        else 'No Option'                      -- Otherwise, return 'No Option'
    END as MyOptions
go  -- End of batch



declare @myOption as varchar(10) = 'Option A'

select 
    case @myOption 
        when 'Option A' then 'First option'   -- If @myOption equals 'Option A', return 'First option'
        when 'Option B' then 2  -- If @myOption equals 'Option B', return 'Second option'
        else 'No Option'                      -- Otherwise, return 'No Option'
    END as MyOptions
go  -- End of batch


declare @myOption as varchar(10) = 'Option A'

-- Another CASE expression but using a simpler syntax 
-- directly comparing @myOption value to each case
select 
    case @myOption 
        when 'Option A' then 2  -- If @myOption equals 'Option A', return 'First option'
        when 'Option B' then 'Second option'  -- If @myOption equals 'Option B', return 'Second option'
        else 'No Option'                      -- Otherwise, return 'No Option'
    END as MyOptions
go  -- End of batch