
-- create and fill a table with a LOT of records


/* 

drop table t_rnd ;
drop table t_spc ;

*/ 

create table t_lll ( 
  id bigint generated always as identity primary key 
, created_dt timestamptz default now()
, payload text 
) ;

select relname tblname, fn_cnt_i ( relname ) num_recs, num_tablets, size_bytes /(1024*1024) mb  
from ybx_tblinfo 
where relname like 't\____'
order by size_bytes ; 

\! read -t 5 -p "empty tables created, check size... " abc

-- try record-size of 1K

insert into t_lll ( payload ) 
 select md5 ( random()::text::bytea  )::text
 from generate_series ( 1, 100000);

select pg_sleep( 3 ) ;  -- give it time.

\! read -t 5 -p "inserted data, approx 10M in both tables, next insert 100K records... " abc

insert into t_lll ( payload ) 
 select md5 ( random()::text::bytea  )::text
 from generate_series ( 1, 900000);

select count (*) cnt_t_lll from t_lll ; 

\! read -t 5 -p "check count  ... " abc

select ' end of script ... ? '|| chr(10) || ' Wait until compression kicks in.. ' as results ;

