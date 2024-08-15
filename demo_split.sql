/* 
-- demo_split: split tablets, only reported after reboot

split: how: 
 - start with threshold 5M and dflt 1 tablet
 - create table with 1 tablet and fill with 1M data
 - observe using yb-admin..
 - query yb_table_properties () num_tablets
 - when splits show in yb-admin, query stils reports 1 ? 
 - yb_local_tablets ??

size: how: (verify numbers!)
 - fresh db, with slow-logging and monitoring of tablog
 - table with random, hard to compress, data. 
 - records are approx 1K, and hard to compress
 - need 128K records to get to split-size...
 - check split ?
 - need 1M records to get to 1G
 - load about 1G, and wait for split into ... 8 tablets ?
 - measure size via get_tablog and plot it ?

testing:
 - inserted 100K records, use sum-length-payload to see MB
 - see pg_size: much bigger.
 - wait for split... 
 - probaby max splits into nr-servers.. ? 

*/ 

/* drop cmds  */

 drop table t_split ;
 drop table t_size  ;

/* **** */

-- create and fill a table with a LOT of records

create table t_split ( 
  id bigint generated always as identity primary key 
, created_dt timestamptz default now()
, payload text 
) ;

create table t_size ( 
  id bigint generated always as identity primary key 
, created_dt timestamptz default now()
, payload text 
) ;

-- split: every 10 records  is 1kb, so 10.000 records is 1M, 
-- and 40K records is just under 5M, just under the threshold

insert into t_split ( payload ) 
 select sha512 ( random()::text::bytea  )::text
from generate_series ( 1, 10000);

-- 130 bytes ?
-- need 8x130 to get to 1K recordsize..
insert into t_size ( payload ) 
select  '[' 
|| sha512 ( random()::text::bytea )::text
|| sha512 ( random()::text::bytea )::text
|| sha512 ( random()::text::bytea )::text
|| sha512 ( random()::text::bytea )::text
|| sha512 ( random()::text::bytea )::text
|| sha512 ( random()::text::bytea )::text
|| sha512 ( random()::text::bytea )::text
|| sha512 ( random()::text::bytea )::text || ']' 
from generate_series ( 1, 1000 ) a ;


-- proof of length and size:
select pg_column_size ( payload) size_of_payload_bytes 
from t_size limit 3 ;

select count (*) nr_records
     , sum ( pg_column_size ( payload) )::float / (1024*1024) total_payload_mb 
from t_size ;

-- check table size repoted by pg..
select c.relname
     , pg_table_size (c.oid::regclass) / (1024*1024) pg_table_size_mb
from pg_class c
where relname = 't_size' ;

-- now add records up to 128k, to have split-size
insert into t_size ( payload ) 
select  '[' 
|| sha512 ( random()::text::bytea )::text
|| sha512 ( random()::text::bytea )::text
|| sha512 ( random()::text::bytea )::text
|| sha512 ( random()::text::bytea )::text
|| sha512 ( random()::text::bytea )::text
|| sha512 ( random()::text::bytea )::text
|| sha512 ( random()::text::bytea )::text
|| sha512 ( random()::text::bytea )::text || ']' 
from generate_series ( 1, 127000 ) a ;

select count (*) nr_records
     , sum ( pg_column_size ( payload) )::float / (1024*1024) total_payload_mb 
from t_size ;

-- check table size repoted by pg..
select c.relname
     , pg_table_size (c.oid::regclass) / (1024*1024) pg_table_size_mb
from pg_class c
where relname = 't_size' ;
