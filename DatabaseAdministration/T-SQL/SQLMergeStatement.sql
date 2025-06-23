
BEGIN TRAN


-- Step 1: Prepare the source data to make it safe for merging.
-- Sometimes, there might be multiple rows for the same employee on the same date.
-- To avoid errors during the MERGE, we group and sum them first.

SELECT 
    EmployeeNumber,             -- Group by EmployeeNumber
    DateOfTransaction,          -- And also by DateOfTransaction
    SUM(Amount) AS Amount       -- Sum all the amounts for that employee on that date
INTO #GroupedTransactions       -- Store the result into a temporary table called #GroupedTransactions
FROM tblTransactionNew          -- Source: the new incoming transactions
GROUP BY EmployeeNumber, DateOfTransaction;
-- ?? Now #GroupedTransactions contains one row per EmployeeNumber and DateOfTransaction

-- ?? Step 2: Perform the MERGE operation using the grouped data

MERGE INTO tblTransaction AS T
-- This is the table you want to update or insert into (called "Target").

USING #GroupedTransactions AS S
-- This is the cleaned-up data you're using to update or insert from (called "Source").

ON T.EmployeeNumber = S.EmployeeNumber 
   AND T.DateOfTransaction = S.DateOfTransaction
-- ?? Match rule: If an employee and date exist in both tables, they are considered a match.

WHEN MATCHED THEN
-- ? If a match is found (same employee and date):

    UPDATE SET T.Amount = T.Amount + S.Amount
    -- ?? Add the new amount to the existing amount in the target table.

WHEN NOT MATCHED BY TARGET THEN
-- ? If there is a row in the source (S) that doesn't exist in the target (T):

    INSERT ([Amount], [DateOfTransaction], [EmployeeNumber])
    -- ?? Insert a new record into the target table

    VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber);
    -- Use the values from the source table for the new row.

-- ?? Step 3: End the transaction with a rollback
-- Since this is for testing, we undo everything that happened above.

ROLLBACK TRAN;
-- ? Undo all changes made in the transaction.
-- Nothing will be saved to the database.

-- ? To actually save the changes in real use, replace this with:
-- COMMIT TRAN;
