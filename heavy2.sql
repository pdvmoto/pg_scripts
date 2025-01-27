-- something with extreme joins..

\timing on 

-- collect this session

select /* pause-start */ pg_sleep ( 1) as startp; 

select ybx_get_sess() as sess;

-- some impossible heavy join..

select /* funny01 */ substr ( t.payload, 800, 2) as pl 
, al.pid
, sm.backend_start
, count ('x') cnt
, min ( qm.log_dt ) q_dt
from  t_rnd t 
    , ybx_ashy_log al
    , ybx_sess_mst sm
    , ybx_qury_mst qm
where al.id = t.id -- easy join
  and al.pid = sm.pid 
  and al.query_id = qm.queryid
group by 1, 2, 3
order by 4 desc  ; 

select /* pause-2nd */ pg_sleep ( 1) as startp; 

select f_fill_t (1000), f_fill_t_rndm (1000) , now () ; 
select f_fill_t_rndm (1000), f_fill_t (1000) , now () ; 

select /* pause-3d */ pg_sleep ( 1) as startp; 

select
	-- sm.id,
	sm.pid ,
	-- rm.rr_uuid,
	-- rq.queryid,
  sm.backend_start,
  al.wait_event_aux,
	substr ( qm.query, 1, 40 ) 
	, count ( distinct al.rpc_request_id )
--	, max ( sl.xact_start)
--	, min ( sl.xact_start)
from ybx_sess_mst sm
  ,	ybx_rrqs_mst rm
  , ybx_qurr_lnk rq
  , ybx_qury_mst qm
  , ybx_sess_log sl
  , ybx_qury_log ql
  , ybx_ashy_log al
where 1=0 --]
  and  rm.sess_id  = sm.id
  and sm.id       = sl.sess_id
	and rm.id       = rq.rr_id
	and rq.queryid  = qm.queryid
	and qm.queryid  = ql.queryid
	and al.pid      = sm.pid
	and trunc ( ql.min_exec_time/1000 ) = 2 
  and sm.pid      < 14000
group by 1,2,3,4
order by
	sm.backend_start ; 

select pg_sleep (1) ; 

select /* funny02 */ min(id), max(id)
, min ( created_dt) min_dt
, max ( created_dt) as masx_dt, count (*) as cnt 
from t_lll ;

select pg_sleep (1) ; 

-- need a long insert.. 
insert /* funny03 */ into t_lll ( created_dt, payload )
select sample_time, wait_event_aux 
from ybx_ashy_log al
where al.sample_time between now()-interval '2 hour' and  now();

select pg_sleep(1) ; 

-- show pid
select pg_sleep ( 1) exit_pause, pg_backend_pid() as pid ;


