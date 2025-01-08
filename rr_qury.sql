
-- The following SQLs were done in DBeaver... 
-- running them on a terminal, the output can be confusing, wide.

-- I started by spotting RR with multiple query-ids,
-- e.g. an RR can process >1 query

select ash.root_request_id multiqry, count (distinct query_id) cnt 
  --, ash.* 
  from yb_active_session_history ash
  where ash.root_request_id != '00000000-0000-0000-0000-000000000000'
    and ash.top_level_node_id != '00000000-0000-0000-0000-000000000000'
  group by 1 
  having count (distinct query_id) > 1 
 order by 2 desc ;
  
  
-- now to inspect some of those queries and their wait-evnts.
-- I can confirm that in my data, also looking at qry-text,
-- the queries of a single rr Do come from the same session.
-- And in the correct order (sample_time..)
-- But at thist point, the root-requests Seem to correspond to >1 SQL ? 
-- Caveat: my sql may be doubtful as well.. ? 

with rr_multi_query as ( 
  select ash.root_request_id multiqry, count (distinct query_id) cnt 
  --, ash.* 
  from yb_active_session_history ash
  where ash.root_request_id != '00000000-0000-0000-0000-000000000000'
    and ash.top_level_node_id != '00000000-0000-0000-0000-000000000000'
  group by 1 
  having count (distinct query_id) > 2 
  )
select a.root_request_id , a.sample_time, a.query_id, qry.query, a.wait_event 
from yb_active_session_history a
   , pg_stat_statements qry
where a.root_request_id  in ( select multiqry from rr_multi_query )
  and qry.queryid = a.query_id 
  --and a.sample_time > (now () - interval '300 sec') 
order by a.root_request_id , a.sample_time
;

