
-- try filling a long table Fast..

create table t_fff ( 
  id bigint generated always as identity primary key
, created_dt timestamptz default now()
, payload text
);  -- experiment with 1 or 3 tablets 

-- experiment with index on crated_dt

\timing on 

insert into t_fff ( payload ) select ' ' from generate_series ( 1, 100*1000 ) ;
 
\watch 


