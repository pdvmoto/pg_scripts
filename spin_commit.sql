
select 'spin_commit PG style' ;

-- drop table tst_lfs ;
create table tst_lfs (
  id  integer
, par_id integer
, payload text);

create unique index tst_lfs_pk on tst_lfs ( par_id, id ) ;

alter table tst_lfs add constraint tst_lfs_pk primary key ( par_id, id ) using index ;



select '  get an equiv of SID' ; 

select pg_backend_sid ();

select 'insert into tst_lfs' (
select generate_series
, pg_backend_pin()
, 'sometext'  
from generate_series ( 1, 4 ) 
) ;

-- demonstrate random
select id, par_id, payload, floor ( random() * 100) as int_0_100  from tst_lfs;

--  generate n records, catch doubles to allow multipel runs from 1 session.
insert into tst_lfs ( id, par_id, payload )
select generate_series, pg_backend_pid(),  
             'r:' || to_char ( generate_series, '999999') || 'par_id: '
             || to_char ( pg_backend_pid(), '999999' ) 
             -- || 'sysdate: ' || to_char ( sysdate, 'YYYY-MON-DD HH24:MI:SS' )
from generate_series ( 5, 100 )
;




