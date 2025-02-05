
-- .psqlrc
-- use this if a .psqlrc is allowed/needed
-- 
-- usage : initialize a session in psql
--
-- set prompt  to know "where we are"
-- \set PROMPT1 '%n @ %/%R> '
--
-- remember: if date/time is needed: \set PROMPT1 = ' `date +%H:%M:%S`  %n@%m:%/%R%# '
-- date +%H:%M:%S
-- select '\set PROMPT1 `date  +%H:%M:%S` '' @ %/ @ '
-- date is login-time, need to experiment with now() in prompt
--

-- no pager
\pset pager  0 

-- experiment
\set PROMPT1 '%n @ %/ @ %m  %R> '

-- old habit
\set ed '\\! vi '

-- select 'Welcome to psql' as welcome;

\set PROMPT1 '%n @ %/%R > '

-- some YUGABYTE specifics...
\set        x 'explain ( analyze, dist ) '
\set       xd 'explain ( analyze, dist, debug ) '
\set       xp 'explain ( analyze, buffers, wal) '
\set tblinfo 'select oid, num_tablets as tblts, is_colocated as col, relname, ( size_bytes / 1024 / 1024) size_mb, table_id from ybx_tblinfo '
\set tsizes 'select oid, num_tablets as tblts, is_colocated as col, relname, ( size_bytes / 1024 / 1024) size_mb, table_id from ybx_tblinfo where size_bytes is not null order by size_mb nulls first ;' 
-- \set servers 'select * from yb_servers () order by host ;'
\set    servers 'select host, port, num_connections as conns, uuid from yb_servers() order by host ;'

\set   split 'split into 8 tablets '

\set ybxl 'select * from ybx_log order by 2 ;'
-- \set ybxl 'select host, to_char  (  logged_dt, ''HH24:MI:SS'') as dt, component, ela_ms, info_txt from ybx_log order by logged_dt ; '
\set ybxl 'select host, to_char  (  logged_dt, ''HH24:MI:SS'') as dt, component, to_char ( ela_ms, ''99,999'') as ms, info_txt from ybx_log order by logged_dt ; '

\set cronj 'select jobid, job_pid, command, status, return_message from cron.job_run_details order by start_time ; '
\set crons 'select jobid, job_pid, command, status, return_message rtrn_msg , to_char ( start_time, ''DD HH24:MI:SS'' ) st_dt , to_char ( end_time, ''HH24:MI:SS'' ) end_dt from cron.job_run_details order by start_time ; '

-- logging..
\set nodelogs 'select to_char  (  log_dt, ''HH24:MI:SS'') as dt , hl.host, nr_processes procs , trunc ( master_mem/(1024*1024) ) mstr_mem_mb , trunc ( tserver_mem/(1024*1024) ) tsrv_mem_mb , disk_usage_mb from ybx_host_log hl order by log_dt ;'


-- some COCKROACH specifics
-- \set x 'explain analyze (distsql) '
-- \set servers_old 'select * from crx_vnodes order by ndname ;'
-- \set nodes 'select ndname, node_id, sql_addr, live, rgs, les from crx_vnodes union all select ''(~~) totals:'', null, '' '', ''  '', sum(rgs), sum(les) from crx_vnodes order by 1; ' 
-- \set servers 'select ndname, node_id, sql_addr, live, rgs, les from crx_vnodes union all select ''z totals:'', null, '' '', ''  '', sum(rgs), sum(les) from crx_vnodes order by 1; ' 

-- generic defines
\set   minmax 'select to_char ( min(id), ''999,999,999'' ) min_id, to_char ( max(id), ''999,999,999'' ) as max_id, to_char ( count (*), ''999,999,999'' ) as cnt from '
\set     cnt2 'select count (*) from ' 
\set     cnt  'select to_char ( count (*), ''999,999,999'') from '
\set     who '\\i who.sql ' 

-- make an extra effort for the prompt..
\t
\o a.out

-- yugabyte and postgres:
select '\set PROMPT1 '' %n @ %/ @ '
|| pg_backend_pid() || '-'
|| setting
|| ' %R> '' '
FROM pg_settings
WHERE name='listen_addresses';

-- cockroach
select '\set PROMPT1 '' %n @ %/ @ '
|| pg_backend_pid() || '-'
|| nodename 
|| ' %R> '' '
from crx_vnodeinfo; 

-- yugabyte and postgres:
select '\set PROMPT1 '' %n @ %/ @ '
|| pg_backend_pid() || '-'
|| setting
|| ' %R> '' '
FROM pg_settings
WHERE name='listen_addresses';

-- yugabyte and postgres:
select '\set PROMPT1 '' %n @ %/ @ '
|| pg_backend_pid() || '-'
|| setting
|| ' %R> '' '
FROM pg_settings
WHERE name='listen_addresses';

\o
\t

\i a.out

\echo  your dflt directory is ; \! pwd 

-- select host, num_connections, zone, uuid from yb_servers () order by host;

:servers 

select version() as Version ; 

select 'this was .psqlrc from ~pdvbv' as which_rc_was_this; 

select ybx_get_host() as your_host
, pg_backend_pid () as your_pid 
, substr ( version(), 1, 30 ) your_version ;

\! echo . 


