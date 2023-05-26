

/*

wal_set.sql: store wal LSN to compare later.

notes: 

1. this will drop + initiate with current wal,
   use wal_get to report bytes since setting + reset.
2. the overhead of inserting 2 lines seems to be 112 bytes

*/

drop table keep_wal_stats ;
create table keep_wal_stats 
as select 1000 as id, pg_current_wal_lsn ()  as lsn
where 1=0;

-- select pg_current_wal_lsn() as current_wal_lsn ;

insert into keep_wal_stats
select 1, pg_current_wal_lsn()  ;

select 'LSN stored for measurements.'

/* -- uncomment this to demonstrate overhead 

select * from keep_wal_stats ;

select pg_current_wal_lsn () as next_wal ;

insert into keep_wal_stats 
select 2, pg_current_wal_lsn()  ;

select w1.lsn, w2.lsn,   
pg_wal_lsn_diff( w2.lsn, w1.lsn ) as diff_wal_bytes
from keep_wal_stats as w1
, keep_wal as w2
where w1.id = 1
and w2.id = 2 
;

*/

