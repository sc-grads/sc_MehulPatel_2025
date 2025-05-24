--Even bigger savings of time when using a SARG
-- Select EmployeeNumber and Amount from tblEmployee joined with tblTransaction on EmployeeNumber
-- Filtered by EmployeeNumber = 134, which is a SARG (Search ARGument) that can use indexes efficiently
select E.EmployeeNumber, T.Amount
from [dbo].[tblEmployee] as E
left join [dbo].[tblTransaction] as T
on E.EmployeeNumber = T.EmployeeNumber
where E.EmployeeNumber = 134

-- Same query as above but using tables without indexes (tblEmployeeNoIndex, tblTransactionNoIndex)
-- Performance will be worse because no indexes are available to seek the EmployeeNumber filter
select E.EmployeeNumber, T.Amount
from [dbo].[tblEmployeeNoIndex] as E
left join [dbo].[tblTransactionNoIndex] as T
on E.EmployeeNumber = T.EmployeeNumber
where E.EmployeeNumber = 134

-- Query where the filter uses a calculation (E.EmployeeNumber / 10 = 34)
-- This is NOT a SARG because the function on the column prevents efficient index seek usage
select E.EmployeeNumber, T.Amount
from [dbo].[tblEmployee] as E
left join [dbo].[tblTransaction] as T
on E.EmployeeNumber = T.EmployeeNumber
where E.EmployeeNumber / 10 = 34 --Not SARG

-- Query using a range filter (between 340 and 349) on EmployeeNumber
-- This is a SARG and can efficiently use indexes for seeking a range of values
select E.EmployeeNumber, T.Amount
from [dbo].[tblEmployee] as E
left join [dbo].[tblTransaction] as T
on E.EmployeeNumber = T.EmployeeNumber
where E.EmployeeNumber between 340 and 349 –SARG
