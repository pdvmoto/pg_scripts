
/* 
drop table obj;
drop sequence bench_seq ;
*/
create sequence bench_seq ;

create table obj as (
select nextval ('bench_seq' ) as objid, schemaname, tableowner, tablename 
from pg_tables 
)
;

alter table obj add constraint obj_pk primary key ( objid ) ; 

insert into obj 
select nextval ('bench_seq' ) as objid, schemaname, tableowner, tablename 
from pg_tables ; 


insert into obj 
select nextval ('bench_seq' ) as objid, schemaname, tableowner, tablename 
from obj limit 100000 ; 

select cnt ('obj' ) ; 

