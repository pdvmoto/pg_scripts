
-- create and fill a table with a LOT of records


/* 

drop table t_rnd ;
drop table t_spc ;

*/ 

create table t_rnd ( 
  id bigint generated always as identity primary key 
, created_dt timestamptz default now()
, payload text 
) ;

create table t_spc ( 
  id bigint generated always as identity primary key 
, created_dt timestamptz default now()
, payload text 
) ;

select relname tblname, fn_cnt_i ( relname ) num_recs, num_tablets, size_bytes /(1024*1024) mb  
from ybx_tblinfo 
where relname like 't\____'
  and 0=1
order by size_bytes ; 

\! read -p "empty tables created, check size... " abc

-- try record-size of 1K
insert into t_rnd ( payload ) 
 select sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
 from generate_series ( 1, 10000);

insert into t_spc ( payload ) 
 select lpad ( '', 1024 ) 
 from generate_series ( 1, 10000);

select pg_sleep( 5 ) ;  -- give it time.

-- select sum ( length ( payload ) ) / (1024*1024) as  rnd_payload_10m from t_rnd ;; 
-- select pg_table_size ( 't_rnd' )  / (1024*1024) as  rnd_tab_size_10m ;

-- select ybx_get_tablog() ; 

select relname tblname, fn_cnt_i ( relname ) num_recs, num_tablets, size_bytes /(1024*1024) mb  
from ybx_tblinfo 
where relname like 't\____'
  and 0=1
order by size_bytes ; 

\! read -p "inserted random data, approx 10M in both tables... " abc

insert into t_rnd ( payload ) 
 select sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
 from generate_series ( 1, 50000);

-- select sum ( length ( payload ) ) / (1024*1024) as rnd_payload_200M from t_rnd ;; 
-- select pg_table_size ( 't_rnd' )  / (1024*1024) as rnd_tab_size_200M ;

insert into t_spc ( payload ) 
 select lpad ( '', 1024 ) 
 from generate_series ( 1, 50000);

-- select sum ( length ( payload ) ) / (1024*1024) as spc_payload_200M from t_spc ;; 
-- select pg_table_size ( 't_spc' )  / (1024*1024) as spc_size_200M ;

--select ybx_get_tablog() ; 

select relname tblname, fn_cnt_i ( relname ) num_recs, num_tablets, size_bytes /(1024*1024) mb  
from ybx_tblinfo 
where relname like 't\____'
  and 0=1
order by size_bytes ; 

\! read -p "now about 200M in both tables ... " abc

select ' end of space demo ... ? '|| chr(10) || ' Wait until compression kicks in.. ' as results ;
