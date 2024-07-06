
-- create and fill a table with a LOT of records


create table t_long ( 
  id bigint generated always as identity primary key 
, created_dt timestamptz default now()
, payload text 
) ;

INSERT INTO t_long (payload)
SELECT md5(random()::text)
FROM generate_series(1, 100000);

insert into t_long ( payload ) 
 select sha512 ( random()::text::bytea  )::text
from generate_series ( 1, 100000);

create table t_long02 ( 
  id bigint generated always as identity primary key 
, created_dt timestamptz default now()
, payload text 
) split into 2 tablets;

create table t_long16 ( 
  id bigint generated always as identity primary key 
, created_dt timestamptz default now()
, payload text 
) split into 16 tablets;

