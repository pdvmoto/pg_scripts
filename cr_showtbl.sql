
/*
select t.name, t.table_id, r.range_id, r.lease_holder
, r.replicas, learner_replicas, non_voting_replicas, round (r.range_size / (1024*1024))  as MB
from crdb_internal.ranges r
   , crdb_internal.tables t
where r.table_id = t.table_id
  and t.name in (  't' )
order by t.name, range_id ;
*/

/*
\set ECHO all

SELECT  r.range_id, r.lease_holder, r.replicas
, learner_replicas lrnrs, non_voting_replicas non_vot
, round (r.range_size_mb) as size_mb 
FROM [SHOW RANGES FROM TABLE t WITH DETAILS] as r ;

SELECT  r.range_id, r.lease_holder, r.replicas
, learner_replicas lrnrs, non_voting_replicas non_vot
, round (r.range_size_mb) as size_mb 
FROM [SHOW RANGES FROM TABLE u WITH DETAILS] as r ;

\set ECHO none

*/


\set ECHO all

select t.table_id, t.database_name, t.schema_name
, t.name tablename, s.estimated_row_count  as est_rows
from crdb_internal.tables t
   , crdb_internal.table_row_statistics s
where t.table_id = s.table_id
  and name in ( 't', 'u' ) ;


select  range_id, table_name
, lease_holder, voting_replicas, learner_replicas, range_size as size_b
from crdb_internal.ranges
where table_name in ( 't', 'u')
order by table_name, range_id ;

