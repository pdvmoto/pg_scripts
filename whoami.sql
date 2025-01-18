
select current_user ; 

-- first select session, pid, client_ip..
-- note: replace distinct by max of sample-time
select /* itsme */
  ybx_get_host() host 
, act.pid
, max ( ash.client_node_ip )  clnt_node_ip
from pg_stat_activity act
   , yb_active_session_history ash
where 1=1 
and ash.pid = act.pid
and act.state = 'active'
and act.query like '%itsme%'
and pg_sleep ( 2 ) is not null 
group by 1, 2
;

-- use session to select local history from memory
-- note: replace distinct by max ?
with sess as ( select /* itsme */ distinct ybx_get_host() host , act.pid pid
, ash.client_node_ip client_node_ip
-- consider splitting client ip and port
from pg_stat_activity act
   , yb_active_session_history ash
where ash.pid = act.pid
  and act.query like '%itsme%'
  and act.state = 'active'
)
select to_char ( ash.sample_time, 'HH24:MI:SS.MS') hhmmss
, ash.wait_event
, ash.query_id
, substr ( replace ( stm.query, chr(10), ' ' ), 1, 100 ) as stmnt
from sess                       ses 
   , yb_active_session_history  ash
   , pg_stat_statements         stm
where 1=1
  and ash.pid = ses.pid
  and stm.queryid = ash.query_id
order by ash.sample_time ;

 
-- use session-info to also show stored history of  session..
select /* itsme */ ybx_get_host() host , act.pid
, ash.client_node_ip
, to_char ( ash.sample_time, 'HH24:MI:SS.MS') hhmmss
, ash.wait_event
, ash.query_id
, stm.query
-- , act.* 
from pg_stat_activity           act
   , yb_active_session_history  ash
   , pg_stat_statements         stm
where 1=1 
and ash.pid = act.pid
and act.query like '%itsme2%'
and stm.queryid = ash.query_id
order by ash.sample_time ; 
 

\conninfo

