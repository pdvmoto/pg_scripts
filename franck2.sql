
-- try recreating index demo

drop table if exists one, many;
create extension if not exists pgcrypto;

create table one (
 primary key (one_id)
 , one_id uuid default gen_random_uuid()
 , category text
 , created_at timestamptz default clock_timestamp()
);

insert into  one (category)
  with categories(category) as (
   values ('🍎'), ('🍊'), ('🍌'), ('🍒'), ('🍐') 
  ) select category from generate_series(1,1000), categories
;

create table many( 
 primary key (many_id)
 , many_id uuid default gen_random_uuid()
 , one_id uuid not null references one(one_id)
 , value float
);

insert into  many(one_id , value) 
 select one_id , random()
 from one  cross join generate_series(1,5);

-- queries
select one.category, one.created_at, many.value
 from one
 left outer join many using(one_id)
 where one.category='🍌'
 order by one.created_at desc
 limit 42
;

-- Access to "one" by category, ordered by "created_at"
create index one_category_hash_created_desc_id
 on one(category, created_at desc, one_id)
;

-- Access to "many" by its foreign key to "one"
create index many_one_asc
 on many ( one_id ) include ( value )
;

-- modiefied copy/paste

explain (costs off)
select one.category, one.created_at, many.value  from one
 left outer join many using(one_id)
 where one.category='🍌'
 order by one.created_at desc
 limit 42;

explain (costs off, analyze, dist, debug, summary off)
select one.category, one.created_at, many.value  from one
 left outer join many using(one_id)
 where one.category='🍌'
 order by one.created_at desc
 limit 42;

