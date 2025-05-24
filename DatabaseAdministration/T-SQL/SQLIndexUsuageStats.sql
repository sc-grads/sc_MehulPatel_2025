-- Select index usage statistics from dynamic management view sys.dm_db_index_usage_stats
-- Retrieve the database name, table name, index name, and all columns from the usage stats
select db_name(database_id) as [Database Name]
, object_name(ddius.object_id) as [Table Name]
, i.name as [Index Name]
, ddius.*
from sys.dm_db_index_usage_stats as ddius
-- Join to sys.indexes to get index names for matching object_id and index_id
join sys.indexes as i on ddius.object_id = i.object_id and ddius.index_id = i.index_id
-- Filter for the current database context
where database_id = db_id()

