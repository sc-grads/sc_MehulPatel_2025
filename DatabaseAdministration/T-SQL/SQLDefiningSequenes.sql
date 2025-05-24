--Defining SEQUENCES 
-- Start a transaction to group the sequence creation steps
BEGIN TRAN

-- Create a sequence named 'newSeq' of type BIGINT
CREATE SEQUENCE newSeq AS BIGINT
-- Start the sequence at 1
START WITH 1
-- Increment the sequence value by 1 each time it's used
INCREMENT BY 1
-- Set the minimum value the sequence can generate to 1
MINVALUE 1
-- (Optional) Maximum value is commented out: 999999
--MAXVALUE 999999
-- (Optional) CYCLE is commented out: if enabled, sequence restarts after max value
--CYCLE
-- Cache 50 sequence values in memory for faster access
CACHE 50

-- Create another sequence named 'secondSeq' of type INT with default options
CREATE SEQUENCE secondSeq AS INT

-- Query system catalog view to show all sequences in the current database
SELECT * FROM sys.sequences

-- Roll back the transaction, undoing the sequence creations
ROLLBACK TRAN
