
drop  index t16_dt_etc ;
drop  index t16_dt_etc_asc  ;
drop  index t16_dt ;
drop  index t16_dt_asc ;

\d t01

\echo .
\set ECHO all

explain ( analyze, dist ) 
select id, dt, substr ( payload, 1, 10) as payld 
from t01 where id = 42 ;

explain ( analyze, dist ) 
select id, dt, substr ( payload, 1, 10) as payld 
from t16 where id = 42 ;

\set ECHO none
\echo .
\! read -p "fetching 1 row, pkey index, 1 storage call... " abc

\echo .
\set ECHO all

explain ( analyze, dist ) 
select id, dt, substr ( payload, 1, 10) as payld 
from t01 where id between 80 and 100 ;

explain ( analyze, dist ) 
select id, dt, substr ( payload, 1, 10) as payld 
from t16 where id between 80 and 100 ;

\set ECHO none
\echo .
\! read -p "fetching id-range, seq-scan, but unexpected 2 calls for t16 ... " abc

\echo .
\set ECHO all

explain ( analyze, dist ) 
select id, dt, substr ( payload, 1, 10) as payld 
from t16 where id between 0 and 100 ;

\set ECHO none
\echo .
\! read -p "seq-scan, even when fetching all rows, only 2 calls ... " abc


\echo .
\set ECHO all

explain ( analyze, dist ) 
select id, dt, substr ( payload, 1, 10) as payld 
from t01 where dt > ( now() - interval '30 days' ) ;

explain ( analyze, dist ) 
select id, dt, substr ( payload, 1, 10) as payld 
from t16 where dt > ( now() - interval '30 days' ) ;

\set ECHO none
\echo .
\! read -p "notice date-range, needs a seq-scan ... " abc

\echo .
\set ECHO all

create index t16_dt_etc on t16 ( dt, id, payload ) ;

explain ( analyze, dist ) 
select id, dt, substr ( payload, 1, 10) as payld 
from t16 where dt > ( now() - interval '30 days' ) ;

\set ECHO none
\echo .

\! read -p "date-range, with covering (default) index, any improvement? ... " abc

\echo .
\set ECHO all

create index t16_dt_etc_asc on t16 ( dt ASC, id, payload ) ;

explain ( analyze, dist ) 
select id, dt, substr ( payload, 1, 10) as payld 
from t16 where dt > ( now() - interval '30 days' ) ;

\set ECHO none
\echo .

\! read -p "date-range, with covering ASC index, now probably better ... " abc

\echo .
\set ECHO all

\d t16

\set ECHO none

\echo .
\echo Check the definitions of the indexes on t16... 
\echo Lesson : A Hash-index is not useful for a Range query.
\echo .

\echo ------ extra: if index is not covering, what kind of loopoing.. ----

drop index t16_dt_etc ;
drop index t16_dt_etc_asc ;

\echo .
\set ECHO all

create index t16_dt on t16 ( dt ) ;

explain ( analyze, dist )
select id, dt, substr ( payload, 1, 10) as payld
from t16 where dt > ( now() - interval '30 days' ) ;

\set ECHO none
\echo .

\! read -p "hash-index only on dt, no help yet ... " abc

\echo .
\set ECHO all

create index t16_dt_asc on t16 ( dt asc) ;

explain ( analyze, dist )
select id, dt, substr ( payload, 1, 10) as payld
from t16 where dt > ( now() - interval '30 days' ) ;

\set ECHO none
\echo .

\! read -p "ordered-index 1-call to index, but would  expect more calls to table ... " abc



 

