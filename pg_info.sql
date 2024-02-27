-- various data from pg-inernals, 
-- mainly for sql-copies

-- find all tables
select 'select * from ' || t.schemaname || '.' || tablename || ';' sel
, t.* 
from pg_catalog.pg_tables t
order by schemaname, tablename ;

-- all views
select 'select * from ' || t.schemaname || '.' || viewname || ';' sel
 , t.* 
from pg_views t
order by schemaname ;

-- all functions, mind where clause
select 'select ' || proname ||  '() ;' sel
 , t.* 
from pg_proc t
where proname like '%yb%'
order by proname  ;

-- compile options ?
select * from pg_config order by name ;

--details of attributes
select * from pg_attribute order by attname ;
