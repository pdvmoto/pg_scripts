
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

-- INSERT INTO t_long (payload)
-- SELECT md5(random()::text)
-- FROM generate_series(1, 10000);

select sum ( length ( payload ) ) / (1024) as  rnd_empty_0kb from t_rnd ;; 
select pg_table_size ( 't_rnd' ) /( 1024) as  rnd_empty_size_0Kb ;

\! read -p "empty tabl created... " abc

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
 from generate_series ( 1, 1000);

select pg_sleep( 3 ) ;  -- give it time.

select sum ( length ( payload ) ) / (1024) as  rnd_payload_1000Kb from t_rnd ;; 

select pg_table_size ( 't_rnd' ) / (1024) as   rnd_tab_size_1000Kb ;

\! read -p "random data 1M... " abc


select sum ( length ( payload ) ) / (1024) as  rnd_payload_1000Kb from t_rnd ;; 

insert into t_rnd ( payload ) 
 select sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
 from generate_series ( 1, 99000);

select sum ( length ( payload ) ) / (1024*1024) as rnd_payload_60M from t_rnd ;; 
select pg_table_size ( 't_rnd' )  / (1024*1024) as rnd_tab_size_60M ;

\! read -p "random data 60M... " abc

-- now repeat with compressible strings


create table t_spc ( 
  id bigint generated always as identity primary key 
, created_dt timestamptz default now()
, payload text 
) ;

\! read -p "empty tabl created... " abc

-- try record-size of 1K
insert into t_spc ( payload ) 
 select lpad ( '', 1024 ) 
 from generate_series ( 1, 1000);

select pg_sleep( 3 ) ;  -- give it time.

select sum ( length ( payload ) ) / (1024) as  spc_payload_1000Kb from t_spc ;; 

select pg_table_size ( 't_spc' ) / (1024) as  spc_size_1000Kb ;

select sum ( length ( payload ) ) / (1024) as  spc_payload_1000Kb from t_spc ;; 

\! read -p "space data 1M... " abc

insert into t_spc ( payload ) 
 select lpad ( '', 1024 ) 
 from generate_series ( 1, 99000);

select sum ( length ( payload ) ) / (1024*1024) as spc_payload_60M from t_spc ;; 
select pg_table_size ( 't_spc' ) / (1024*1024) as spc_size_60M ;

\! read -p "space data 60M... " abc

select ' end of space demo ... ' 
