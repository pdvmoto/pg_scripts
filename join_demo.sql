
-- take the graph for joins and demo it.

alter table ja drop constraint  ja_ref_jb ; 
alter table jb drop constraint  jb_ref_ja ; 
drop table ja ; 
drop table jb ; 

create table ja ( 
  id      bigint
, a_payload   text 
, constraint ja_pk primary key ( id )
) ; 

create table jb ( 
  id      bigint
, b_payload   text 
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
select a.id, a.a_payload, b.id, b.b_payload equal_join
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

