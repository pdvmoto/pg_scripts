
\echo demo_fexpl.sql: 
\echo .
\echo demo explain-analyze-dist Does Not report all the underlying storage-calls
\echo .

\echo .
\echo need a parent and child set of tables, use catalog to generate some data
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
select 'parent: ' || p.p_name || ' has ' || count (*) || ' related chds.'
 from demo_fnc_par p
    , demo_fnc_chk c
where c.c_id = p.p_id
  and p.p_id = $1
group by p.p_name ;
$$
language sql stable ;


\echo .
\echo Count chd per par...
\echo .
select 'parent: ' || p.p_name || ' has ' || count (*) || ' related chds.'
 from demo_fnc_par p
    , demo_fnc_chk c
where c.c_id = p.p_id
  and p.p_id = 11
group by p.p_name ;


explain ( analyze, dist)
select 'parent: ' || p.p_name || ' has ' || count (*) || ' related chds.'
 from demo_fnc_par p
    , demo_fnc_chk c
where c.oid = p.oid
  and p.oid = 11
group by p.p_name ;


select 
from demo_fnc_par
where p_id = 11 ; 


\echo .
\echo .
\echo ------------- demo done ------------------
\echo .
\! read -p "enter to cleanup or control C to keep objects and data" abc

drop table demo_fnc_chd ;
drop table demo_fnc_par ;

