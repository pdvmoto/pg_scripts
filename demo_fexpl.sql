
\echo demo_fexpl.sql: 
\echo .
\echo demo explain-analyze-dist Does Not report all the underlying storage-calls
\echo .

\echo .
\echo Creating tables..need a parent and child, use catalog to generate some data
\echo .
create table demo_fnc_par  
  ( p_id        bigint primary key
  , p_name      text
  )
  split into 8 tablets 
;

create table demo_fnc_chd 
  ( c_id      bigint primary key
  , p_id      bigint 
  , c_name    text
  )
  split into 8 tablets 
; 

-- note pk of chk does not contain parent, we deliberately spread out the data
-- and we omit an index on pk, let the join work to collect the data
alter table demo_fnc_chd 
  add constraint demo_fnc_chd_fk1 foreign key ( p_id ) 
  references demo_fnc_par ( p_id ) ;

\echo .
\echo put in some data, parents, children...
\echo .
\echo parents...
insert into demo_fnc_par 
  select oid      as p_id
       , nspname  as p_name
  from pg_namespace ;

\echo .
\echo children...
insert into demo_fnc_chd  ( c_id, p_id, c_name )
  select c.oid     
       , n.oid    
       , c.relname 
  from pg_class c
     , pg_namespace n
  where c.relnamespace = n.oid ;

\echo .
\echo function to do join and formatting
create or replace function fn_show_cnt ( bigint )
returns text
as
$$
select 'sql_func: p: ' || p.p_name || ' has ' || count (*) || ' chds, and max: ' || max ( c_name ) || '.'
 from demo_fnc_par p
    , demo_fnc_chd c
where p.p_id = c.p_id
  and p.p_id = $1
group by p.p_name ;
$$
language sql stable ;

create or replace function fn_show_cnt_pl ( p_pid bigint )
returns text
stable 
language plpgsql
as
$function$
DECLARE
  txt_result text := 'init result as blank';
BEGIN
select 'plpgsql_func: par: ' || p.p_name || ' has ' || count (*) || '  chds and max ' || max ( c_name ) || '.'
into txt_result 
 from demo_fnc_par p
    , demo_fnc_chd c
where c.p_id = p.p_id
  and p.p_id = $1
group by p.p_name ;

 RAISE NOTICE 'fn_show_cnt_pl :p_id [%] result [%].', p_pid, txt_result ;

return txt_result ;
END ;
$function$
;

\echo debug first, remvoe this whem finished
select p.p_id, p.p_name, sum (c_id) as debug_sum, max ( c.c_name ) as debug_maxname 
from demo_fnc_chd c
   , demo_fnc_par p  
where p.p_id = 11 
and c.p_id = p.p_id  
group by p.p_id, p.p_name  ;

\echo debug stuff.. check first results
\! read -p "hit enter to congtinue ..." abc


\echo .
\echo Count via query, chd per par...
\echo .
select 'plain sql : par: ' || p.p_name || ' has ' || count (*) || ' chds and max ' || max ( c_name ) || '.' as plain_sql
 from demo_fnc_par p
    , demo_fnc_chd c
where c.p_id = p.p_id
  and p.p_id = 11::bigint
group by p.p_name ;


explain ( analyze, dist)
select 'plain sql : par: ' || p.p_name || ' has ' || count (*) || ' chds and max ' || max ( c_name ) || '.' as plain_sql
 from demo_fnc_par p
    , demo_fnc_chd c
where c.p_id = p.p_id
  and p.p_id = 11::bigint
group by p.p_name ;


\echo .
\echo reported the nr of chd for a parent, note the explain-plan, the effort
\echo .
\! read -p"hit enter to continue..." abc

select  fn_show_cnt ( p.p_id ) as result_from_func_sql
from demo_fnc_par p
where p.p_id = 11 ;

explain (analyze, dist ) 
select  fn_show_cnt ( p.p_id ) as result_from_func_sql
from demo_fnc_par p
where p.p_id = 11::bigint ; 

\echo .
\echo now via sql_functioncall, note the explain-plan, the effort
\echo .
\! read -p"hit enter to continue..." abc


select  fn_show_cnt_pl ( p.p_id ) as result_from_func_plpgsql
from demo_fnc_par p
where p.p_id = 11::bigint ;

explain (analyze, dist ) 
select  fn_show_cnt ( p.p_id ) as result_from_func_plpgsql
from demo_fnc_par p
where p.p_id = 11::bigint ; 

\echo .
\echo now via sql_functioncall, note the explain-plan, the effort
\echo .
\! read -p"hit enter to continue..." abc

\echo .
\echo .
\echo ------------- demo done ------------------
\echo .
\! read -t 5 -p "enter to cleanup or control C to keep objects and data" abc
\echo .

-- drop table demo_fnc_chd ;
-- drop table demo_fnc_par ;

