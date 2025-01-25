

/* 
demo_fill.sql:  create table t, to fill with data if needed
note: script should be near-identical to demo_xyz.sql for oracle

additional todo-items
 - a data-browser needed!
 - id and date automatically

note: needs n2words.sql.

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
) split into 4 tablets  ;

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
, ( now() )                                as dt   /* cant use bigint??i  */ 
, rpad ( fnNumberToWords ( s.id ), 198)    as payload
, rpad ( '[ ', 740 ) || ']'                as  filler 
from s
; 

\set ECHO none

\echo Create the function to generate multi...
\echo Later: add filler y/n, length, etc...

\timing on
\set ECHO all

create or replace function
f_fill_t ( nr_to_add bigint ) returns bigint
as
$body$
declare
  result     integer;
  query      varchar;
  txt_filler text ;  -- use this to insert Random-Garbage to fill
begin

  --  later: add filler = 
  --... use f_rndmstr () to add un-compressable txt

  with s as ( select nextval('t_seq') as id
                from ( select generate_series ( 1, nr_to_add ) ) as sub
            )
  insert into t
  select
    s.id                                     as id
  , case mod ( s.id+1, 10000 )  when 0 then 'Y' else 'N' end  as active
  , mod ( s.id, 10000 ) / 100                as amount
  , ( now ()   )            as dt   /* cant use bigint??i  */
  , rpad ( fnNumberToWords ( s.id ), 198)    as payload
  , rpad ( '[ ', 740 ) || ']'                as  filler
  from s
  ;

  /* check for exception or results here... later */ 

  return ( nr_to_add ) ;

end;
$body$
language plpgsql;

-- test, and verify count
select f_fill_t ( 1 ) ;

select count (*) from t ; 

\set ECHO none

\echo 'Table t and funtion f_fill_t ( nr bigint ) are ready to use..'

/*  --- add volume to table... */


create or replace function
f_fill_t_rndm ( nr_to_add bigint ) returns bigint
as
$body$
declare
  result     integer;
  query      varchar;
  txt_filler text ;  -- use this to insert Random-Garbage to fill
begin

  --  later: add filler = 
  txt_filler := f_rndmstr ( 740 ) ;

  with s as ( select nextval('t_seq') as id
                from ( select generate_series ( 1, nr_to_add ) ) as sub
            )
  insert into t
  select
    s.id                                     as id
  , case mod ( s.id+1, 10000 )  when 0 then 'Y' else 'N' end  as active
  , mod ( s.id, 10000 ) / 100                as amount
  , ( current_date  /* -  s.id::int */   )   as dt   /* cant use bigint??  */
  , rpad ( fnNumberToWords ( s.id ), 198)    as payload
  , f_rndmstr ( 740 )                        as  filler  /* make it hard to compress */
  --, txt_filler                               as  filler
  from s
  ;

  /* check for exception or results here... later */ 

  return ( nr_to_add ) ;

end;
$body$
language plpgsql;

-- just timestamp records, typically just 1 ---------------
create or replace function
f_fill_t_now ( nr_to_add bigint ) returns bigint
as
$body$
declare
  result     integer;
  query      varchar;
  txt_filler text := '' ;  -- use this to insert Random-Garbage to fill
begin

  with s as ( select nextval('t_seq') as id
                   , pgs.setting      as hostadr
                from ( select generate_series ( 1, nr_to_add ) ) as sub
                   , pg_settings pgs
                where pgs.name = 'listen_addresses'
            )
  insert into t
  select
    s.id                                     as id
  , case mod ( s.id+1, 10000 )  when 0 then 'Y' else 'N' end  as active
  , mod ( s.id, 10000 ) / 100                as amount
  , now ()                                   as dt   /* timestamp, ms  */
  , rpad ( fnNumberToWords ( s.id ), 198)    as payload
  ,   '{ "client":"clientinfo"' ||  ', " host":"' || s.hostadr || 
     '"}'                                    as  filler
  from s
  ;

  /* check for exception or results here... later */ 

  return ( nr_to_add ) ;

end;
$body$
language plpgsql;

select  f_fill_t      ( 20 ) ;
select  f_fill_t_rndm ( 20 ) ;
select  f_fill_t_now  ( 20 ) ;

