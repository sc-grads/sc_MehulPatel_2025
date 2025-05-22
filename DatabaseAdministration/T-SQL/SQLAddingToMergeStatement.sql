-- Step 0: Check for duplicate employee+date rows in the new transactions
SELECT DateOfTransaction, EmployeeNumber, COUNT(*) AS NumberOfRows
FROM tblTransactionNew 
GROUP BY DateOfTransaction, EmployeeNumber
HAVING COUNT(*) > 1;

-- Step 1: Start transaction
BEGIN TRAN;

-- Step 2: Disable triggers to avoid side effects during MERGE (optional)
DISABLE TRIGGER TR_tblTransaction ON dbo.tblTransaction;

-- Step 3: Merge with aggregation (sum amounts per employee per date)
MERGE INTO tblTransaction AS T
USING (
    SELECT 
        DateOfTransaction, 
        EmployeeNumber, 
        SUM(Amount) AS Amount  -- sum all amounts, better than MIN
    FROM tblTransactionNew
    GROUP BY DateOfTransaction, EmployeeNumber
) AS S
ON T.EmployeeNumber = S.EmployeeNumber 
   AND T.DateOfTransaction = S.DateOfTransaction

WHEN MATCHED THEN
    UPDATE SET T.Amount = T.Amount + S.Amount

WHEN NOT MATCHED BY TARGET THEN
    INSERT (Amount, DateOfTransaction, EmployeeNumber)
    VALUES (S.Amount, S.DateOfTransaction, S.EmployeeNumber)

OUTPUT deleted.*, inserted.*;  -- show old and new rows for verification

-- Step 4: Enable the trigger back (if you disabled it before)
ENABLE TRIGGER TR_tblTransaction ON dbo.tblTransaction;

-- Step 5: Rollback transaction for testing; use COMMIT TRAN; to save changes
ROLLBACK TRAN;
