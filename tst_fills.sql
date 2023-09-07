
-- tst_fills.sql: tables with diff sharding, 
-- purpuse: test notably reading, explain..
-- public.t definition


/* 
DROP TABLE t01;
DROP TABLE t16;
*/

-- template tables to test with
CREATE TABLE t01 (
	id      bigint          /* from sequence                   */ 
, active  bpchar(1)       /* occasional Y, mostly N          */
, amount  numeric(10, 2)  /* some float                      */
, dt      timestamp       
, payload varchar(200)    /* some text                       */
, filler  varchar(750)    /* random, hard to compress string */
, CONSTRAINT t01_pkey PRIMARY KEY (id)
) split into 1 tablets ;

CREATE TABLE t16 (
	id      bigint 
, active  bpchar(1) 
, amount  numeric(10, 2)
, dt      timestamp 
, payload varchar(200) 
, filler  varchar(750) 
, CONSTRAINT t16_pkey PRIMARY KEY (id)
) split into 16 tablets ;

-- reset contents of tables.
delete from t;
delete from t01;
delete from t16 ;

alter sequenct t_seq restart with 1 ;

-- fill from t, notably using random filler.
-- and verify:

-- 100 records
select f_fillt_rndm ( 100 ) ;

insert into t01 select * from t limit 100 ;
insert into t16 select * from t limit 100 ;

select 
  id
, dt
, amount 
, substr (payload, 1, 30) payload
, substr ( filler, 1, 10) filler 
from t01 limit 10 ;

-- two tables, with different "spread", 
-- insert about 40K records in each, sufficient to be "noticed" when queried.


select id, payload from t01 where id = 42 ; 

explain (analyze, dist) select id, payload from t01 where id = 42 ; 

\timing on

insert into t01 select * from t; 
insert into t16 select * from t; 

-- to limit insert-size:
insert into t01 select * from t where t.id not in (select id from t01) ;
insert into t16 select * from t where t.id not in (select id from t16) ;

-- show nr tablets
select 
  relname, num_tablets 
from ybx_tblinfo 
where relname in ( 't01', 't16') 
;

-- now search the tables, hopefully using a seq-scan..
select id from t where strpos ( filler, 'abc' ) > 0 ; 

/*
notes:
 - make sure the data-volume is bigger than the cache-memory on tserver
 - compare between "spread" and "concentrated" tablets.. t01 = concentrated, t16 = spread out.
 - verify nr tablets and placement for t01 and t16
 - verify from inserts that spread is/not effective. writes show better in yutatool and dsar
 - create a spin-read loop, read for 30 sec ? (devise a $1 and $2 to vary nr of seconds and table to read...)
*/

