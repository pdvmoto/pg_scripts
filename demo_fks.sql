
drop table det ;
drop table fk1 ;
drop table fk2 ;
drop table fk3 ;

create table det ( 
  id bigint primary key
, fk1_id bigint
, fk2_id bigint 
, fk3_id bigint 
) split into 3 tablets ;

explain (analyze, costs off, dist, summary on ) insert into det select id, id, id from t where id < 2343 ; 

\! read -p 'inserted WITHOUT fks' abc
 
delete from det ; 

create table fk1 ( id bigint primary key, payload text )  split into 3 tablets;
insert into  fk1 select id, payload from t where id < 2343  ;
alter table det add constraint det_fk1 foreign key ( fk1_id ) references fk1 ( id) ; 

explain (analyze, costs off, dist, summary on ) insert into det select id, id, id from t where id < 2343 ; 

\! read -p 'inserted with ONE fk' abc
 
delete from det ; 

create table fk2 ( id bigint primary key, payload text ) ;
insert into  fk2 select id, payload from t where id < 2343  ;
alter table det add constraint det_fk2 foreign key ( fk2_id ) references fk2 ( id) ; 

create table fk3 ( id bigint primary key, payload text ) ;
insert into  fk3 select id, payload from t where id < 2343  ;
alter table det add constraint det_fk2 foreign key ( fk3_id ) references fk3 ( id) ; 

-- now insert into the details.
explain (analyze, costs off, dist, summary on ) insert into det select id, id, id from t where id < 2343 ; 

\! read -p 'inserted with THREE fks' abc
 
delete from det ; 

