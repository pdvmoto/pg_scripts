
-- queries to collect rr_ids, and their related data: rr_qry, session..

/*

Questions: 
  - how to determine RR is really over ? 
  - need indicator if rr still running ? e.g. found new ash on last poll ? 
  - query_id does not belong in rr, possibly only toplevel sql, 
    but how do we know if a running sql is toplevel?
  - shouldnt we includ sess_id right away ? 
  - dur(ation) : sec? ms ? float ? 
  - do we need log_host and log_dt for completeness?  => not yet, later.
  - do we need a snapshot (snap_id) ?
    to facilitate linking rr to sess and tsrv/host (as sessions come+go)

*/

\timing off

drop view ybx_rrqs_mvw ; 

   drop table ybx_rrqs_big ;
 create table ybx_rrqs_big (
  id          bigint generated always as identity primary key
, sess_id     bigint      -- sess_id, bcse tsrv+pid not unique over time
, tsrv_uuid   uuid
, pid         bigint 
, host        text        -- just information: host where top-id originates
, rr_uuid     uuid 
, rr_min_dt   timestamp with time zone 
, rr_max_dt   timestamp with time zone 
, dur_ms      bigint  -- optional, diff between max/min.
-- client-info, app, ..
-- fk to tsrv_uuid, 
-- fk to sess_id, (implies fk to tsrv, as session is linked to tsrv?)
-- fk to qury_mst
-- 
);


insert into ybx_rrqs_big (
  sess_id
, tsrv_uuid
, pid     
, host   
, rr_uuid 
, rr_min_dt 
, rr_max_dt
, dur_ms  
)
select  
  sm.id
, al.top_level_node_id 
, sm.pid
, sm.host
, al.root_request_id 
, min ( al.sample_time ) 
, max ( al.sample_time ) 
, extract ( epoch from ( max ( al.sample_time ) - min ( al.sample_time ) ) ) * 1000 as dur_ms
-- , count ( distinct top_level_node_id ) cnt_top_node
-- , count (distinct pid ) cnt_pid
-- , count ( distinct query_id ) qry
-- , count ( distinct sample_time ) cnt_smpl
 from ybx_ashy_log al 
    , ybx_sess_mst sm
 where  1=1
   and al.top_level_node_id       = sm.tsrv_uuid
   and al.pid                     = sm.pid  -- need time-frame criterium as well...!!
   and al.root_request_id::text   not like '0000%'
   and  al.sample_time > now() - interval '1 hour'
group by 1, 2, 3, 4, 5
;
 
-- smaller version
-- if using this: needs a view to join relevant sess and duration-ms..
   drop table ybx_rrqs_mst ;
 create table ybx_rrqs_mst (
  id          bigint generated always as identity primary key
, sess_id     bigint      -- sess_id, bcse tsrv+pid not unique over time
, rr_uuid     uuid 
, rr_min_dt   timestamp with time zone 
, rr_max_dt   timestamp with time zone 
-- client-info, app, ..
-- fk to tsrv_uuid, 
-- fk to sess_id, (implies fk to tsrv, as session is linked to tsrv?)
-- fk to qury_mst
-- 
);

insert into ybx_rrqs_mst (
  sess_id
, rr_uuid 
, rr_min_dt 
, rr_max_dt
)
select  
  sm.id
, al.root_request_id 
, min ( al.sample_time ) 
, max ( al.sample_time ) 
-- , count ( distinct top_level_node_id ) cnt_top_node
-- , count (distinct pid ) cnt_pid
-- , count ( distinct query_id ) qry
-- , count ( distinct sample_time ) cnt_smpl
 from ybx_ashy_log al 
    , ybx_sess_mst sm
 where  1=1
   and al.top_level_node_id       = sm.tsrv_uuid
   and al.pid                     = sm.pid  -- need time-frame criterium as well...!!
   and al.root_request_id::text   not like '0000%'
   and  al.sample_time > now() - interval '1 hour'
group by 1, 2
;
   
-- consider joining: database, username
create or replace view ybx_rrqs_mvw as 
select 
  sm.id           as sess_id
, sm.tsrv_uuid   
, sm.pid        
, sm.backend_start 
, sm.host         as host  -- should really be a join
, rm.id           
, rm.rr_uuid
, rm.rr_min_dt
, rm.rr_max_dt
, extract ( epoch from ( rm.rr_max_dt - rm.rr_min_dt ) ) * 1000 as dur_ms
, sm.app_name
from ybx_rrqs_mst rm
   , ybx_sess_mst sm
where rm.sess_id = sm.id
;
 

-- now use the rr table to pick up queries per rr..
-- later: pick min/max sample-times per node..
-- for now: just link rr to query
-- detailed reporting per rr can use ashy_log, order by sample-time

  drop table ybx_qurr_lnk ; 
create table ybx_qurr_lnk (
  queryid   bigint
, rr_id     bigint
, constraint ybx_qurr_lnk_pk primary key ( queryid, rr_id ) 
-- fk to rr,
-- fk to qry
) ; 

insert into ybx_qurr_lnk ( rr_id, queryid ) 
select distinct 
  rm.id 
, al.query_id  
from ybx_rrqs_mst rm
   , ybx_ashy_log al
where 1=1
  and rm.rr_uuid = al.root_request_id -- assume rr is unique
;


-- now we can run a time-ordered list of activities per RR:

-- select session + RR data..
-- from sess: sess, host, app, backend start, 
--    - from rr: root_req
--       - from ashy: hhmmss.ms, node(10), evenbt (25), 
--          - qry (subtr 60?)
--          - table or tablet if appropriate..
--            for indent, use select 'string' || chr(10) || '  more ' ;
select 
from ybx_rrqs_mst rm
where rm.root_request_id = ''::uuid

-- show queries for the rr..
-- (here, some chronological orde would benefit...)

-- select the ASH-log data per rr and per query
-- time hh:mm:ss.ms (order by)
-- host - node
-- query (first part of sql)
-- event
-- tablet [+table] if appropriate



