
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
select c.oid, c.relname
--, yb_table_properties(c.oid) as props
, tp.num_tablets
, tp.num_hash_key_columns
, tp.is_colocated
, tp.tablegroup_oid 
, tp.colocation_id
, yb_is_local_table ( c.oid) islocal
from pg_class c
, yb_table_properties(c.oid) tp 
where 1=1
and c.relkind in ( 'r', 'i' )
);

\echo finally, report the database, and show if it is colocated
\echo .
\c 
\echo .

select yb_is_database_colocated () ; 

