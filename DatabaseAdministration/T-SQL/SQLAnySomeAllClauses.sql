--Subquery – WHERE and ANY, SOME and ALL
-- 1. Using SOME (same as ANY): Returns records where EmployeeNumber matches at least one from the subquery
select * 
from tblTransaction as T  -- Select all records from tblTransaction, alias as T
Where EmployeeNumber = some  -- EmployeeNumber must match at least one value returned by the subquery
    (Select EmployeeNumber 
     from tblEmployee 
     where EmployeeLastName like 'y%')  -- Subquery returns EmployeeNumbers where last names start with 'y'
order by EmployeeNumber  -- Sort results by EmployeeNumber

-- 2. Using <> ANY: This is logically flawed for exclusion purposes, explained below
select * 
from tblTransaction as T  -- Select all records from tblTransaction
Where EmployeeNumber <> any  -- This will return TRUE if EmployeeNumber is not equal to at least one value in subquery
    (Select EmployeeNumber 
     from tblEmployee 
     where EmployeeLastName like 'y%')  -- Subquery returns EmployeeNumbers where last names start with 'y'
order by EmployeeNumber  -- Sort results by EmployeeNumber

-- 3. Using <> ALL: Proper way to exclude ALL matching EmployeeNumbers
select * 
from tblTransaction as T  -- Select all records from tblTransaction
Where EmployeeNumber <> all  -- EmployeeNumber must be different from every value in the subquery
    (Select EmployeeNumber 
     from tblEmployee 
     where EmployeeLastName like 'y%')  -- Subquery returns EmployeeNumbers with last names starting with 'y'
order by EmployeeNumber  -- Sort results by EmployeeNumber

-- 4. Using <= ALL: Only include EmployeeNumbers less than or equal to the minimum value from subquery
select * 
from tblTransaction as T  -- Select all records from tblTransaction
Where EmployeeNumber <= all  -- EmployeeNumber must be <= all values returned by the subquery
    (Select EmployeeNumber 
     from tblEmployee 
     where EmployeeLastName like 'y%')  -- Subquery returns EmployeeNumbers with last names starting with 'y'
order by EmployeeNumber  -- Sort results by EmployeeNumber

-- ? Explanation:
-- If subquery returns (126,127,128,129), this will include only EmployeeNumbers <= 126
-- i.e., EmployeeNumber must be <= the minimum value in the subquery


-- ? Explanation:
-- For EmployeeNumber = 126, with subquery (126,127,128,129):
-- 126 <> 126 is FALSE ? whole condition is FALSE
-- Only EmployeeNumbers not matching any value will be included


-- ? Explanation:
-- For EmployeeNumber = 126, with subquery returning (126,127,128,129):
-- 126 <> 127 is TRUE, so the condition is TRUE overall due to OR logic
-- This results in many unwanted rows being included


-- anything up to 126 AND
-- anything up to 127 AND
-- anything up to 128 AND
-- anything up to 129

-- ANY = anything up to 129
-- ALL = anything up to 126

-- any/some = OR
-- all = AND

-- 126 <> all(126,127,128,129)
-- 126<>126 AND 126<>127 AND 126<>128 AND 126<>129
-- FALSE    AND TRUE = FALSE

-- 126 <> any(126,127,128,129)
-- 126<>126 OR 126<>127 OR 126<>128 OR 126<>129
-- FALSE    OR TRUE = TRUE
