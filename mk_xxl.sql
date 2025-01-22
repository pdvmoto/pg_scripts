
-- create and fill a table with a LOT of records


/* 

drop table t_rnd ;
drop table t_spc ;

*/ 

create table t_xxl ( 
  id bigint generated always as identity primary key 
--, created_dt timestamptz default now()
, payload text 
) ;

-- check if this helps?
alter sequence t_xxl_id_seq cache 200000 ; 

\! read -t 5 -p "empty tables created, check size... " abc
\! echo .

-- try super-lean record-size

insert into t_xxl ( payload )  
select  ' ' 
from generate_series ( 1, 20000);

select pg_sleep( 3 ) ;  -- give it time.

\! read -t 5 -p "inserted small set of data, next bigger set... " abc
\! echo .

insert into t_xxl ( payload )  
select  ' ' 
from generate_series ( 1, 20000);

select count (*) from t_xxl ; 

\! read -t 5 -p "check count  ... " abc

select ' end of xxl script ... ? '|| chr(10) || ' Wait until compression kicks in.. ' as results ;

