
\echo demo_x1.sql: 
\echo .
\echo demo explain-analyze-dist and find out..
\echo .

/*  ----- notes ------


 - for postgres, remove the split and the dist. consider using :x or other variables for this
 - 


    ------------------ 
*/

-- always show version just in case
select version() ;

\echo .
\echo Creating tables..need a parent and child, use catalog to generate some data
\echo .
create table demo_par  
  ( p_id        bigint primary key
  , p_name      text
  )
  split into 8 tablets 
;

create table demo_chd 
  ( c_id      bigint primary key
  , p_id      bigint 
  , c_name    text
  )
  split into 8 tablets 
; 

-- note pk of chd does not contain parent, we deliberately spread out the data
-- and we omit an index on pk, let the join do the work to collect the data
alter table demo_chd 
  add constraint demo_chd_fk1 foreign key ( p_id ) 
  references demo_par ( p_id ) ;

\echo .
\echo put in some data
\echo .
\echo parents...
insert into demo_par 
  select oid      as p_id
       , nspname  as p_name
  from pg_namespace ;

\echo .
\echo children...
insert into demo_chd  ( c_id, p_id, c_name )
  select c.oid     
       , n.oid    
       , c.relname 
  from pg_class c
     , pg_namespace n
  where c.relnamespace = n.oid ;

--analyze demo_par ;
--analyze demo_chd ;

\echo .
\echo two tables with some data and minimal indexing.
\echo .
\! read -t9 -p"Hit Enter to continue..." abc

\echo .
\echo ------ start of demo statements ------- 
\echo .
\echo Simple select of few rows.. 

\set ECHO all
                           select * from demo_par ;
explain (analyze, dist, buffers) select * from demo_par ;
\set ECHO none

\echo .
\echo result of simple select
\echo storage calls should correspond to nr of tablet ?
\echo .
\! read -p "hit enter to continue..." abc

\set ECHO all
                           select * from demo_par where p_id = 11 ;
explain (analyze, dist, buffers) select * from demo_par where p_id = 11 ;
\set ECHO none

\echo .
\echo result of select for 1 record on pk
\echo storage calls should correspond to 1 tablet ?
\echo
\! read -p "hit enter to continue..." abc

\set ECHO all
                           select * from demo_chd where p_id = 11 ;
explain (analyze, dist, buffers) select * from demo_chd where p_id = 11 ;
\set ECHO none

\echo .
\echo subset of chd table using p_id, no index, should scan entire table
\echo storage calls should correspond to whole table ?
\echo
\! read -p "hit enter to continue..." abc

\set ECHO all
                           select * from demo_chd where c_name like '%' ;
explain (analyze, dist, buffers) select * from demo_chd where c_name like '%' ;
\set ECHO none

\echo .
\echo subset of chd table using like c_name, no index, should scan entire table
\echo storage calls should correspond to whole table ?
\echo
\! read -p "hit enter to continue..." abc


\echo ------------- demo done ------------------
\echo .
\! read -t 9 -p "enter to cleanup or control C to keep objects and data" abc
\echo .

-- drop table demo_chd ;
-- drop table demo_par ;

