
select 'select '' ' || schemaname || '.' || tablename 
  || ': '' , count (*) from ' || schemaname || '.' || tablename || ';'
from pg_tables 
order by 1; 

select 'dont forget \t and \o a.out ' ; 

