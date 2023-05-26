
-- all columns with a nextval-default
 select col.table_schema,
       col.table_name,
       col.column_name,
       col.column_default
--, find 2nd field separated by single-quotes.. 
, split_part(col.column_default, '''' , 2 )
from information_schema.columns col
where col.column_default is not null
      and col.table_schema not in('information_schema', 'pg_catalog') 
      and col.column_default like 'nextval%' 
order by col.column_name;


