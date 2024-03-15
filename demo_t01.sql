
create schema user1 ;
create schema user2 ;
create schema user2 ;

create table user1.t01 ( id bigint primary key, payload text ) ; 
create table user2.t01 ( id bigint primary key, payload text ) ; 
create table user3.t01 ( id bigint primary key, payload text ) ; 

create index t01_i1 on user1.t01 ( payload, id ) ; 
create index t01_i1 on user1.t01 ( payload, id ) ; 
create index t01_i1 on user1.t01 ( payload, id ) ; 

