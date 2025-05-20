

--Question 1

select [name] + 'A'
from sys.all_columns
--Question 2

select [name] + N'?'
from sys.all_columns
Question 3

select substring([name],2,len([name])-1) as [name]
from sys.all_columns
--Question 4

select substring([name],1,len([name])-1) as [name]
from sys.all_columns

--Query 1:

--select substring([name], 2, len([name]) - 1) as [name]
--from sys.all_columns
--Explanation:
--sys.all_columns: A system view in SQL Server that contains a row for each column of each table in the database.

--[name]: The column name in each row of sys.all_columns.

--substring([name], 2, len([name]) - 1):

--substring is a function that returns part of a string.

--Starts at position 2, meaning it removes the first character of the column name.

--The length is len([name]) - 1, so it takes all remaining characters after the first.

--Result: Every column name from sys.all_columns is returned without the first character.

--Query 2:

--select substring([name], 1, len([name]) - 1) as [name]
--from sys.all_columns
--Explanation:
--Same source: sys.all_columns

--substring([name], 1, len([name]) - 1):

--Starts at position 1, so it includes the first character.

--Takes len([name]) - 1 characters, effectively removing the last character.

--Result: Every column name is returned without the last character.