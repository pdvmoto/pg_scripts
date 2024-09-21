select
  to_char ( a.sample_time, 'DDD DY HH24:MI:00') as     dt_hr
,            a.host
, count (*)  samples_per_hr
from ybx_ash a
where 1=1 
--and wait_event_component not in ('YCQL')
and a.sample_time > ( now() - interval '1900 seconds' ) 
group by 2, 1
  /* host , to_char ( a.sample_time, 'DDD DY HH24:MI:00') */
order by 1, 2 \crosstabview 
  ;

