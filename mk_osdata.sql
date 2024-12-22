-- 
-- mk_osdata.sql: tables to collect os-data for logging
-- 
-- other files : unames.sh, unames.sql : collect data using uname
-- 
-- get os data from program or file into tbl, then parse..
-- we start by collecting "sample data".
-- the abstract of "parent tables" can wait: Host, Cluster, Universe, Master, TSever..
-- 
-- todo datamodel:
--  - parent tables for node, mster, tserver, with static data (names, OS, UUID), no log-time
--  - introduce "snapshot_id": point-in-time where multiple data (node, master, tserver) is colletcted
--  - introduce master-records: host (name, ip, os, processors..) univese, cluster, also : table.. ?
--  - loging for master and tserver entitis separate tables ? scrape from yb-admin and yb-functions()
--  - nr_postgres_procs : separate count for postgres procs ? 
--
-- todo process
--  - use unames.sh to find OS-related data 
--  - use yb-admin to find masters + tservers
--  - determine interval, 1 min? 3 min ? 
-- 
-- other files:
--  - unames.sh + SQL: 
-- 

/*

-- helper tables
drop table ybx_kvlog ;
drop table ybx_intf ;

-- real tables
drop table ybx_host_log ;
drop table ybx_host_mst ;

drop table ybx_mast_log ;
drop table ybx_mast_mst ;

drop table ybx_tsrv_log ;
drop table ybx_tsrv_mst ;

*/

-- drop table ybx_kvlog ;
create table ybx_kvlog (
  host text not null default ybx_get_host()
, key text not null
, value text
, constraint ybx_kvlog_pk primary key ( host, key ) 
);

-- poll data from host..

create table ybx_host_log ( 
  id                bigint generated always as identity primary key
, host              text        not null
, log_dt            timestamp   default now()
, nr_processes      int           -- possibly ps -ef | wc -l
, master_mem        bigint        -- from 7000/memz?raw
, tserver_mem       bigint        -- from 9000/memz?raw
, disk_usage_mb     bigint        -- from du -sm /root/var
, nr_local_tablets  bigint        -- possibly tsever-property
, top_info          text          -- 2nd line of top -n2
) ;

-- master_logging

create table ybx_mast_log (
  ms_uuid  text primary key
, host     text
, log_dt   timestamp default now()
, port     int
, role     text
, state    text
, bcasthp  text
) ;




