

/* 
demo_crfill.sql:  create table t, to fill with data if needed cockraoch
note: script should be near-identical to demo_xyz.sql for oracle, pg, and yb

additional todo-items
 - a data-browser needed!, connect dbeaver
 - id and date automatically

note: needs n2words.sql, some clever date-funccion
note: need some random-generator for filler.. sigh

*/

\set ECHO none

-- drop table t ;
-- drop sequence t_seq ;

\set echo none

\echo .
\echo ' ____ original demo starts here... ____'
\echo .

\set ECHO all

create sequence t_seq ;

create table t 
( id                bigint     primary key  
, active            char ( 1 )        -- Y/N, show small set of Active.
, amount            numeric ( 10,2 )  -- supposedly some amount of money.
, dt                timestamp         -- some date, case we want history stuff
, payload           varchar ( 200 )   -- some text , can be spoken word
, filler            varchar ( 750 )  -- some data to create 1K recordsize
) /* split into 1 tablets  */ ;

\set ECHO none

\echo Insert 1 record, as demo..

\timing
\set ECHO all

with s as ( select nextval('t_seq') as id 
              from ( select generate_series ( 0, 0 ) ) as sub 
          ) 
insert into t
select  
  s.id                                     as id
, case mod ( s.id+1, 10000 )  when 0 then 'Y' else 'N' end  as active
, mod ( s.id, 10000 ) / 100                as amount
,  now()                                   as dt   /* cant use bigint??i  */ 
, lpad (  format ( ' id = %s ', s.id ), 198)                              as payload
, lpad ( '[ ' ||  format ( 'dec %s random  %s', pi(), random()  ) || ']', 750)  as  filler 
from s
; 

\set ECHO none

\echo .
\! read -p "first record inserted ?" abc


\timing on
\set ECHO all


select count (*) from t ; 
select id, dt, amount, active, payload from t;

\set ECHO none

\echo 'Table t ready to use..'
\echo 'add shell script to fill with data, bcse no plsql'

\! read -p "control-C to stop, or enter to run fucntions-erross" abc


/*  --- add volume to table... */




