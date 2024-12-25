
-- drop database scott ; 
-- drop database db_scott ; 
-- drop schema scott
-- drop user scott ; 

create database db_scott ; 

create user scott with superuser password 'tiger';
create role scott ;

create schema scott authorization scott ;

grant all on database   db_scott to scott with grant option ;
grant all on schema     scott       to scott with grant option ;
-- grant all on tablespace scott to scott with grant option ; -- if tablespace 


-- now reconnect and create some utilities.

\c db_scott scott


\i n2words.sql

\i mk_fcnt.sql



