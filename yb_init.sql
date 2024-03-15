
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

\echo function from jim nicely to get tableid
CREATE OR REPLACE FUNCTION get_table_id(schema_name_p VARCHAR, table_name_p VARCHAR) RETURNS VARCHAR
AS $$
SELECT '0000' || lpad(to_hex(d.oid::int), 4, '0') || '00003000800000000000' || lpad(to_hex(c.oid::int), 4, '0') tableid
  FROM pg_class c, pg_namespace n, pg_database d
 WHERE n.nspname = $1
   AND c.relname = $2
   AND c.relnamespace = n.oid
   AND d.datname=current_database();
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION get_table_id(oid_p oid ) RETURNS VARCHAR
AS $$
SELECT '0000' || lpad(to_hex(d.oid::int), 4, '0') || '00003000800000000000' || lpad(to_hex(c.oid::int), 4, '0') tableid
  FROM pg_class c, pg_namespace n, pg_database d
 WHERE 1=1
   AND c.oid = $1
   AND c.relnamespace = n.oid
   AND d.datname=current_database();
$$ LANGUAGE SQL;


\echo view to inspect yb-properties of tables
create or replace view ybx_tblinfo as (
select c.oid
, n.nspname as schemaname
, c.relkind
, c.relname
, pg_catalog.pg_get_userbyid(c.relowner) as tableowner
, tp.num_tablets
, tp.num_hash_key_columns
, tp.is_colocated
, tp.tablegroup_oid
, tp.colocation_id
, yb_is_local_table ( c.oid) islocal
, get_table_id ( c.oid )     table_id
, case when n.nspname not in ( 'pg_catalog', 'information_schema')
       then pg_table_size(c.oid )
       else null
  end as size_bytes
from   pg_catalog.pg_class c
left join pg_catalog.pg_namespace n on n.oid = c.relnamespace
join  yb_table_properties(c.oid) tp on 1=1
where c.relkind in ('r', 'i', 't', 'm', 'S') 
)
;



\echo finally, report the database, and show if it is colocated
\echo .
\c 
\echo .

select yb_is_database_colocated () ; 

