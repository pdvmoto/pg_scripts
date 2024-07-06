
-- various tests-code for time, timestamp, date, etc..

drop table timetest ;

create table timetest (
  id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY
, ts timestamptz
, payload text
);

with h as (select get_host() as host )
insert into  timetest ( ts, payload )
select now(), now()::text
from pg_stat_activity a, h h ;



create table test_dt (
  id bigint generated always as identity primary key
, created_dt timestamptz default now()
, payload text default 'generated : ' || now()
, filler text
);

insert into  test_dt ( filler) select 'now is ' || now() ;

select * from test_dt order by created_dt;


