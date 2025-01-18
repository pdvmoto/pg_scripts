
create table t_inp ( 
  id bigint generated always as identity primary key
, log_dt timestamp with time zone     -- default now()
, host    text default '-unspec-'     -- default ybx_get_host()
, payload text
) ; 


\COPY t_inp ( payload ) 
from program 'cat /Users/pdvbv/data/gittest/pg_scripts/input.txt'
WITH (format text, HEADER false, null '' ) ;

select count (*) from t_inp ;

