
-- create and fill a table with a LOT of records


create table t_long ( 
  id bigint generated always as identity primary key 
, created_dt timestamptz default now()
, payload text 
) ;

-- INSERT INTO t_long (payload)
-- SELECT md5(random()::text)
-- FROM generate_series(1, 10000);

select pg_table_size ( 't_long' ) /( 1024*1024)::float  size_0mb ;

-- try record-size of 1K
insert into t_long ( payload ) 
 select sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
 from generate_series ( 1, 1000);

select pg_table_size ( 't_long' ) /( 1024*1024)::float  size_1mb ;

insert into t_long ( payload ) 
 select sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
     || sha512 ( random()::text::bytea  )::text
 from generate_series ( 1, 99000);

select pg_table_size ( 't_long' ) /( 1024*1024)::float  size_99mb ;

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

