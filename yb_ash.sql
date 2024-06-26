

select h.sample_time, h.root_request_id, h.rpc_request_id, h.wait_event_component, h.query_id, h.ysql_session_id  , s.query
from yb_active_session_history h 
, pg_stat_statements s
where h.query_id = s.queryid
and sample_time >= now()-interval ' 11600, second'
-- and query like '%count%'
order by s.queryid, sample_time ;

~                                                                                                                                                                                       
~                                        
