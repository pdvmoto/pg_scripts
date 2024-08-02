
select host
, to_char ( logged_dt, 'HH24:MI:SS')  tim
, component
, ela_ms::int, info_txt
from ybx_log 
where logged_dt > ( now() - interval '10 minutes' ) 
order by logged_dt

