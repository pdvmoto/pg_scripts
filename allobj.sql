
-- need a list of all objects or objects of certain name...
-- maybe use a view ? 
-- tables, views, functions, mviews, triggers ? 

-- add: counting tablets from yb functions

select schemaname, tableowner, tablename from pg_tables ; 

select schemaname, viewowner, viewname from pg_views ; 

 select * from pg_catalog.yb_servers(); 


with fl as (
SELECT n.nspname as "schemaname",
  p.proname as "funcname",
  pg_catalog.pg_get_function_result(p.oid) as "resulttype",
  pg_catalog.pg_get_function_arguments(p.oid) as "args",
 CASE p.prokind
  WHEN 'a' THEN 'agg'
  WHEN 'w' THEN 'window'
  WHEN 'p' THEN 'proc'
  ELSE 'func'
 END as "objtype"
FROM pg_catalog.pg_proc p
     LEFT JOIN pg_catalog.pg_namespace n ON n.oid = p.pronamespace
WHERE p.proname like 'yb%'
  AND pg_catalog.pg_function_is_visible(p.oid)
  and p.prokind not in ('a', 'w', 'p')
)
select schemaname, funcname, resulttype 
from fl 
order by schemaname, funcname ; 
;


