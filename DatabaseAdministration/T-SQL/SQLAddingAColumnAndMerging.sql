BEGIN TRAN

ALTER TABLE tblTransaction
ADD Comments varchar(50) NULL
-- Adds a new nullable column 'Comments' of type varchar(50) to tblTransaction table
GO -- DDL (Data Definition Language) batch separator

MERGE TOP (5) PERCENT INTO tblTransaction as T
-- Performs a MERGE operation on tblTransaction alias 'T'
-- Only processes the top 5 percent of rows (performance control or sampling)

USING (
    select EmployeeNumber, DateOfTransaction, sum(Amount) as Amount
    from tblTransactionNew
    group by EmployeeNumber, DateOfTransaction
) as S
-- Uses a derived table 'S' which aggregates data from tblTransactionNew
-- It groups by EmployeeNumber and DateOfTransaction and sums the Amounts

ON T.EmployeeNumber = S.EmployeeNumber AND T.DateOfTransaction = S.DateOfTransaction
-- Specifies the matching condition for MERGE: match rows based on EmployeeNumber and DateOfTransaction

WHEN MATCHED AND T.Amount + S.Amount > 0 THEN
    UPDATE SET Amount = T.Amount + S.Amount, Comments = 'Updated Row'
-- If a matching row is found and the sum of amounts is greater than zero,
-- update the Amount by adding the source Amount and set Comments to 'Updated Row'

WHEN MATCHED THEN
    DELETE
-- If a matching row is found but the condition above (Amount + S.Amount > 0) is false,
-- delete the target row from tblTransaction

WHEN NOT MATCHED BY TARGET THEN
    INSERT ([Amount], [DateOfTransaction], [EmployeeNumber], Comments)
    VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber, 'Inserted Row')
-- If a source row does not have a matching target row,
-- insert a new row into tblTransaction with values from source and set Comments to 'Inserted Row'

WHEN NOT MATCHED BY SOURCE THEN
    UPDATE SET Comments = 'Unchanged'
-- If a target row does not have a matching source row,
-- update Comments to 'Unchanged' to indicate this row wasn't affected by the source data

OUTPUT inserted.*, deleted.* , $action;
-- Output the results of the MERGE operation showing the inserted, deleted rows and the action performed

-- Select * from tblTransaction ORDER BY EmployeeNumber, DateOfTransaction
-- (Commented out) This would select and show all rows from tblTransaction ordered by EmployeeNumber and DateOfTransaction

ROLLBACK TRAN
-- Rolls back the entire transaction, undoing all changes made above
-- Useful for testing without committing changes permanently
