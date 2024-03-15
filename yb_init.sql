
/*  ---------- yb_init -------

usage: run this on a new db, to get some tooling

 ---------------  
*/

\echo copied some settings from postgres, franck
alter database yugabyte set yb_enable_optimizer_statistics to on;
alter database yugabyte set yb_enable_base_scans_cost_model to true;

\echo to generate spoken numbers
\i n2words.sql

\echo functions to count 
\i mk_fcnt.sql

\echo random generator
\i random.sql

/* */ 

\echo view to inspect yb-properties of tables
create or replace view ybx_tblinfo as (
select c.oid
, n.nspname as schemaname
, c.relname
, pg_catalog.pg_get_userbyid(c.relowner) as tableowner
, tp.num_tablets
, tp.num_hash_key_columns
, tp.is_colocated
, tp.tablegroup_oid
, tp.colocation_id
, yb_is_local_table ( c.oid) islocal
--, c.*
from   pg_catalog.pg_class c 
left join pg_catalog.pg_namespace n on n.oid = c.relnamespace 
join  yb_table_properties(c.oid) tp on 1=1
where c.relkind in ('r', 'i', 't', 'S','m') )
;



\echo finally, report the database, and show if it is colocated
\echo .
\c 
\echo .

select yb_is_database_colocated () ; 

