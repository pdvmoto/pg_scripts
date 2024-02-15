
# add data to t, see how far we get..

\echo .
\echo 'Inserting millions of rows in t, assume start at 40001..'
\echo .

\set ECHO all

\timing on

create sequence t_fill_seq start with 40001 ; 

insert into t
select  
  nextval ( 't_fill_seq' )                                as id
, case mod ( rownum+1, 10000 )  when 0 then 'Y' else 'N' end  as active
, mod ( rownum, 10000 ) / 100          as amount
, ( current_date - rownum )            as dt
,  rpad ( fnNumberToWords ( rownum ), 198) as payload
,  rpad ( '[ ', 740 ) || ']'           as  filler 
from ( select generate_series ( 0, 39999 ) as rownum ) as abc ; 

select cnt ('t')  recs_in_t ; 

\! sleep 4

insert into t
select  
  nextval ( 't_fill_seq' )                                as id
, case mod ( rownum+1, 10000 )  when 0 then 'Y' else 'N' end  as active
, mod ( rownum, 10000 ) / 100          as amount
, ( current_date - rownum )            as dt
,  rpad ( fnNumberToWords ( rownum ), 198) as payload
,  rpad ( '[ ', 740 ) || ']'           as  filler 
from ( select generate_series ( 0, 39999 ) as rownum ) as abc ; 

select cnt ('t')  recs_in_t ; 

\echo .
\echo 'Check the table T, lots of data now ... hm..??'
\echo .

-- \i fill_t.sql

\! read abc

\set ECHO none

