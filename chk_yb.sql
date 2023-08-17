
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
SELECT * FROM yb_table_properties('pt'::regclass);


