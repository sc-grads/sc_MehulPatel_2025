--Scalar Functions 1 
-- Create a scalar function named 'AmountPlusOne' that takes one parameter @Amount of type smallmoney
CREATE FUNCTION AmountPlusOne(@Amount smallmoney)
-- The function returns a smallmoney value
RETURNS smallmoney
AS
BEGIN
    -- Return the input amount plus 1
    RETURN @Amount + 1
END
GO

-- Select DateOfTransaction, EmployeeNumber, Amount, and the result of calling the function on Amount
select DateOfTransaction, EmployeeNumber, Amount, dbo.AmountPlusOne(Amount) as AmountAndOne
from tblTransaction

-- Declare a variable @myValue of type smallmoney
DECLARE @myValue smallmoney

-- Execute the function AmountPlusOne with @Amount = 345.67 and assign the result to @myValue
EXEC @myValue = dbo.AmountPlusOne @Amount = 345.67

-- Select the value stored in @myValue
select @myValue
