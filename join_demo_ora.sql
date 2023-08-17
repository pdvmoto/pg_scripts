
-- take the graph for joins and demo it.
-- for oracle: bigint -> number(9,0), text -> varchar2(100)

alter table ja drop constraint  ja_ref_jb ; 
alter table jb drop constraint  jb_ref_ja ; 
drop table ja ; 
drop table jb ; 

column a_id format 9999
column a_pay format A10
column b_id format 9999
column b_pay format A10

column equal_join format A20
column inner_join format A20

column left_join format A20
column right_join format A20

column left_join_b_null format A20
column right_join_a_null format A20

column full_outer_join format A20
column full_outer_join_nulls format A22

create table ja ( 
  id          number ( 9,0) 
, a_payload   varchar2(100) 
, constraint ja_pk primary key ( id )
) ; 

create table jb ( 
  id      number ( 9,0) 
, b_payload   varchar2(100) 
, constraint jb_pk primary key ( id )
) ; 

-- not sure I should not better do par-chd.. ?


insert into ja values ( 10, 'a=10 noref' ) ; 
insert into ja values ( 11, 'a=11 ref' ) ; 
insert into ja values ( 20, 'a=20 noref' ) ; 
insert into ja values ( 22, 'a=22 ref' ) ; 

insert into jb values ( 01, 'b=01 noref' ) ; 
insert into jb values ( 11, 'b=11 ref' ) ; 
insert into jb values ( 02, 'b=02 noref' ) ; 
insert into jb values ( 22, 'b=22 ref' ) ; 



-- conventional oracle join, inner
select a.id a_id, a.a_payload a_pay, b.id b_id, b.b_payload equal_join
from ja a
   , jb b
where a.id = b.id 
order by a.id, b.id ; 

-- inner join
select a.id, a.a_payload, b.id, b.b_payload inner_join
from ja a
inner join jb b on ( b.id = a.id )  
order by a.id, b.id ;  

-- left join
select a.id, a.a_payload, b.id, b.b_payload left_join
     from ja a
left join jb b on ( b.id = a.id )  
order by a.id, b.id ;  

-- left join, nulls
select a.id, a.a_payload, b.id, b.b_payload left_join_b_null
     from ja a
left join jb b on ( b.id = a.id )  
where b.id is null
order by a.id, b.id ;  

-- right join
select a.id, a.a_payload, b.id, b.b_payload right_join
     from ja a
right join jb b on ( b.id = a.id )  
order by a.id, b.id ;  

-- right join
select a.id, a.a_payload, b.id, b.b_payload right_join_a_null
     from ja a
right join jb b on ( b.id = a.id )  
where a.id is null
order by a.id, b.id ;  

-- full outer join
select a.id, a.a_payload, b.id, b.b_payload full_outer_join
     from ja a
full outer join jb b on ( b.id = a.id )  
order by a.id, b.id ;  

-- full outer join, nulls
select a.id, a.a_payload, b.id, b.b_payload full_outer_join_nulls
     from ja a
full outer join jb b on ( b.id = a.id )  
where ( a.id is null or b.id is null )
order by a.id, b.id ;  

