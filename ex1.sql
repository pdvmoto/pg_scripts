
-- create simplest possible table, 
-- test 1, 2, 4 tablets
-- test locating columns separate or together

-- finding : select * (star) results in storage-reads as nr-tablet.
--  hence, even empty tables will take more time if many tablets

 
drop table e1;
create table e1 ( id bigint primary key
                , payload text ) 
split into 1 tablets ;


insert into e1 
select                   row_number() over ()       as id
     , fnNumberToWords ( row_number() over ()  )    as payload
from pg_tables limit 1 ;

                          select * from e1 ; 
explain ( analyze, dist ) select * from e1 ;

  drop table e2 ; 
create table e2 ( id bigint primary key
                , payload text ) 
split into 2 tablets ;


insert into e2 
select                   row_number() over ()       as id
     , fnNumberToWords ( row_number() over ()  )    as payload
from pg_tables limit 1 ;

                          select * from e2 ; 
explain ( analyze, dist ) select * from e2 ;

  drop table e8 ; 
create table e8 ( id bigint primary key
                , payload text ) 
split into 8 tablets ;


insert into e8 
select                   row_number() over ()       as id
     , fnNumberToWords ( row_number() over ()  )    as payload
from pg_tables limit 1 ;

                          select * from e8 ; 
explain ( analyze, dist ) select * from e8 ;

