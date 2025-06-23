-- Example 1: UNION between pseudo-tables in a trigger context
-- This is usually used inside a trigger to compare old (deleted) and new (inserted) values
-- UNION removes duplicates
SELECT * FROM inserted
UNION 
SELECT * FROM deleted;


-- Example 2: UNION ALL with fixed-length strings
-- Demonstrates how SQL Server handles fixed-length CHAR types and includes all rows even if duplicates exist
--convert is used to change the datatype of a value to another data type.
SELECT CONVERT(CHAR(5), 'hi') AS Greeting
UNION ALL
SELECT CONVERT(CHAR(11), 'hello there') AS GreetingNow
UNION ALL
SELECT CONVERT(CHAR(11), 'bonjour') -- padded with spaces to reach length 11
UNION ALL
SELECT CONVERT(CHAR(11), 'hi');     -- padded with spaces: 'hi         '


-- Example 3: UNION with different numeric types
-- SQL Server promotes the smaller data type (tinyint) to match the larger one (bigint)
-- UNION removes duplicates (none in this case)
with cte as (
SELECT CONVERT(TINYINT, 45) AS Mycolumn
UNION
SELECT CONVERT(BIGINT, 456)
)
select Mycolumn
into tblTemp
from cte

-- Example 4: UNION between number and string
-- SQL Server must convert to a common data type. Since string > number in precedence,
-- the number 4 is implicitly converted to the string '4'
-- Resulting column will be of type VARCHAR
SELECT 4
UNION
SELECT 'hi there';
