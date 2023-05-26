
-- ex3.sql: create simplest possible table, 
-- test nr of  tablets 1, 2, 8, 
-- test 1, 2, 8 rows..

-- finding : select * (star) with pk
--  multiple-rows: still 1 storage-reads, try many... 

 
drop table t1;
create table t1 ( id bigint primary key
                , payload text ) 
-- no explicit split split into 1 tablets 
;


insert into t1 
select                   row_number() over ()       as id
     , fnNumberToWords ( row_number() over ()  )    as payload
from pg_tables limit 1 ;

-- check for non-existing row
                          select * from t1 where id = 0 ; 
explain ( analyze, dist ) select * from t1 where id = 0 ;

\! echo .
\! echo default table, 1 tablet, 1 row, out of range
\! echo .
\! read abc

-- check for -existing row
                          select * from t1 where id = 1 ; 
explain ( analyze, dist ) select * from t1 where id = 1 ;

\! echo .
\! echo default table, 1 tablet, 1 row, in range...
\! echo .
\! read abc


  drop table t2 ; 
create table t2 ( id bigint primary key
                , payload text ) 
split into 2 tablets 
;


insert into t2 
select                   row_number() over ()       as id
     , fnNumberToWords ( row_number() over ()  )    as payload
from pg_tables limit 2 ;

                          select * from t2 where id = 1 ; 
explain ( analyze, dist ) select * from t2 where id = 1 ;

  drop table t8 ; 
create table t8 ( id bigint primary key
                , payload text ) 
split into 8 tablets 
;

insert into t8 
select                   row_number() over ()       as id
     , fnNumberToWords ( row_number() over ()  )    as payload
from pg_tables limit 8 ;

                          select * from t8 where id = 1 ; 
explain ( analyze, dist ) select * from t8 where id = 1 ;

