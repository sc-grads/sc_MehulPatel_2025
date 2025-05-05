create database dbtest;

---- Alter database settings
alter database dbtest set MIXED_PAGE_ALLOCATION on

create table heaptable1(c1 int, c2 varchar(8000))
insert heaptable1 values(1,REPLICATE('a',1000))


-- Select data with additional information
SELECT
    ht1.c1,
    ht1.c2,
    p.file_id,
    p.page_id,
    dddpa.is_mixed_page_allocation
FROM
    heaptable1 AS ht1
CROSS APPLY
    sys.fn_PhysLocCracker(%%physloc%%) AS p
INNER JOIN
    sys.dm_db_database_page_allocations(
        DB_ID(),
        OBJECT_ID('dbo.heaptable1'),
        NULL,
        NULL,
        'DETAILED'
    ) AS dddpa
    ON p.file_id = dddpa.allocated_page_file_id
    AND p.page_id = dddpa.allocated_page_page_id;

	-- Enable trace flag
DBCC TRACEON(3604, -1);
-- Display page information
DBCC PAGE(dbtest, 1, 1, 3);
