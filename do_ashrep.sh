#!/bin/sh
#
# do_ashrep.sh: fill table with 1st and last dates for repoting.
#
# arg1 : start report arg1 seconds ago
# arg2 : duration of interval in seconds
#
# fill two timestamps with first and last timestamp to report between
#
# set -v -x 

# arg1 defaults to 900 sec or 15min  $1
n_sec_start=900
n_sec_start="${1:-$n_sec_start}"
n_sec_intvl=900
n_sec_intvl="${2:-$n_sec_intvl}"

echo do_ashrep.sh: start $n_sec_start sec ago and take $n_sec_intvl sec interval

# pick up the host name...
export hostnm=`hostname`

ysqlsh -X postgresql://yugabyte@localhost:5432,localhost:5433,localhost:5434?connect_timeout=2 <<EOF

  insert into ybx_ash_rep ( remark_txt, first_dt, last_dt ) 
  select 'report from script do_ashrep.sql' 
       , now() - make_interval ( secs => $n_sec_start ) 
       , now() - make_interval ( secs => ( $n_sec_start - $n_sec_intvl )::int ) ; 


  select id, first_dt, last_dt from ybx_ash_rep order by id ; 

  \timing on

  with intv as  /* q01 from and to */
  ( select first_dt, last_dt 
    from ybx_ash_rep r where r.id = ( select max (r2.id) from ybx_ash_rep r2 )
  )
  select 'report on interval :' as titl
       , to_char ( i.first_dt, 'YYYY-DD-MM HH24:MI:SS' )  as from_dt 
       , to_char ( i.last_dt , 'YYYY-DD-MM HH24:MI:SS' )  as to_dt
       , count (*)  cnt_samples
  from ybx_ash a, intv i 
  where sample_time between i.first_dt and i.last_dt 
  group by 1, 2, 3;
        

  with intv as  /* q02 crosstab nrs*/
  ( select first_dt, last_dt 
    from ybx_ash_rep r where r.id = ( select max (r2.id) from ybx_ash_rep r2 )
  )
  select
    to_char ( a.sample_time, 'DDD DY HH24:MI:00') as     dt_hr
  ,            a.host
  , count (*)  smpls_per
  from ybx_ash a, intv i 
  where 1=1
  --and wait_event_component not in ('YCQL')
  and a.sample_time between i.first_dt and i.last_dt
  group by 2, 1     /* host , to_char ( a.sample_time, 'DDD DY HH24:MI:00') */
  order by 1, 2 \crosstabview
  ;

  -- busiest nodes in sample
  with intv as  /* q03 busiest nodes*/
  ( select first_dt, last_dt 
    from ybx_ash_rep r where r.id = ( select max (r2.id) from ybx_ash_rep r2 )
  )
  select
     count (*)                                             recs_in_intrv
  , to_char ( min (sample_time), 'YYYY-MM-DD HH24:MI:SS' ) oldest_stored
  , to_char ( max (sample_time), 'YYYY-MM-DD HH24:MI:SS' ) latest_stored
  , to_char (  age ( now (), max(sample_time) ), 'ssss' )  secs_ago
  , a.host
  from ybx_ash a, intv i
  where 1=1 
  and a.sample_time between i.first_dt and i.last_dt
  group by a.host
  order by a.host ;


  with intv as  /* q04 busiest components*/
  ( select first_dt, last_dt 
    from ybx_ash_rep r where r.id = ( select max (r2.id) from ybx_ash_rep r2 )
  )
  select 
          count (*)             cnt
        , a.host
        , wait_event_component  busiest_comp
        , wait_event_class
  --, host
  from ybx_ash a
     , intv i
  where 1=1
  and a.sample_time between i.first_dt and i.last_dt
  group by a.host, a.wait_event_component , a.wait_event_class -- , c.host
  order by 1 desc, 2
  ;

  -- busiest events
  with intv as  /* q05 busiest class, type, event p host */
  ( select first_dt, last_dt 
    from ybx_ash_rep r where r.id = ( select max (r2.id) from ybx_ash_rep r2 )
  )
  select count (*) cnt
      , wait_event_class
      , wait_event_type
      , wait_event   as   busiest_event
      , ya.host      as   per_host
  from ybx_ash ya
     , intv i
  where 1=1
  and ya.sample_time between i.first_dt and i.last_dt
  group by wait_event_class, wait_event_type, wait_event, host
  order by 1 desc 
  limit 40;


  \! echo .
  \! echo now the busiest tablets per host.
  \! echo .
  with intv as  /* q06 busiest tablets and tables */
  ( select first_dt, last_dt 
    from ybx_ash_rep r where r.id = ( select max (r2.id) from ybx_ash_rep r2 )
  )
  select count (*)  cnt
      ,             a.host
      ,             a.wait_event_aux
      ,             yt.ysql_schema_name
      ,             yt.table_name
  from ybx_ash   a
     , ybx_tblt  yt
     , intv      i
  where 1=1
  and   a.sample_time between i.first_dt and i.last_dt
  and   substr ( yt.tablet_id, 1, 15) = a.wait_event_aux
  and   yt.host = a.host     -- on same host as ahs-record
  and   yt.gone_time is null -- only active tablets
  and   a.wait_event_aux is not null
  -- and wait_event_component not in ('YCQL')
  group by a.host, a.wait_event_aux, yt.ysql_schema_name, yt.table_name
  order by 1 desc, 2
  limit 40 ;

  -- find queries, and later: top-root-req, to see if many rreq
  with intv as  /* q10 qry per root_request */
  ( select first_dt, last_dt 
    from ybx_ash_rep r where r.id = ( select max (r2.id) from ybx_ash_rep r2 )
  )
  select count (*)
      --, min (sample_time) , max(sample_time)
      , count ( distinct ya.root_request_id  )    nr_rreq
      , ya.query_id                               top_qry
      , substr ( q.query, 1, 200)              as Query
      --, max ( substr ( ya.query, 1, 200)  )  as Query
  from ybx_ash      ya
     , ybx_pgs_stmt q
     , intv         i
  where 1=1
  and   ya.sample_time between i.first_dt and i.last_dt
  and   ya.query_id = q.queryid
  and   ya.root_request_id::text not like '000%'
  --and   ya.root_request_id::text like 'd1dc9%'
  group by ya.query_id, q.query
  order by 1 desc
  limit 40;


  -- try looking for qry via id, using saved pgs_stmnt
  with intv as  /* q11 qry per root-req and per qry  */
  ( select first_dt, last_dt 
    from ybx_ash_rep r where r.id = ( select max (r2.id) from ybx_ash_rep r2 )
  )
  select count (*)
      --, min (sample_time) , max(sample_time)
      , substr ( ya.root_request_id::text, 1, 9)    as    top_root_req
      , ya.query_id                                 as    top_qry
      , max ( substr ( query, 1, 100)  )            as    Query
  from ybx_ash      ya
     , ybx_pgs_stmt q
     , intv         i
  where 1=1
  and   ya.sample_time between i.first_dt and i.last_dt
  and   q.queryid                 =     ya.query_id
  and   ya.root_request_id::text  not   like '000%'
  group by ya.root_request_id , ya.query_id
  order by 1 desc
  limit 40;

EOF



