
-- run this script to check if a DB can do colocation.

create table coloc_chk_true ( id bigint primary key, payload text )
with (colocation = true ) ;

create table coloc_chk_dflt ( id bigint primary key, payload text ) ; 

-- split without option will only work in dflt-non-coloc... ?
create table coloc_chk_false ( id bigint primary key, payload text ) 
split into 2 tablets ;

select schemaname, tableowner, tablename from pg_tables where tablename like 'coloc_chk%';

\d+ coloc_chk_ok

\d+ coloc_chk_dflt

\d+ coloc_chk_false

-- cleanup
drop table coloc_chk_true;
drop table coloc_chk_dflt ;
drop table coloc_chk_false ;
