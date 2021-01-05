
select schemaname, 'TABL' as type, count (*) from pg_tables group by schemaname , type 
union all
select schemaname, 'INDX' as type, count (*) from pg_indexes group by schemaname , type 
union all
select schemaname, 'VIEW' as type, count (*) from pg_views    group by schemaname , type order by schemaname, type; 
