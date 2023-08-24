

-- get os data from program into tbl, then parse..

drop table ut_getos ;

create table ut_getos ( id bigserial primary key, payload text ) ;

-- try reading from ls:
copy ut_getos ( payload) from program 'ls -ltra' ; 

select * from ut_getos order by id;


