
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
order by size_bytes ; 

\! read -t 5 -p "empty tables created, check size... " abc

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
order by size_bytes ; 

\! read -t 5 -p "inserted data, approx 10M in both tables, next insert 100K records... " abc

insert into t_rnd ( payload ) 
 select sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
 from generate_series ( 1, 190000);

-- select sum ( length ( payload ) ) / (1024*1024) as rnd_payload_200M from t_rnd ;; 
-- select pg_table_size ( 't_rnd' )  / (1024*1024) as rnd_tab_size_200M ;

insert into t_spc ( payload ) 
 select lpad ( '', 1024 ) 
 from generate_series ( 1, 90000);

-- select sum ( length ( payload ) ) / (1024*1024) as spc_payload_200M from t_spc ;; 
-- select pg_table_size ( 't_spc' )  / (1024*1024) as spc_size_200M ;

-- select ybx_get_tablog() ; 

select relname tblname, fn_cnt_i ( relname ) num_recs, num_tablets, size_bytes /(1024*1024) mb  
from ybx_tblinfo 
where relname like 't\____'
order by size_bytes ; 

\! read -t 5 -p "now about 100M in both tables ... " abc

select ' end of space demo ... ? '|| chr(10) || ' Wait until compression kicks in.. ' as results ;

\! echo .
\! read -t 5 -p "Final words.. " abc
\! echo .
\! echo .
\! echo "What did we learn...?"
\! echo .
\! echo "1. Distributed, Serverless is actually Sharding and Replication."
\! echo .
\! echo "2. Sharding:        ( ~/~ partitioning ) : more components, overhead... "
\! echo .
\! echo "3. Replication:     Raft, 3 or 5 Copies of each data-item."
\! echo .
\! echo "4. Overhead:        extra processing.."
\! echo "5. Overhead:        extra storage space needed.."
\! echo .
\! echo "6. Work to do, things to Study."
\! echo .
