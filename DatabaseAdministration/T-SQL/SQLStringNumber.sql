--Joining a string to a number
SELECT 'My number is: ' + convert(varchar(20),4567)
SELECT 'My number is: ' + cast(4567 as varchar(20))

SELECT 'My salary is: $' + convert(varchar(20),2345.6) -- works , but not well
SELECT 'My salary is: ' + format(2345.6,'C','fr-FR') --the C represents the salary, fr-FR this represents in which currency you want to convert in
--'C3' three decimal places