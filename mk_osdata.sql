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
--  - universe and cluster ? collect the json string into ybx_unvr_log
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

-- real tables, in correct order

drop table ybx_host_log ;
drop table ybx_host_mst ;

drop table ybx_mast_log ;
drop table ybx_mast_mst ;

drop table ybx_tsrv_log ;
drop table ybx_tsrv_mst ;

drop table ybx_univ_log ; 
drop table ybx_univ_mst ; 

drop table ybx_snap_log ; 

*/

-- drop table ybx_kvlog ;
create table ybx_kvlog (
  host text not null default ybx_get_host()
, key text not null
, value text
, constraint ybx_kvlog_pk primary key ( host, key ) 
);


-- catch data from yb-admin with | as sep 
-- use split_part to cut out items..
-- drop table ybx_intfc ; 
create table ybx_intf (
  id      bigint          generated always as identity primary key
, log_dt  timestamp       default now () 
, host    text            default ybx_get_host ()
, slurp   text
) ;

-- the main snapshot table. parent-FK to some of the logs
create table ybx_snap_log (
  id        bigint generated always as identity primary key
, log_dt    timestamp default now () 
, host      text      -- generated on which host
, duration_ms bigint  -- measure time it took to log
) ; 

-- universe data
create table ybx_univ_log ( 
  snap_id     bigint  not null              -- fk to snapshot 
, univ_uuid   text    not null
, log_dt      timestamp default now ()      -- can also come from snapshot
, log_host    text default ybx_get_host ()  -- can also come from snapshot
, clst_uuid   text 
, version     int
, info        text -- just grab the json, can always filter later
, constraint ybx_univ_log_pk primary key ( snap_id, univ_uuid ) 
, constraint ybx_univ_log_fk_snap foreign key ( snap_id ) references ybx_snap_log ( id ) 
) ; 

-- add: master + tserver to link universe and hosts to mast + sever 


-- poll data from host., poll per host.

-- drop table ybx_host_log ;
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

-- drop table ybx_mast_mst ; 
create table ybx_mast_mst ( 
  snap_id     bigint
, host        text
, mast_uuid   text 
, constraint ybx_mast_mst_pk primary key ( host, mast_uuid )
, constraint ybx_mast_mst_fk_snap foreign key ( snap_id ) references ybx_snap_log ( id ) 
) ; 

-- drop table ybx_mast_log ; 
create table ybx_mast_log (
  snap_id     bigint  not null              -- fk to snapshot 
, mast_uuid   text 
, host        text
, log_dt      timestamp default now()
, port        int
, role        text
, state       text
, bcasthp     text
, constraint ybx_mast_log_pk primary key ( snap_id, mast_uuid ) 
, constraint ybx_mast_log_fk_snap_fk foreign key ( snap_id ) references ybx_snap_log ( id ) 
) ;

-- drop table ybx_tsrv_mst ;
create table ybx_tsrv_mst ( 
  snap_id     bigint
, host        text
, tsrv_uuid   text 
, constraint ybx_tsrv_mst_pk primary key ( host, tsrv_uuid )
, constraint ybx_tsrv_mst_fk_snap foreign key ( snap_id ) references ybx_snap_log ( id ) 
) ; 

-- drop table ybx_tsrv_log ; 
create table ybx_tsrv_log (
  snap_id     bigint not null -- fk
, tsrv_uuid   text
, host        text
, log_dt      timestamp default now()
, port        int
, hb_delay_s  int
, status      text
, rd_psec     real
, wr_psec     real
, uptime      bigint
, constraint ybx_tsrv_log_pk primary key ( snap_id, tsrv_uuid ) 
, constraint ybx_mast_log_fk_snap_fk foreign key ( snap_id ) references ybx_snap_log ( id ) 
) ;



