/* 
-- demo_split: split tablets, only reported after reboot

split: how: 
 - start with threshold 5M and dflt 1 tablet
 - create table with 1 tablet and fill with 1M data
 - observe using yb-admin..
 - query yb_table_properties () num_tablets
 - when splits show in yb-admin, query stils reports 1 ? 
 - yb_local_tablets ??

size: how:
 - table with random, hard to compress, data. 
 - records are approx 128bytes 
 - load about 1G

testing:
 - inserted 100K records, use sum-length-payload to see MB
 - see pg_size: much bigger.
 - wait for split... 
 - probaby max splits into nr-servers.. ? 

*/ 

-- create and fill a table with a LOT of records

create table t_split ( 
  id bigint generated always as identity primary key 
, created_dt timestamptz default now()
, payload text 
) ;

-- every 10 records  is 1kb, so 10.000 records is 1M, 
-- and 40K records is just under 5M, just under the threshold

insert into t_split ( payload ) 
 select sha512 ( random()::text::bytea  )::text
from generate_series ( 1, 100000);

