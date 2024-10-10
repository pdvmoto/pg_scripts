
/*
select 
format('SELECT ''%s.%s'' AS table_name, COUNT(*) AS row_count FROM %I.%I;',
                       r.table_schema, r.table_name, r.table_schema, r.table_name)
              FROM information_schema.tables r
              WHERE table_schema NOT IN ('information_schema', 'pg_catalog') 
              order by r.table_name;
\gexec

*/

\timing  on

delete from ybx_ash a1 
where a1.id < ( select min(a2.id) + 10000 as ctoff from ybx_ash a2 )
and sample_time < (now() - make_interval ( secs=>80000) )
;

\! sleep 9

INSERT INTO t_long16 (payload)
SELECT md5(random()::text) 
from generate_series ( 1, 100 ) ;

\! sleep 9 
 
delete from ybx_ash a1 
where a1.id < ( select min(a2.id) + 20000 as ctoff from ybx_ash a2 )
and sample_time < (now() - make_interval ( secs=>80000) )
;

\watch 60 


