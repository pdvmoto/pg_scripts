

with top_rr as (
 select root_request_id, pid  
      , query_id
      , min ( sample_time ) rr_start
      , extract ( epoch from ( max (sample_time) - min(sample_time ) )) as elapsed  
from yb_active_session_history al
where query_id not between -100 and 100
group by 1, 2, 3
order by elapsed desc 
limit 10 
)
select to_char (rr.rr_start , 'hh24:mi:ss.ms' ) as tim
, rr.elapsed                                    as ela_sec 
, rr.pid
, substr ( replace ( s.query , chr(10), ' ' ), 1, 30 ) as qry
from top_rr rr
   , pg_stat_statements  s
where rr.query_id = s.queryid
order by ela_sec desc; 


