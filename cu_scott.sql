
-- drop database scott ; 
-- drop database scott ; 
-- drop schema scott
-- drop user scott ; 

create database scott ; 

create user scott with superuser password 'tiger';
create role scott ;

create schema scott authorization scott ;

grant all on database   scott       to scott with grant option ;
grant all on schema     scott       to scott with grant option ;
-- grant all on tablespace scott to scott with grant option ; -- if tablespace 


-- now reconnect and create some utilities.

\c scott scott


\i n2words.sql

\i mk_fcnt.sql



