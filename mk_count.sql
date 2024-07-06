
/*

-- an example of gexec...
select 
format('SELECT ''%s.%s'' AS table_name, COUNT(*) AS row_count FROM %I.%I;',
                       r.table_schema, r.table_name, r.table_schema, r.table_name)
              FROM information_schema.tables r
              WHERE table_schema NOT IN ('information_schema', 'pg_catalog') 
              order by r.table_name;
\gexec

*/

select 'select '' ' || schemaname || '.' || tablename 
  || ': '' , count (*) from ' || schemaname || '.' || tablename || ';'
from pg_tables 
order by 1; 

select 'dont forget \t and \o a.out ' ; 

