
-- demonstrate very simple sql, timing and explain:

\timing
\echo 
\echo 
\set ECHO all

select * from region;
select * from region where region_id = 2;

\set ECHO none
\timing 

\echo
\echo
\! read -p "Two selects, check timing, and let me Explain..." abc

\set ECHO all

--                      select * from region;
explain (analyze, dist) select * from region;

\echo .
\echo .

--                      select * from region where region_id = 2;
explain (analyze, dist) select * from region where region_id = 2;

\set ECHO none

\echo 
\echo 
\! read -p "check the storage-read calls...seq-scan, all tablets.." abc

\set ECHO all

-- bonus: a like-condition that would be seq-scan on pg
                        select * from region where region_description like 'We%';
explain (analyze, dist) select * from region where region_description like 'We%';

\set ECHO none

\echo 
\echo 
\! read -p "searching without index, YB seems very Clever here.."  abc

\echo
\echo

-- alo try: 1 tablet

\echo 
\echo now try with single-tablet..
\echo 

\set ECHO all

drop table region1;
create table region1 ( 
  region_id             smallint primary key
, region_description    bpchar ) 
split into 1 tablets ;

insert into region1 select * from region ; 

\set ECHO none
\echo
\echo 

\! read -p "copy of the table, with 1 Single Tablet, let's check..." abc


\echo 
\echo 
\timing
\set ECHO all

select * from region1;
select * from region1 where region_id = 2;

\set ECHO none
\timing 

\echo
\echo
\! read -p "Two selects, 1 Tablet, first check timing, then Explain..." abc

\set ECHO all

--                      select * from region1;
explain (analyze, dist) select * from region1;

\echo .
\echo .

--                      select * from region1 where region_id = 2;
explain (analyze, dist) select * from region1 where region_id = 2;

\set ECHO none

\echo 
\echo 

\! read -p "Single tablet, seq_scan: storage-read calls..." abc

\echo 
\echo Did we show that sometimes, 1 Tablet is Enough?
\echo 

-- show tablets...
\set ECHO all
select relname, num_tablets, is_colocated
from ybx_tblinfo where relname like 'regio%';

\set ECHO none

