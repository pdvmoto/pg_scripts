
\timing on

drop view  watches_sn ;
drop table watches ;

\set ECHO all

create table watches (
  primary key ( serial_num ) 
, serial_num text not null
, constraint "digits" check ( serial_num ~ '^[0-9]{12}$') 
, watch_model char
, stolen boolean default false 
) ;

\set ECHO none

insert into watches ( serial_num, watch_model ) 
  select to_char ( 1e12*random(), 'FM099999999999' ), 'X'
  from generate_series (1, 10000 ) 
union  /* union implicitly removes duplicates.. hehehe */
  select '202301234567', 'X' ;

\! read -p " we have a table with pk as hash-idx, try equal and like..." abc

-- equality, qry can use the index
select * from watches where serial_num = '202301234567' ;

explain ( analyze, costs off )
select * from watches where serial_num = '202301234567' ;

\! read -p "equal condition uses index..." abc

select 'show how a like-qry does seq-scan...' ;

-- like condition, qry has to use seq-scan, bcse hash-index
-- even if no wildcard
select * from watches where serial_num LIKE '202301234567' ;

explain ( analyze, costs off )
select * from watches where serial_num LIKE '202301234567' ;

-- now with wildcard
select * from watches where serial_num LIKE '2023012345%' ;

explain ( analyze, costs off )
select * from watches where serial_num LIKE '2023012345%' ;

\! read -p "LIKE condition, even without wildcard needs seq scan, bcse hash-index..." abc

select ' pk from dflt-hash to range-asc' as change ; 

\set ECHO all

alter table watches drop constraint watches_pkey ; 
alter table watches add  primary key (serial_num asc ) ;

\set ECHO none

select 'try the like-conditions but now with index-ASC' as re_indexed  ;

-- like condition can now use index bcse range-index
select * from watches where serial_num LIKE '202301234567' ;

explain ( analyze, costs off )
select * from watches where serial_num LIKE '202301234567' ;


\! read -p "check LIKE condition, with range-ASC index ..." abc

-- and now with wildcard
select * from watches where serial_num LIKE '2023012345%' ;

explain ( analyze, costs off )
select * from watches where serial_num LIKE '2023012345%' ;

\! read -p "and LIKE condition with wildcard and range-ASC index ..." abc

-- now for more...


deallocate all ;

prepare watch_lookup  ( text ) as  
select * from watches where serial_num like $1||'%' ; 

execute watch_lookup ( '202301234567' ) ;

explain ( analyze, costs off )
execute watch_lookup ( '202301234567' ) ;

\! read -p "we prove the prepared-stmnt, now try with % in front..." abc

execute watch_lookup ( '%202301234567' ) ;

explain ( analyze, costs off )
execute watch_lookup ( '%202301234567' ) ;


-- create extension ... (need priv or superuser)

\set ECHO all

create extension pg_trgm ;

create index watches_trgm on watches using gin ( serial_num gin_trgm_ops ) ;

select show_trgm('2023') demo_trgm ;

\set ECHO none

\! read -p "check extention and index..." abc

select * from watches where serial_num like '%2023012345%' ;

explain (costs off)
select * from watches where serial_num like '%2023012345%' ;

\echo .
\echo .
\! read -p "check index now used, and we will demo trgm.." abc

select serial_num
, serial_num <-> '20230' distance
from watches where serial_num like '%20230%' 
order by 2 ;

-- show some of the workings
\echo ' ' 
\echo ' ' 

select serial_num
, serial_num <-> '20230' distance
, show_trgm ( serial_num ) 
from watches where serial_num like '%20230%' 
order by 2 ;

explain (analyze, costs off )
select *
from watches where serial_num like '%20230%' ;

\! read -p "above the result of distance, next view-sn-year..." abc

-- franck index with year and numbers
create unique index watches_sn_idx on watches ( 
  substr ( serial_num, 1, 4 ) desc, substr ( serial_num, 5 ) asc );

create view watches_sn as 
  select *
       , substr ( serial_num, 1, 4 ) sn_year
       , substr ( serial_num, 5 ) sn_digits
  from watches ;



\! read -p "EOF here.." abc



