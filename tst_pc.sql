
-- test parent-child..
-- aim: put children of 1 parent together in same tablet.

/* 
notes:
 - also consider with generated keys (or usesysid) versus natural keys...

*/

drop table chd_chd ; 
drop table chd ; 
drop table par ;

-- create parent + child to use at least 4 tablets each
-- so visits to multiple tablets will show.

-- it started simple, but column types should be simplre:
create table par as select usename, usesysid                    from pg_user; 
create table chd as select schemaname, tablename, tablespace    from pg_tables ; 
create table chd_chd as select table_schema, table_name, column_name, ordinal_position 
                                                                from information_schema.columns ; 

-- now do it better, with simple columns, relations, and indexes...

drop table cc ; 
drop table c ; 
drop table p ;

create table p (
  schemaname  text
, usesysid    bigint
, constraint   p_pk primary key ( schemaname hash )
, constraint   p_unq unique ( usesysid )
) ;

create table c (
  schemaname text
, tablename  text
, tablespace text 
, constraint c_pk primary key  ( schemaname, tablename ) 
, constraint c_fk_schema foreign key ( schemaname ) references p ( schemaname ) 
) ; 

create table cc (
  schemaname text
, tablename text
, column_name text
, ord_pos integer
, constraint cc_pk primary key ( schemaname, tablename, column_name ) 
, constraint cc_fk_table foreign key ( schemaname, tablename ) references c ( schemaname, tablename ) 
) ; 

insert into p 
select usename, usesysid                  from pg_user ; 

-- hmmm.. add schemanames that are missing, distinct is not elegant, but effective
insert into p ( schemaname ) 
select distinct schemaname from pg_tables t
where not exists (select 1 from p where p.schemaname = t.schemaname ) ;

insert into p ( schemaname ) 
select distinct schemaname from pg_views t
where not exists (select 1 from p where p.schemaname = t.schemaname ) ;


-- tables and views...
insert into c
select schemaname, tablename, tablespace  from pg_tables ;

insert into c
select schemaname, viewname, 'view' from pg_views ; 


-- columns
insert into cc 
select table_schema, table_name, column_name, ordinal_position 
                                          from information_schema.columns ;

-- now we have p, c and cc.. 
-- all done in default, hash indexing..
-- let's see what happens if we go find children of a parent.
