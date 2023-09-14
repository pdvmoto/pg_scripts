
-- show info on table...

-- table, count

-- ranges, counts, sizes

select t.table_id, t.database_name, t.schema_name, t.name, s.estimated_row_count 
from crdb_internal.tables t
   , crdb_internal.table_row_statistics s
where t.table_id = s.table_id
  and name = 't' ;

select t.name, t.table_id, r.range_id, r.lease_holder
, r.replicas, round (r.range_size / (1024*1024))  as MB
from crdb_internal.ranges r
   , crdb_internal.tables t
where r.table_id = t.table_id
  and t.name = 't'
order by t.name, range_id ;

