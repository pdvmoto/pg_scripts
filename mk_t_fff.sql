
-- try filling a long table Fast..

create table t_fff ( 
  id bigint generated always as identity primary key
, created_dt timestamptz default now()
, payload text
) ; -- split into 9 tablets ;  -- experiment with 1 or 3 tablets 

-- experiment with index on crated_dt

\timing on 

insert into t_fff ( created_dt, payload ) select clock_timestamp(), ' ' from generate_series ( 1, 5000 ) ;
 
\watch c=10000 4



