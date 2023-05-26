
-- create simplest possible table, 
-- test 1, 2, 4 tablets
-- test locating columns separate or together

-- finding : select * (star) results in storage-reads as nr-tablet.
--  hence, even empty tables will take more time if many tablets

 
drop table t1;
create table t1 ( id bigint primary key
                , payload text ) 
split into 1 tablets ;


insert into t1 
select                   row_number() over ()       as id
     , fnNumberToWords ( row_number() over ()  )    as payload
from pg_tables limit 1 ;

                          select * from t1 ; 
explain ( analyze, dist ) select * from t1 ;

  drop table t2 ; 
create table t2 ( id bigint primary key
                , payload text ) 
split into 2 tablets ;


insert into t2 
select                   row_number() over ()       as id
     , fnNumberToWords ( row_number() over ()  )    as payload
from pg_tables limit 1 ;

                          select * from t2 ; 
explain ( analyze, dist ) select * from t2 ;

  drop table t8 ; 
create table t8 ( id bigint primary key
                , payload text ) 
split into 8 tablets ;


insert into t8 
select                   row_number() over ()       as id
     , fnNumberToWords ( row_number() over ()  )    as payload
from pg_tables limit 1 ;

                          select * from t8 ; 
explain ( analyze, dist ) select * from t8 ;
