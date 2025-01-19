
create table t_inp ( 
  id bigint generated always as identity primary key
, log_dt timestamp with time zone     -- default now()
, host    text default '-unspec-'     -- default ybx_get_host()
, payload text
) ; 


create table t_in2 ( 
  id bigint generated always as identity primary key
, log_dt timestamp with time zone     -- default now()
, host    text default '-unspec-'     -- default ybx_get_host()
, payload text
) ; 

create table t_in3 ( 
  id bigint generated always as identity primary key
, log_dt timestamp with time zone     -- default now()
, host    text default '-unspec-'     -- default ybx_get_host()
, payload text
) split into 4 tablets; 

\COPY t_inp ( payload ) 
from program 'cat /Users/pdvbv/data/gittest/pg_scripts/input.txt'
WITH (format text, HEADER false, null '' ) ;

select count (*) from t_inp ;

