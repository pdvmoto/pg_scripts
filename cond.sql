
-- based on nr seconds since last snapshot: decide to go or nogo

with l as ( select max (log_dt) as last_snap from ybx_snap_log  )
select 
     trunc ( EXTRACT (EPOCH FROM (now () - l.last_snap) ) )                as ela_sec
,  ( trunc ( EXTRACT (EPOCH FROM (now () - l.last_snap) ) ) < 120 )::text  as nogo
from l 
\gset 

select :ela_sec as last_was_sec_ago
, :nogo as go_nogo; 


-- based on nr seconds since last snapshot: decide to go or nogo
\if :nogo

  select :ela_sec as secs, 'since last snap, was recent, hence exiting...' as exit_message ; 

  \quit

\endif

select 'exit cond was false, time to do another snapshot...' ; 

