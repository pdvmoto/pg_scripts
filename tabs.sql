
create table t01 ( id bigint primary key, payload text ) ;
create table t02 ( id bigint primary key, payload text ) ;
create table t03 ( id bigint primary key, payload text ) ;
create table t04 ( id bigint primary key, payload text ) ;
create table t05 ( id bigint primary key, payload text ) ;
create table t06 ( id bigint primary key, payload text ) ;
create table t07 ( id bigint primary key, payload text ) ;
create table t08 ( id bigint primary key, payload text ) ;
create table t09 ( id bigint primary key, payload text ) ;
create table t00 ( id bigint primary key, payload text ) ;


insert into t01 ( id, payload) select id, payload from t limit 100 ; 
insert into t02 ( id, payload) select id, payload from t limit 100 ; 
insert into t03 ( id, payload) select id, payload from t limit 100 ; 
insert into t04 ( id, payload) select id, payload from t limit 100 ; 
insert into t05 ( id, payload) select id, payload from t limit 100 ; 
insert into t06 ( id, payload) select id, payload from t limit 100 ; 
insert into t07 ( id, payload) select id, payload from t limit 100 ; 
insert into t08 ( id, payload) select id, payload from t limit 100 ; 
insert into t09 ( id, payload) select id, payload from t limit 100 ; 
insert into t00 ( id, payload) select id, payload from t limit 100 ; 

