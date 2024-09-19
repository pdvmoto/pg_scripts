
\set n_sec 900 

-- table usable for interval from to
drop table ybx_cutoff ;
create temp table ybx_cutoff ( 
  host text primary key 
, sincedt timestamp 
, until timestamp 
);

\d ybx_cutoff

insert into ybx_cutoff 
  select  get_host()
       , ( now() - make_interval ( secs=>:n_sec ) )
       , now () ;

select * from ybx_cutoff ;

-- check current_node via view...
select  count (*)       cnt_v_ash
      ,                 c.sincedt
--    , ya.host     as  busiest_ash
      , c.host      as  this_host
from yb_active_session_history ya
   , ybx_cutoff c
where ya.sample_time > c.sincedt
group by c.sincedt, c.host
order by 1 desc, 3 
limit 10;

select  count (*)       cnt
      ,                 c.sincedt
      , ya.host     as  ash_host
      , c.host      as  this_host
from ybx_ash     ya
   , ybx_cutoff  c
where ya.sample_time > c.sincedt
group by c.sincedt, ya.host, c.host
order by 1 desc, 3 
limit 10;


-- busiest nodes in sample
-- with cutoff as ( select now() - make_interval (secs => :n_sec )  as sincedt )
select
   count (*)                                             recs_in_intrv
, to_char ( min (sample_time), 'YYYY-MM-DD HH24:MI:SS' ) oldest_stored
, to_char ( max (sample_time), 'YYYY-MM-DD HH24:MI:SS' ) latest_stored
, to_char (  age ( now (), max(sample_time) ), 'ssss' )  secs_ago
, a.host
from ybx_ash a, ybx_cutoff c
where sample_time > c.sincedt
group by a.host
order by a.host ;

