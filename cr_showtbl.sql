
-- show info on table t

-- estimates, range-info, range-size

select t.table_id, t.database_name, t.schema_name
, t.name tablename, s.estimated_row_count  as est_rows
from crdb_internal.tables t
   , crdb_internal.table_row_statistics s
where t.table_id = s.table_id
  and name in ( 't' ) ;

/*
select t.name, t.table_id, r.range_id, r.lease_holder
, r.replicas, round (r.range_size / (1024*1024))  as MB
from crdb_internal.ranges r
   , crdb_internal.tables t
where r.table_id = t.table_id
  and t.name in (  't' )
order by t.name, range_id ;
*/

\set ECHO all

SELECT  r.range_id, r.lease_holder, r.replicas
, round (r.range_size_mb) as size_mb 
FROM [SHOW RANGES FROM TABLE t WITH DETAILS] as r ;

SELECT  r.range_id, r.lease_holder, r.replicas
, round (r.range_size_mb) as size_mb 
FROM [SHOW RANGES FROM TABLE u WITH DETAILS] as r ;

\set ECHO none

