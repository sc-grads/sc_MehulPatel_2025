---UnPivot 
-- Select all columns from the result of the UNPIVOT operation
SELECT *
FROM [tblPivot]  -- Use the source table 'tblPivot' which has monthly columns [1] to [12]

-- Unpivot operation: transform monthly columns into rows
UNPIVOT (
    Amount                     -- The name of the value column after unpivoting
    FOR Month IN (             -- 'Month' will hold the former column names (1 to 12)
        [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12]
    )
) AS tblUnPivot               -- Alias for the result of the unpivoted table

-- Filter the results to include only rows where the Amount is not equal to 0
where Amount <> 0
