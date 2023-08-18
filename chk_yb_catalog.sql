
-- collect yb-views and calls.


select * from yb_servers ();

select yb_server_zone ();

-- generate function calls:
select 'select ' || proname || '() ; ' as fcall
, ' as ' || proname || ' ;'  as more
from pg_catalog.pg_proc 
where proname like '%yb%'
order by 1  ;    

-- show yb-properties of 1 table, must be valid oid
select yb_table_properties(16393) ;

-- generate for all tables:
select   yb_table_properties ( c.oid ) ybprops 
, yb_is_local_table(c.oid) islocal
, yb_hash_code(c.oid) yb_hash_code
, yb_get_range_split_clause(c.oid) range_split_clause
, c.oid, t.tableowner, t.schemaname, c.relname 
from pg_class c
   , pg_tables t
where c.relname = t.tablename
and 1=1 -- join owner or schema
order by c.relname;

-- generate some code to fethc properties
    
select 'select ' || proname || '() ; ' as fcall
, 'SELECT * FROM yb_table_properties(''' || proname || ''':regclass);'
, ' as ' || proname || ' ;'  as more
from pg_catalog.pg_proc 
where proname like '%yb%'
order by 1 desc ;    


-- try for tablet count
SELECT t.schemaname, t.tablename
, tp.num_tablets 
, tp.num_hash_key_columns
, tp.is_colocated
, tp.tablegroup_oid
, tp.colocation_id  
FROM yb_table_properties(c.oid) tp
   , pg_tables t
   , pg_class c
where   t.tablename = c.relam
and t.tablename like 't%';

-- this has worked..
drop view yb_tabinfo;
create view yb_tableinfo as (
select c.oid, c.relname  
--, yb_table_properties(c.oid) as props
, tp.num_tablets
, tp.num_hash_key_columns
, tp.is_colocated
, tp.tablegroup_oid
, tp.colocation_id
from pg_class c
, yb_table_properties(c.oid) tp 
where 1=1
--and c.reltype = 'r'
); 

-- better

drop view ybx_tblinfo;
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

select oid, relname, num_tablets from ybx_tblinfo order by relname;

--more.., not worked..
with c as ( select c.oid as oid
from pg_class c) 
select c.oid, c.relname -- , yb_table_properties(c.oid) as props
-- , tp.num_tablets
from pg_class c, yb_table_properties(c.oid) tp ;

drop table ybx_tt ;
create table ybx_tt (
  id        uuid primary key
, node_id   uuid
, master_id uuid
, table_oid oid
, moreinfo text 
);

create view ybx_tablet
as ( select * from ybx_tt) ;

-- when timing is needed:
create table x_timing ( 
  id bigint primary key
, time_ms bigint
, stor_calls bigint
, descr text
, comment text )
;

insert into x_timing values ( 1, 8, 6, 'qry desc' ) ;


create table region1 ( region_id smallint primary key, region_description bpchar ) split into 1 tablets ;

