

drop view ybfunclist ;

create or replace view ybfunclist as 
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
;
