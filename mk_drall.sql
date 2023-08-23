
select ' drop table ' || schemaname || '.' || tablename || ' ;' 
from pg_tables 
where schemaname not in ( 'information_schema', 'pg_catalog' ) 
order by schemaname, tablename ;
