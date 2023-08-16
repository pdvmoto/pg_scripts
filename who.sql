
-- first start : look at pg_stat_activity.
-- later: group by database, usenaem, client, or activity

select  usename, state, wait_event_type, wait_event, query, pid   from pg_stat_activity;

select usename, pid, application_name , query
from pg_stat_activity
where state='active'; 


